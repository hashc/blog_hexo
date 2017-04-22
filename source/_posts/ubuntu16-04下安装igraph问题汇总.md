---
title: ubuntu16.04下安装igraph问题汇总
date: 2017-04-13 09:27:08
tags:

---

# ubuntu16.04下安装igraph问题汇总

在安装igraph过程中遇到了一些问题，在这里记录一下

1. igraph or python-igraph

   如果你执行的是pip install igraph，那么恭喜你，你其实安装的是[jgraph](https://en.wikipedia.org/wiki/JGraph)，一个开源绘图软件的python接口。所以这里应该执行的是pip install python-igraph

2. **Could not download and compile the C core of igraph.**

   igraph的底层是基于C的，所以你得预先安装它的C版本，执行一下命令：

   ```shell
   sudo apt-get install -y libigraph0-dev
   ```

这个时候，我们才能放心地在终端敲下：
```shell
sudo pip install python-igraph
```
安装完成！