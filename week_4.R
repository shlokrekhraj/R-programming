%%R
# 1. Renaming Row and Column Names
x = matrix(nrow=4, ncol=3, data=c(1:12))
x

rownames(x)

colnames(x)

rownames(x) = c("r1", "r2", "r3", "r4")
x

colnames(x) = c("c1", "c2", "c3")
x
# 2. Assigning a Specified Number to All Matrix Elements
x = matrix(nrow=4, ncol=2, data=2)
x
# 3. Identity Matrix
d = diag(1, nrow=3, ncol=3)
d
# 4. Diagonal Matrix with 5
d = diag(5, nrow=3, ncol=3)
d
# 5. Transpose of Matrix
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

xt = t(x)
xt
# 6. Row Sums and Column Sums
x = matrix(nrow=4, ncol=2, data=c(1,2,3,4,5,6,7,8))
x

rowSums(x)

colSums(x)
# 7. Row Means and Column Means
x = matrix(nrow=4, ncol=2, data=c(1,2,3,4,5,6,7,8))
x

rowMeans(x)

colMeans(x)
# 8. Access Rows, Columns and Submatrices
x = matrix(nrow=5, ncol=3, byrow=T, data=1:15)
x
x[3,]
x[,2]
x[4:5, 2:3]
x[c(1,4), c(1,3)]
# 9. Addition of Matrix with Constant
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

x + 5
# 10. Subtraction of Matrix with Constant
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

x - 5
# 11. Multiplication of Matrix with Constant
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

5 * x
# 12. Division of Matrix with Constant
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

x / 2
# 13. Addition and Subtraction of Two Matrices
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)

y = matrix(nrow=4, ncol=2, data=11:18, byrow=T)

x

y
x + y
x - y
# 14. Another Matrix Arithmetic Example
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)
x

4 * x
x + 4 * x
4 * x - x
# 15. Matrix Multiplication
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)

y = matrix(nrow=2, ncol=4, data=11:18, byrow=T)

x

y
x %*% y
y %*% x
# 16. Multiplication of X' and X
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)

x

t(x)
t(x) %*% x
x %*% t(x)
# 17. Cross Product
x = matrix(nrow=4, ncol=2, data=1:8, byrow=T)

x

t(x)
crossprod(x)
# 18. Row-wise Concatenation
x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)

y = matrix(nrow=3, ncol=2, data=11:16, byrow=T)

x

y

rbind(x, y)
# 19. Column-wise Concatenation
x = matrix(nrow=3, ncol=2, data=1:6, byrow=T)

y = matrix(nrow=3, ncol=2, data=11:16, byrow=T)

x

y

cbind(x, y)
# 20. Inverse of Matrix
y = matrix(
    nrow = 2,
    ncol = 2,
    byrow = T,
    data = c(84,100,100,120)
)

y

solve(y)
# 21. Eigen Values and Eigen Vectors
y = matrix(
    nrow = 2,
    ncol = 2,
    byrow = T,
    data = c(84,100,100,120)
)

y

eigen(y)
# 22. Logical Operators (Reference)
# >
# >=
# <
# <=
# ==
# !=
# !
# &
# &&
# |
# ||
xor(TRUE,FALSE)
isTRUE(TRUE)
isFALSE(FALSE)
TRUE
FALSE
# true
# false
# 23. Example of ||
x = 8

(x < 10) || (x < 2)
x = 18

(x < 10) || (x < 2)
# 24. Example of | and ||
x = c(8,18)

(x < 10) | (x < 2)
(x < 10) | (x < 2)