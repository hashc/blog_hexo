---
title: hdf5使用教程
date: 2017-10-02 14:47:16
tags: [hdf5,python]
---

# HDF5使用教程

### 1. HDF5格式文件

**HDF**（英语：Hierarchical Data Format）指一种为存储和处理大容量科学数据设计的文件格式及相应库文件。HDF最早由[NCSA](https://zh.wikipedia.org/wiki/NCSA)开发，目前在非盈利组织HDF小组维护下继续发展。当前流行的版本是HDF5。

HDF5文件包含两种基本数据对象：

- 群组（group）：类似文件夹，可以包含多个数据集或下级群组。
- 数据集（dataset）：数据内容，可以是多维数组，也可以是更复杂的数据类型。

群组和数据集都支持，用户可以自定义其属性，提供附加信息。

HDF5文件可以的生成读取都很高效，特别适合超大矩阵的存储，并且有着很高的压缩率和可靠性

### 2. HDF5的安装

```bash
sudo apt install libhdf5-serial-dev 
```

由于我一般利用python经行科学计算，所以安装了python接口

```shell
sudo pip install h5py
```



### 3. python 下的使用

```python
#写文件
file = h5py.File('data.h5','w') 
x=np.xrange(10)
y=np.xrange(10)
file.create_dataset('x', data = x)
file.create_dataset('y', data = y)
file.close()

# 读文件
file=h5py.File('data.h5','r')
x = file['x']
y = file['y']
file.close()

```

这样是不是很方便呢。





参考：

1. [[杂： PYTHON上数据储存：推荐h5py](http://www.cnblogs.com/Ponys/p/3671458.html)](https://www.cnblogs.com/Ponys/p/3671458.html)
2. [http://docs.h5py.org/en/latest/build.html#install](http://docs.h5py.org/en/latest/build.html#install)
3. [HDF5 小试——高大上的多对象文件格式](https://www.phodal.com/blog/try-hdf5-in-mac-os-with-shell/)

