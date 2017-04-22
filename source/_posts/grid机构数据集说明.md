---
title: grid机构数据集说明
date: 2017-03-22 21:58:27
tags: 数据集
---

# grid机构数据集说明

https://www.grid.ac/downloads

这个网站搜集了全世界的机构名，并利用wikipedia,geoname的数据补充了机构的相关数据（位置），主页，wiki页面，以及机构间的关系，机构在不同语言下的名称，缩写等等

在2017-3-8的发布里包含了全世界72,633的机构，其中教育机构有17213家

下载后解压出来，如下：

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yWDhSOXJxZVYvUTBBajdwcGdmbTRPYmRPUUZ6alhmSGFRPT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)

## 1.简单版本

grid.csv是逗号分割并用""做补充分割的文件，第一列是ID，第二列是机构名，第三列是城市，第四列是州，第五列是国家

![](http://imglf.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yY0xxY0dONjd1SFhFdlAzV2lmYW4zK2NodDlsU0plNFNRPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

grid和grid.ttl分别是对应的json和xml格式

## 2.完整版本

full_talbes内的内容比较详细

![](http://imglf1.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yZG02VitIVG1nTkFmVk01Q3o5SytaaEhWRTMxdWFEOHJnPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)



- acronyms.csv 记录了机构的编号与对应缩写

![](http://imglf.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yVE9YT3pkMDFDWkxGcnhUMlEwUkNxMWNQOFpVcnNNbmtRPT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)

- addresses.csv  在grid.csv基础上添加了state_code,country_code,geonames_city_id

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yVmREUjJtSDZQUjVLUXVnem12UmdSdHhRMTZCSHI3UGN3PT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

- aliases.csv 记录了对应的grid_id和机构名
- geonames.csv是机构所在城市在geoname里的数据，包括geoname_id



- institutes.csv 记录了

| grid_id | name | wikipedia_url | email_address | established |
| :-----: | :--: | :-----------: | :-----------: | :---------: |
|         |      |               |               |             |

- labels.csv 记录了不同语言下的机构名

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yYzN1TG85M3I3RFBTampBbWV0RHVvRk0yc25YV2RNVXR3PT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)



- links.csv 记录了机构的官方主页

| grid_id | links |
| ------- | ----- |
|         |       |

- relationships.csv 记录了机构间的关系，包括哦Related,child,Parent三种关系

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yU1gyUlpjK3A2cVAxZW81NnVlcWkxK2JCRytHM0luZFhRPT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)

- types.csv 记录了机构的类型，一个机构可能有多个类型

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVU2Zk1DenNaNG9yUzBZOTBYN2VnYVZtT2NESitaL3ErWUthb1k0bmlkUk93PT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)