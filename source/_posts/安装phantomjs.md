---
title: 安装phantomjs
date: 2016-12-21 22:02:38
tags: [phantomjs,爬虫，软件安装]
---

Phantomjs是一款特别的浏览器，说它特别，主要是它是完全没有界面的，以至于不能称之为浏览器 ，但是用来做自动化浏览器开发测试却再好不过了。安装phantomjs主要是为了爬虫的需要。最简单的，如果网页上需要你点击下一页，也就是一个点击事件，才能获得浏览，而这种浏览不会转移网页地址，那么用传统的静态网页爬虫就比较难处理了。于是，我转向了phantomjs。利用python的selenium包加上phantomjs简直很强大。当然，你也可以用chrome或者firefox作为webdriver使用的浏览器。但要加额外的插件哟。
ubuntu下安装很简单，用apt命令就好。
但是很快我就发现，调用用webdriver的find_element函数会出错：
> WebDriverException: Message: Error - Unable to load Atom 'find_element' from file ':/ghostdriver/./third_party/webdriver-atoms/find_element.js'

看了stackoverflow上的评论，才发现这是apt默认安装会导致的错误，需要你自己源码安装或者用npm来安装,记得用apt把之前装的phantomjs删掉
```shell
sudo apt purge phantomjs
sudo npm install -g phantomjs-prebuilt
```
