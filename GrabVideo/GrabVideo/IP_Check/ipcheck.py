import requests
from GrabVideo.Utils.mssqlUtil import MssqlHelper
import GrabVideo.settings as settings

headers = {
    'Host': "map.baidu.com",
    "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8",
    "Accept-Encoding": "gzip, deflate",
    "Accept-Language": "en-US,en;q=0.5",
    "Connection": "keep-alive",
    "User-Agent": "Mozilla/5.0 (X11; Ubuntu; Linux x86_64; rv:39.0) Gecko/20100101 Firefox/39.0"
}


def load_all_need_check_site_list():
    sql_helper = MssqlHelper(settings.Mssql_Setting)
    sql_helper.execute("SELECT FID,FIPCheckUrl FROM Spider_Video_Site WHERE FIsNeedCheck=1")
    row = sql_helper.cursor.fetchall()
    sql_helper.close_cursor()
    sql_helper.close()
    return row


def load_all_ip():
    sql_helper = MssqlHelper(settings.Mssql_Setting)
    sql_helper.execute("SELECT FID,FIP,FPort,FProxyType FROM Spider_IP")
    row = sql_helper.cursor.fetchall()
    sql_helper.close_cursor()
    sql_helper.close()
    return row


def check_ip(ip, check_site):
    ipaddress = "http://{0}:{1}".format(ip[1], ip[2])
    proxie = {ip[3]: ipaddress}
    try:
        r = requests.get(check_site[1], headers=headers, timeout=10, proxies=proxie)
        if r.status_code == requests.codes.ok:
            procss_time = r.elapsed.total_seconds()
            sql_helper = MssqlHelper(settings.Mssql_Setting)
            sql_helper.execute("SELECT * FROM Spider_Site_IP WHERE FSiteID=%d AND FIPID=%d", (check_site[0], ip[0]))
            row = sql_helper.cursor.fetchall()
            row_count = sql_helper.cursor.rowcount
            if row_count > 0:
                sql_helper.execute("UPDATE Spider_Site_IP SET FResponseTime=%s,FModifytime=GETDATE() WHERE FSiteID=%d AND FIPID=%d",
                                   (procss_time, check_site[0], ip[0]))
            else:
                sql_helper.execute(
                    "INSERT INTO Spider_Site_IP(FSiteID,FIPID,FResponseTime,FAddTime,FModifytime) VALUES(%s,%s,%s,GETDATE(),GETDATE())",
                    (check_site[0], ip[0], procss_time))
            sql_helper.commit_tran()
            sql_helper.close_cursor()
            sql_helper.close()
        else:
            sql_helper = MssqlHelper(settings.Mssql_Setting)
            sql_helper.execute("DELETE Spider_Site_IP WHERE FSiteID=%d AND FIPID=%d", (check_site[0], ip[0]))
            sql_helper.commit_tran()
            sql_helper.close_cursor()
            sql_helper.close()
    except Exception, e:
        print Exception, e
        sql_helper = MssqlHelper(settings.Mssql_Setting)
        sql_helper.execute("DELETE Spider_Site_IP WHERE FSiteID=%d AND FIPID=%d", (check_site[0], ip[0]))
        sql_helper.commit_tran()
        sql_helper.close_cursor()
        sql_helper.close()


def main():
    need_check_site_list = load_all_need_check_site_list()
    if need_check_site_list is not None and len(need_check_site_list) > 0:
        ip_list = load_all_ip()
        if ip_list is not None and len(ip_list) > 0:
            for ip in ip_list:
                for check_site in need_check_site_list:
                    if check_site[1].startswith(ip[3] + ":"):
                        check_ip(ip, check_site)


if __name__ == "__main__":
    main()
