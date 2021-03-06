本文介绍CART（分类决策回归树）算法在R语言中如何使用


数据集
采用R语言内置的iris数据集。

#查看数据集前六个观测
head(iris)


CART算法R语言实践
###############################################################################################################

第一步：数据集划分训练集和测试，比例是2:1
###############################################################################################################

set.seed(1234)
index <-sample(1:nrow(iris),100)
iris.train <-iris[index,]
iris.test <-iris[-index,]

第二步：加载包含CART算法的R包
###############################################################################################################

library(rpart)


第三步：构建CART模型
###############################################################################################################

model.CART <-rpart(Species~.,data=iris.train)


第四步：模型应用到测试集
###############################################################################################################

results.CART <-predict(model.CART,newdata=iris.test, type="class")

第五步：生成混淆矩阵
###############################################################################################################

table(results.CART, iris.test$Species)



CART算法原理
1 分类回归树(CART,ClassificationAnd Regression Tree)也属于一种决策树，
分类回归树是一棵二叉树，且每个非叶子节点都有两个孩子。

2 决策树生长的核心是确定决策树的分枝准则。

1）如何从众多的属性变量中选择一个当前的最佳分支变量；也就是选择能使异质性下降最快的变量。
异质性的度量：GINI、TWOING、least squared deviation。
前两种主要针对分类型变量，LSD针对连续性变量。

2）如何从分支变量的众多取值中找到一个当前的最佳分割点（分割阈值）。
 A、数值型变量——对记录的值从小到大排序，计算每个值作为临界点产生的子节点的异质性统计量。
能够使异质性减小程度最大的临界值便是最佳的划分点。 
 B、分类型变量——列出划分为两个子集的所有可能组合，计算每种组合下生成子节点的异质性。
同样，找到使异质性减小程度最大的组合作为最佳划分点。

3 在决策树的每一个节点上我们可以按任一个属性的任一个值进行划分。
按哪种划分最好呢？有3个标准可以用来衡量划分的好坏：GINI指数、双化指数、有序双化指数。

