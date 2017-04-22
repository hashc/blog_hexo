---
title: 升级python所有包
date: 2017-04-12 10:17:32
tags: [python]

---

网上大多说给出的方法是在终端运行：

```shell
sudo pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```



其实，还有一种更python的方法：

在超级权限下运行以下python脚本：

```python
import pip
from subprocess import call

for dist in pip.get_installed_distributions():
    call("pip install --upgrade " + dist.project_name, shell=True)
```



参考：

[1] https://stackoverflow.com/questions/2720014/upgrading-all-packages-with-pip