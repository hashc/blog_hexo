---
title: 利用uncompyle6来逆向pyc到py
date: 2018-03-22 19:14:41
tags: [python]
---

今天写code误删了一个重要的py文件，但是利用数据恢复软件没法得到最新的版本，是一个基本没用的老版本。由于是临时的项目，没有养成用git做版本控制的好习惯。
所以崩溃了。但是在__pycache__文件目录下看到了py文件生成的pyc文件。就想能不能反向编译pyc到py？
找到了uncompyle6的一个python包。
[uncompyle6](https://pypi.python.org/pypi/uncompyle6) 是一个可以逆向编译pyc到py包，pip安装成功后可以运行命令

```python
uncompyle6 ***.pyc > ***.py
```
写入结果到***.py这个文件上

