本文介绍支持向量机算法在R语言中如何使用。

数据集，采用R语言内置的iris数据集。
 

查看数据集前六个观测

head(iris)

第一步：加载SVM算法的R包e1071
##############################################################################################
library(e1071)

## Warning: package 'e1071' was built under R version 3.1.3

library(printr)


第二步：把iris按着2:1的比例分为训练集和测试集
##############################################################################################

index <- sample(1:nrow(iris), 100)

iris.train <- iris[index, ]

iris.test <- iris[-index, ]



第三步：在训练集上用SVM构建模型
##############################################################################################

model.SVM <- svm(Species ~ ., data=iris.train)
 

第四步：在测试集上对模型做测试
##############################################################################################

results.SVM <- predict(object=model.SVM, newdata=iris.test, type="class")
 

第五步：生成混淆矩阵，理解测试结果
##############################################################################################

table(results.SVM, iris.test$Species)





SVM原理
##############################################################################################

支持向量机，英文为Support Vector Machine，简称SV机（论文中一般简称SVM）。
它是一种监督式学习的方法，它广泛的应用于统计分类以及回归分析中。


SVM 的主要思想可以概括为两点：


(1) 它是针对线性可分情况进行分析，对于线性不可分的情况，
通过使用非线性映射算法将低维输入空间线性不可分的样本转化为高维特征空间使其线性可分，
从而使得高维特征空间采用线性算法对样本的非线性特征进行线性分析成为可能；



(2) 它基于结构风险最小化理论之上在特征空间中建构最优分割超平面，使得学习器得到全局最优化,
并且在整个样本空间的期望风险以某个概率满足一定上界。
在学习这种方法时，首先要弄清楚这种方法考虑问题的特点，这就要从线性可分的最简单情况讨论起，
在没有弄懂其原理之前，不要急于学习线性不可分等较复杂的情况，支持向量机。
在设计时，需要用到条件极值问题的求解，因此需用拉格朗日乘子理论，但对多数人来说，
以前学到的或常用的是约束条件为等式表示的方式，但在此要用到以不等式作为必须满足的条件，
此时只要了解拉格朗日理论的有关结论就行。



