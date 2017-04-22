---
title: python爬虫学习(一)
date: 2016-12-19 21:35:47
tags: [python,爬虫]
---

好几次因为不同的需要用到网络爬虫，于是到网上看了不少大神的博客，收益匪浅。下面把自己零零散散地学了一点相关的知识整理下来，方便自己和看到这篇博客的你。
Python环境3.5
### 1.爬虫大概

> 网络蜘蛛（Web spider）也叫网络爬虫（Web crawler）[1]，蚂蚁（ant），自动检索工具（automatic indexer），或者（在FOAF软件概念中）网络疾走（WEB scutter），是一种“自动化浏览网络”的程序，或者说是一种网络机器人。它们被广泛用于互联网搜索引擎或其他类似网站，以获取或更新这些网站的内容和检索方式。它们可以自动采集所有其能够访问到的页面内容，以供搜索引擎做进一步处理（分检整理下载的页面），而使得用户能更快的检索到他们需要的信息。
>
> ​                                                                                                                                    --引自[Wikipedia词条网络蜘蛛](https://zh.wikipedia.org/wiki/%E7%B6%B2%E8%B7%AF%E8%9C%98%E8%9B%9B)

### 2.初学者

作为初学者，我只想快速实现爬虫，爬虫的量也不大，那么我该怎么开始呢 ？

首先介绍几个比较好的爬虫学习的地方:

[<font color="#EE1196"> 知乎：如何入门python爬虫</font>](https://www.zhihu.com/question/20899988),   对于小白，这永远是个快速寻找和学习知识的好地方

[<font color="#EE1196"> 静觅的Python爬虫学习系列教程</font>](http://cuiqingcai.com/1052.html)，也是一个很厉害的博主写的爬虫教程

我主要是通过以上两个地方来学爬虫，当然，遇到问题也会去google，看看[<font color="#44BB74">segmentfault</font>]上大家有没有遇到相关的问题。

### 3.基础知识

我只是掌握一点Python常用知识的小白，然后就匆匆上马爬虫了，下面列出我常用的爬虫或者辅助的python包
- <font color="#EE1196">urllib</font> 
  主要是调用里面的request来递交网页请求的  
- <font color="#EE1196">bs4</font>
  Beautifulsoup是爬虫分析的必备神器        
- <font color="#EE1196">selenium</font>
  可以用来模拟agent对网页操作的包，配上PhantomJS这个无界面的网页浏览器，基本可以对付很多限制爬虫的网站了
- <font color="#EE1196">re</font>Beautifulsoup
  用来帮助你使用正则表达的包，不过一般的网页的结构化都做的很好，经过Beautifulsoup解析后，基本很少会用到re
当然了，基本的Python能力也是要有的
另外，scrapy这个爬虫框架据说也是大杀器，但基本没用过，以后可以试着用用写一下
### 4.例子
这里，我用几个例子来说明如何去使用这些包做基本的爬虫
先导入urllib.request
```python
import urllib.request
```
假设我们要访问的网页是："http://baidu.com"
```python
url = "http://baidu.com"
htmlpage = urllib.request.urlopen(url).read().decode('gb2312','ignore')
```
上述代码实现了对网页的访问、读取、gb2312的转码
然后，我们就可以使用Beautifulsoup来对htmlpage的结构进行解析了，至于一个标准网页的源码的结构是怎样的，建议大家可去W3Cschool去看看
```python
from bs4 import BeautifulSoup
soup = BeautifulSoup(htmlpage,"xml")
#soup = BeautifulSoup(htmlpage,"lxml")
body = soup.body
```
如大家所见，我们很快就把一个网页源码的body部分提取出来了。
然后，我们可以用find_all或者find函数来查找你需要爬的部分,比如“li”,"div"等结构里的内容，具体使用可以参看相关的博客。如果你用的是chrome,你可以在工具一栏里找到开发人员工具，然后找到你要爬的内容的位置。
你可以使用.get()来寻找引用链接'href'，或者'a'之间的内容
总之，你要记住，html语言是一门非常强调结构化的语言，而爬虫的过程需要你尽可能利用它的结构化来减少编程的工作量
