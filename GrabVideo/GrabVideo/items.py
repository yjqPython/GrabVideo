# -*- coding: utf-8 -*-

# Define here the models for your scraped items
#
# See documentation in:
# https://doc.scrapy.org/en/latest/topics/items.html

import scrapy


class GrabvideoItem(scrapy.Item):
    # define the fields for your item here like:
    # name = scrapy.Field()
    pass


class ProxyItem(scrapy.Item):
    proxy_info_list = scrapy.Field()


class ProxyInfo(object):

    def __init__(self, ip, port, country, type, addtime, last_text_time, state):
        self.ip = ip
        self.port = port
        self.country = country
        self.type = type
        self.addtime = addtime
        self.last_text_time = last_text_time
        self.state = state


class VideItem(scrapy.Item):
    video_info_list = scrapy.Field()


class VideoInfo(object):
    def __init__(self, form_site_id, video_key, video_title, video_img, video_pagelink, video_url, video_duration):
        self.form_site_id = form_site_id
        self.video_key = video_key
        self.video_title = video_title
        self.video_img = video_img
        self.video_pagelink = video_pagelink
        self.video_url = video_url
        self.video_duration = video_duration
