---
title: APS地址数据整理
date: 2017-3-28 9:21:20
tags: [APS, 数据处理]
---
# 1.预处理

- html转义
- 对一些明显的错写词纠正
- 对符号进行标准处理:把"(",")","^","†","/","*","@","‡","§","‖",";"统一转化为","，同时，
- 带有语调字符的转义

共有354, 534条不重复地址记录

# 2.地址分割与匹配

## 分割方式：按照国家分割
- 国家：数据来源于ISO-2国家标准编码，同时，把诸如"CZECHOSLOVAKIA"，"USSR"，"YUGOSLAVIA"，"korea"先单独作为一个独立国家，同时，有一些国家有多个名字，收集这些名字的变种，统一标识。
  ![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVc2RURicDJnZXpPN0xjY2VVTjcvckE5aGdUeTlwUFZwaENlNEJDTFdFcnR3PT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)
- 美国各州，先作为“国家”进行匹配，若没有找到，再去找“USA”或者“United States”
- 加拿大各州，同上
- 匹配：按照,分割出CommaString，对每个CommaString逐个匹配，记录下每次匹配的位置，判断是否在“Universit”，“Universitat”,"labrotory"等机构词汇附近，如果在其附近并且二者之间没有“and”且距离没有超过3个空格，认定匹配失败，记录下匹配成功的国家名，
  如果遇到同一地址字符出现多个国家名的情况
  ![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVc2RURicDJnZXpPNmRKSTd2Sm1XOTl1YUdxNmk5SEU3ejU4a1Myci9EVlp3PT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)
  则判断两个国家名之间是否存在" AND "这种情况，有的话默认保留前者
- 对整个地址按照国家进行分割

结果，有2，564个地址没有找到国家名，这些地址都没有国家名，比如
DEPARTMENT OF PHYSICS, FUDAN UNIVERSITY, SHANGHAI, PEOPLE’S REPUBLIC OF
SCOTTISH UNIVERSITIES PHYSICS ALLIANCE (SUPA)
DIPARTIMENTO DI FISICA, UNIVERSITA DI MILANO
RESEARCH CENTER FOR THE EARLY UNIVERSE (RESCEU), GRADUATE SCHOOL OF SCIENCE, UNIVERSITY OF TOKYO, 7-3-1, HONGO, BUNKYO-KU 113-0033, TOKYO
DEPARTMENT OF PHYSICS, UNIVERSITY OF PRETORIA, PRETORIA, REPUBLIC OF
INSTITUTE OF EXPERIMENTAL AND THEORETICAL PHYSICS, MOSCOW
主要是只写城市名，或者州名写错“ILLINOI S”，或者没有城市名，甚至没有任何地址信息包含在内

如果有国家-省-城市的三级列表，就可以按照处理美国各州的方式进行处理了

这种处理通过了机构的检验，方法是，如果有机构列表里的机构出现在该地址中，统计国家正确的数量

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVg2ZmtMREVkNXZpSWEyOG9SWlUrd3dYZ0hsNW1qUXB6ZGhTcFpEZnBpc0V3PT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

## 寻找城市

- 按照分割后的子字符串搜搜城市，如果一个字符串中出现多个城市，并且二者距离很近，默认取后一个。这个主要是我们的城市列表包括了大量的乡镇导致的。
- 在城市的数据库中大量类似“New”,"Hill"的单词 ，我们直接忽略这些地理名，人工处理
- 大致按照处理国家的方式进行处理。

检验，有9,031个地址没有找到城市，同样的，机构检验结果与国家检验相同，有一部分是不包含城市名，只有学校地址。

随机挑选了1000条结果进行比对，结果有29条错误，国家匹配正确，但城市匹配中会有多个城市名，因为默认去后者 

总共识别出来1,137,646

利用机构信息交叉检验
===

机构数据来源：https://www.grid.ac

第一次识别，处理完成725,568条记录，这些在之前用城市数据处理中的有732,359条

第二次识别，处理完成59,221条记录,这些在之前用城市数据处理中的有49,987条

剩下435,704条记录待识别。

总共机构识别出784,789条，在城市数据对应的有782346条（1,137,646）

其中二者识别出来的地址不相同的有133,234，可能的原因是，

- 多地址，其中因为多地址问题出现问题的有39,662
- 其他

# 城市聚类问题：

method=’complete’ assigns：
$$
d(u,v)=max(dist(u_i,v_j))
$$
​							for all points i $\in$ cluster u and j $\in$ cluster v. 

This is also known by the Farthest Point Algorithm or Voor Hees Algorithm.

这样可以避免同一类里出现两个点距离过大的情况





# 第二次处理

根据mapfill单地址数据得到的城市数据集（主要是gps数据和城市数据分得很详细），根据上一次的结果匹配得到相应的城市



# 基于HEM的投入产出方法

### 1. HEM：

- 如何衡量一个系统S里某个元素E的重要程度？
- 去掉它E，看看系统S有什么变化？如果S变化很大，则说明它很重要
- 那么，如何度量系统S变化？



### 2.投入产出方法：

借用经济领域中投入产出方法，投入产出系数矩阵B的最大正特征值$\lambda$被称为系统的生产效率系数。那么如果我们去掉B矩阵的第i行第j列，得到$B^{(-i)}$,求得$B^{(-i)}$的最大正特征值$\lambda^{(-i)}$,比较$|\lambda^{(-i)}-\lambda|$



注：由Perron–Frobenius定理，我们这里的非负矩阵最大特征值总为正数

### 3.引文网络的投入产出矩阵：

- 用$c_{ij}$表示i引用j的数量
- $C_{j}=\sum c_{ij}$
- $B_{ij}= \frac{\sum c_{ij}}{C_j}$





然后得到如下的结果

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVVVbTNBa0Znc3BSTFpsUGppSlA3bWxEV3lnQ0IxSGg2S3dsK1NWNUNsR1B3PT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)





![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVVVbTNBa0Znc3BSQ0FqcFpDaThzK3R5UGRZUERvMm1SMGFYSWE4Y011REdRPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)





93-13年得到的排名，基本相差不多

把所有年份都集中到一起来看的话，Newark, NJ, USA这个城市的pagerank 与iof 上的差异比较大



| all                  | 93-13                  |
| :------------------- | ---------------------- |
| Boston, MA, USA      | Boston, MA, USA        |
| Newark, NJ, USA      | Paris, France          |
| Stanford, CA, USA    | Tokyo, Japan           |
| Chicago, IL, USA     | Stanford, CA, USA      |
| Berkeley, CA, USA    | Chicago, IL, USA       |
| Piscataway, NJ, USA  | Washington, DC, USA    |
| Washington, DC, USA  | Newark, NJ, USA        |
| Stony Brook, NY, USA | San Francisco, CA, USA |
| Paris, France        | Stony Brook, NY, USA   |
|                      |                        |

由于机构数据的识别率不高，无法用机构来做相关的工作
