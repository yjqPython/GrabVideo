from GrabVideo.Utils.mssqlUtil import MssqlHelper
import settings


# Define your item pipelines here
#
# Don't forget to add your pipeline to the ITEM_PIPELINES setting
# See: https://doc.scrapy.org/en/latest/topics/item-pipeline.html


class GrabvideoPipeline(object):
    def process_item(self, item, spider):
        if spider.name == "Proxy_Spider":
            self.deal_ip(item)
        elif spider.name == "Video_Spider":
            self.deal_vedio(item)
        return item

    def deal_ip(self, item):
        proxy_list = item["proxy_info_list"]
        for proxy_info in proxy_list:
            sql_helper = MssqlHelper(settings.Mssql_Setting)
            sql_helper.execute("SELECT FID FROM Spider_IP WHERE FIP=%s and FPort=%s", (proxy_info.ip, proxy_info.port))
            row = sql_helper.cursor.fetchall()
            row_count = sql_helper.cursor.rowcount
            if row_count > 0:
                sql_helper.execute(
                    "UPDATE Spider_IP SET FCountry=%s,FProxyType=%s,FLastTestTime=%s,FStatus=%s,FModifytime=getdate() where FIP=%s and FPort=%s",
                    (proxy_info.country, proxy_info.type, proxy_info.last_text_time, proxy_info.state, proxy_info.ip, proxy_info.port))
            else:
                sql_helper.execute(
                    "INSERT INTO Spider_IP(FIP,FPort,FCountry,FProxyType,FLastTestTime,FStatus,FAddtime,FModifytime) VALUES(%s,%s,%s,%s,%s,%s,getdate(),getdate())",
                    (proxy_info.ip, proxy_info.port, proxy_info.country, proxy_info.type, proxy_info.last_text_time, proxy_info.state))
            sql_helper.commit_tran()
            sql_helper.close_cursor()
            sql_helper.close()

    def deal_vedio(self, item):
        video_info_list = item["video_info_list"]
        if video_info_list is not None and len(video_info_list) > 0:
            for video_info in video_info_list:
                sql_helper = MssqlHelper(settings.Mssql_Setting)
                sql_helper.execute("SELECT FID FROM Spider_Video WHERE FFromSiteID=%s and FVideoKey=%s",
                                   (video_info.form_site_id, video_info.video_key))
                row = sql_helper.cursor.fetchall()
                row_count = sql_helper.cursor.rowcount
                if row_count > 0:
                    sql_helper.execute(
                        "UPDATE Spider_Video SET FVideoTitle=%s,FVideoImgurl=%s,FVideoPageLink=%s,FVideoUrl=%s,FVideoDuration=%s,FModifytime=getdate() where FFromSiteID=%s and FVideoKey=%s",
                        (video_info.video_title, video_info.video_img, video_info.video_pagelink, video_info.video_url, video_info.video_duration,
                         video_info.form_site_id, video_info.video_key))
                else:
                    sql_helper.execute(
                        "INSERT INTO Spider_Video(FFromSiteID,FVideoKey,FVideoTitle,FVideoImgurl,FVideoPageLink,FVideoUrl,FVideoDuration,FAddtime,FModifytime) VALUES(%s,%s,%s,%s,%s,%s,%s,getdate(),getdate())",
                        (video_info.form_site_id, video_info.video_key, video_info.video_title, video_info.video_img, video_info.video_pagelink,
                         video_info.video_url, video_info.video_duration))
                sql_helper.commit_tran()
                sql_helper.close_cursor()
                sql_helper.close()
