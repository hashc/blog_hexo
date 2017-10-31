---
title: scipy稀疏矩阵点乘
date: 2017-10-31 14:54:36
tags: [scipy, 稀疏矩阵]
---

在scipy中，sparsematrix默认是matrix,所以使用‘*’没法做到numpy中nparray的点乘（ elementwise-multiply）
在[StarkOverFlow](https://stackoverflow.com/questions/3247775/how-to-elementwise-multiply-a-scipy-sparse-matrix-by-a-broadcasted-dense-1d-arra) 中找到了一个满意的答案

A.multiply(B)，可以实现按位相乘

参考文献：

 - https://stackoverflow.com/questions/3247775/how-to-elementwise-multiply-a-scipy-sparse-matrix-by-a-broadcasted-dense-1d-arra