---
title: virtualenv--创建一个python虚拟环境
date: 2017-05-03 22:36:03
tags: [virtualenv, python]

---

# virtualenv--创建一个python虚拟环境



在实际中，我们经常会用到python2,python3,但系统默认只使用一个系列的python,这个时候，需要搭建一个类似virtualenv的工具来帮我们

安装：

```shell
sudo pip3 install virtualenv
```

step1:创建项目目录：

```shell
mkdir myproject
cd myproject
```

step2:创建虚拟环境,命名为venv3：

```
virtualenv venv3
```

这里是使用系统默认的python环境

如果你想指定python版本，可以参考下面：

```
virtualenv -p /usr/local/bin/python2.7 env2.7
```

同时：

```shell
virtualenv --no-site-packages venv #不使用用户安装的额外包
virtualenv --system-site-packages ENV #会继承系统python site目录/usr/lib/pythonx.x/site-packages下的所有库, 最新版本virtualenv把把访问全局site-packages作为默认行为
```

step3:进入虚拟环境：

```shell
source ./bin/activate  #激活当前virtualenv
```

step4:退出：

```shell
deactivate
```



参考：

- http://www.jianshu.com/p/08c657bd34f1
- http://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/001432712108300322c61f256c74803b43bfd65c6f8d0d0000