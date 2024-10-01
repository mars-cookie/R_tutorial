# 데이터 불러오기부터 시작
iris <- read.csv('Iris.csv',stringsAsFactors = F,header=T)

# 데이터셋의 통계값 요약
summary(iris)

# 데이터셋의 처음부터 5개 행 출력
head(iris)

med <- median(iris$Sepal.Length)

# 조건문
ifelse(iris$Sepal.Length>=med, "L", "S")

# 반복문 사용
rown <- dim(iris)[1]

sepal <- data.frame()
for (i in 1:rown){
  if (iris[i,'Sepal.Length'] >=5 & iris[i,'Sepal.Length']<=6){
    sepal <- rbind(sepal, iris[i,])
  }
}
sepal
