# coding=utf-8
import scrapy
import re
from GrabVideo.items import ProxyInfo, ProxyItem
import time


class ProxySpider(scrapy.Spider):
    name = "Proxy_Spider"
    start_urls = [
        "https://www.autohome.com.cn/grade/carhtml/A.html"
    ]

    def grab_proxy(self, response):
        proxy_list_json = []
        proxy_list_json = self.re_html_code(response.text, proxy_list_json)
        proxy_info_list = []
        for proxy_list in proxy_list_json:
            proxy_info = ProxyInfo(proxy_list[0], proxy_list[1], proxy_list[2], proxy_list[3], proxy_list[4], proxy_list[5], proxy_list[6])
            proxy_info_list.append(proxy_info)
        print proxy_info_list
        proxyItem = ProxyItem()
        proxyItem["proxy_info_list"] = proxy_info_list
        return proxyItem

    def re_html_code(self, html_code, proxy_list_json):

        # re正则取出数据
        try:
            re_list_ip = re.findall(r'<td>\d*\.\d*\.\d*\.\d*</td>', html_code)
            re_list_port = re.findall(r'<td>[\d]*</td>', html_code)
            re_list_live_time = re.findall(u'<td>\d*[小时分钟天]+</td>', html_code)
            # print type(html_code),type(r'<td>\d*[小时分钟天]+</td>')
            re_list_time = re.findall(r'<td>\d*-\d*-\d* \d*:\d*</td>', html_code)
            re_list_proxy_type=re.findall(r'<td>(HTTPS|HTTP)</td>', html_code)
            # print re_list_ip
            l = len(re_list_ip)
            for i in range(l):
                PROXY_IP = re_list_ip[i].replace('<td>', '').replace('</td>', "")
                PROXY_PORT = re_list_port[i].replace('<td>', '').replace('</td>', "")
                PROXY_COUNTRY = 'China'
                PROXY_TYPE = re_list_proxy_type[i].replace('<td>', '').replace('</td>', "")
                addtime = re_list_time[i].replace('<td>', '').replace('</td>', "")
                Last_test_time = re_list_live_time[i].replace('<td>', '').replace('</td>', "")
                # print Last_test_time
                # time.sleep(10)
                proxy_status = '1'
                Remarks = 'ly'
                # `id`, `proxy_ip`, `proxy_port`, `proxy_country`, `proxy_type`, `addtime`, `Last_test_time`, `proxy_status`, `Remarks`
                list_i = [PROXY_IP, PROXY_PORT, PROXY_COUNTRY, PROXY_TYPE, addtime, Last_test_time, proxy_status, Remarks]
                # print list_i
                proxy_list_json.append(list_i)

            print proxy_list_json
            return proxy_list_json

        except Exception, e:
            print Exception, e

    def parse(self, response):
        for i in range(0,400):
            url = "http://www.xicidaili.com/nn/{0}".format(i + 1)
            yield scrapy.Request(url=url, callback=self.grab_proxy)
            time.sleep(1)
