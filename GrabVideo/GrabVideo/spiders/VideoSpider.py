# coding=utf-8
import scrapy
import re
from GrabVideo.items import ProxyInfo, ProxyItem
import time


class VideoSpider(scrapy.Spider):
    name="Video_Spider"
    start_urls = [
        "https://www.autohome.com.cn/grade/carhtml/A.html"
    ]

    def parse(self, response):
        for i in range(0,400):
            url = "http://www.xicidaili.com/nn/{0}".format(i + 1)
            yield scrapy.Request(url=url, callback=self.grab_proxy)
            time.sleep(1)