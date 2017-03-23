---
title: 一个解决matplotlib绘图时出现中文乱码问题的方法
date: 2017-03-18 16:11:15
tags: python
---

matplotlib绘图时出现中文乱码，这里有一个简单的解决方案：

```python
from pylab import *

mpl.rcParams['font.sans-serif'] = ['SimHei']

```

这样就可以啦，这里的SimHei可以是你系统内安装好的任意字体，只要支持中文就好了