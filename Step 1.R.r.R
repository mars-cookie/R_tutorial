# 테스트 코드입니다.
(1)
x <- "test"

print(x)

# (2) 백터
y <- c(70,80,90)

print(y)  #y만 작성하고 run시키면 동일하게 나옵니다

# (3) 행렬
z <- matrix(c(70,80,90,50,55,30), nrow=3, byrow=T)
z

# (4) 배열
A <- array(1:12, dim=c(2,3,2))
A
