---
title: pagerank_core
date: 2017-04-20 08:54:41
tags: [pagerank,k_core]
---

# pr-core的工作

# 1.定义

- 给定M是概率转移矩阵，就是网络邻接矩阵对应的归一化矩阵

- 计算p=pM，p是M最大本征值对应的本征向量，也就是不带随机游走项的pagerank值

- pagerank_core定义为：

  ​		$$pr_c=\frac{k_c}{\sum_{i,j}W_{ij}}$$

  其中，$\sum_{i,j}W_{ij}$是邻接矩阵的和，也就是所有边的数目的两倍，或者是网络的每个结点的度和

- 删除小于某个$pr_c$的结点，对剩下的结点在计算pagerank值，如此反复，直到不可删去，这些删去的结点对应此时的$pr_c$值

- 最终，得到整个网络的pagerank_core


# 2.相关工作

### 2.1 无权无向网络上的pr_core

- 在对一个全连通的undirected network，pagerank值对应的就是它的归一化后的度值

  $$(d_1,d_2,...,d_n)=(d_1,d_2,...,d_n)M$$

  也就是，当没有随机游走的时候，pr-core得到的结果应该与k_core一样，所以可以看看在有向网络和加权网络上，pr-core的效果

  ![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVVBOW9FNkh6dWVoSllQSlRGWHN1akxWNDJGZXh2Unl1eG9yUVc4TWk0cGxRPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

- 对一个非全连通的网络，它的pagerank值的初始化默认是给每个节点赋同样的值，这就导致出现如下情况：（以随机生成的小世界1000个结点的网络为例，删去了一些结点后，图不连通了）

  可以找到联通的子图，对子图分别算pagerank值，然后按照子图的边值占总边数的比来乘以对应点的pr值，可以得到下图：

  问题是，需要这样吗？在一个大集团中小k_core的结点的传播能力可能比小集团大k-core的结点传播能力要强

- 数值计算问题

  绘制了随着alpha变化的pr_c，k_c与实际传播能力的坎德尔系数

  但由于计算中不可避免的遇到数值舍入的问题，会导致最终计算的当alpha=1时，与k_core有差异，而且还挺大

  ![](http://imglf1.nosdn.127.net/img/Q20zbTVFMnRqRVdnejFseXNrd1BMcHNVcVdsZC80TGp3MWZDV004WjJUZG5kNDNtZ0dMZ25BPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

  我稍微放宽了pr_core在实际计算中的条件（每次判断要不要舍弃的时候，原本是要求<pr-core，放宽到<pr_core+0.001）

  ![](http://imglf1.nosdn.127.net/img/Q20zbTVFMnRqRVdnejFseXNrd1BMdVZWcHN6blJBenBXSDhwMGoxQVpBQUtpRlA4TFlJNVNRPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

也就是说，在无权无向网络上，不加随机游走，比加随机游走项效果要好。



下图是$alpha=0.85$的pr_core与k_core的对比

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVVBOW9FNkh6dWVoTXJvdHJWVStGenZrSjk2TkoxOUQrVytMQVhiRGlPdS9RPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)





### 2.2 文献调研，在有向加权网络上的推广

#### 2.2.1 基于词共现矩阵做关键词提取

1.François Rousseau,etc,2015,Main Core Retention on Graph-of-words for Single-Document Keyword Extraction

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpcStXQWxzQjJyOWMyd0RIQU1ZbytyUDdsMnNVUXp4cldBPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

用词共现矩阵建网络，边权重是共同出现频率，利用边权重累加计算WK-core,在关键词提取上效果好于Pagerank 和k-core

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpdCtBdTJnSlNrOE9LZFk2dER0NVM0ZWlPZ1AyNEJQaklRPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)



#### 2.2.2 用Fractionalk -core来评价合作

Christos Giatsidis,etc,2011,Evaluating cooperation in communities with the k -core structure

$W(e_{x,x^{'}})=\sum\limits_{y\in N(x) \cap N(x^{'})}\frac{1}{|N(y)|}$ 

$\sum\limits_{e\in G} w(e)=|V(P)|$

x,x'分别代表作者，N(x)是x发表的文章，y是他们的共同文章，N(y)是引用文章y的文章集合

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpcEo5ZVFmUTNLY3ZPYTBFNXpHVzhER3JaSXBkOHpjWWZ3PT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)





#### 2.2.3 D-core,有向网上的k-core

Christos Giatsidis,2011,D-cores: measuring collaboration of directed graphsbased on degeneracy

![](http://imglf1.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpaGpORlAxZ2NBMTR1dnppTWJxMnZSS3NRR3l0eUpGaEV3PT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpaXJHbE1VUHhMM2VXVFhEOEI3dll1am9aUjZXTWozbzdBPT0.png?imageView&thumbnail=500x0&quality=96&stripmeta=0&type=jpg)

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpc0J5Z0VDUTdYdkRlYkltVFNrWjRJWkZHZWEzU28wOXdnPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

![](http://imglf1.nosdn.127.net/img/Q20zbTVFMnRqRVd6K2hHSXN4KzNpdUgyS0xUeFEzM3BSQ1BCdUIrUWd1STNVU3RBSjJzZWJnPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)



### 3.有向网上的pr_core实证

一般而言，有向网络上的k_core可以用以下三种方法来计算：

- 转为无向网络

- 只考虑入度

- 只考虑出度

  ​

![](http://imglf.nosdn.127.net/img/Q20zbTVFMnRqRVZFZkwzemp0ZHpuTUtqTi9wWFo0OFNBWWNwWmU2MGd6NC9SSXJyMUZBN1pnPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)

上图是$\alpha=1$时，pr_core与$k^{in}_{core}$的比较，其它情况也相似

$k_{in}$二者关于传播能力的坎德尔系数，pr_core是0.93,$k^{in}_{core}$是0.96.

其他情况类似，下图是三者与Pagerank_core的对比：

![](http://imglf0.nosdn.127.net/img/Q20zbTVFMnRqRVZFZkwzemp0ZHpuR1dwRU5IblE3NGVzb2lISUVvUysxV1V6MXZMNzl0WXBnPT0.png?imageView&thumbnail=1680x0&quality=96&stripmeta=0&type=jpg)







数据源：WIki_vote有向网络



最后，对比了预测前100名中不同方法的准确度：

- $k_{core}$预测对了19个，


- $k^{in}_{core}$预测对了79个，
- $\alpha=1$的$pr_{core}$预测对了16个

200名中：

- $k_{core}$预测对了71个，


- $k^{in}_{core}$预测对了163个，
- $\alpha=1$的$pr_{core}$预测对了53个

200名中：

- $k_{core}$预测对了324个，


- $k^{in}_{core}$预测对了422个，
- $\alpha=1$的$pr_{core}$预测对了324个

![](http://imglf2.nosdn.127.net/img/Q20zbTVFMnRqRVVFYURheDhod3FIVHo0d3k5dGh3eWl2YURpQStDb2R2d3dxRExPOTZQNHhRPT0.png?imageView&thumbnail=2000y2000&type=jpg&quality=96&stripmeta=0&type=jpg)