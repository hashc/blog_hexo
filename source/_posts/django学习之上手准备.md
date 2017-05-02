---
title: django学习之上手准备
date: 2017-05-02 22:14:43
tags: [django]

---

# Django学习（一）准备工作



1. 安装Django

```shell
sudo pip3 install django
```

2. 安装mysql

```shell
sudo apt install mysql-server
sudo apt install libmysqld-dev
```

3. 安装python3调用mysql接口

```shell
sudo pip3 install mysqlclient
```

这里，python2可以安装mysql-python,但我用的是python3，这个包不支持，报错～



参考：

- http://zhoujianghai.iteye.com/blog/1520666
- https://stackoverflow.com/questions/4960048/python-3-and-mysql
- http://www.runoob.com/mysql/mysql-install.html
- http://djangobook.py3k.cn/