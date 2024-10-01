# vector
ex_vector1 <- c(-1,0,1)
ex_vector1

mode(ex_vector1)
str(ex_vector1)
length(ex_vector1)

# 범주형 생성
ex_vectors5 <-c(2,1,3,2,1)
ex_vectors5

cate_vector5 <-factor(ex_vectors5,labels=c('Apple','Banana','Cherry'))
cate_vector5

# 행렬
x <- c(1,2,3,4,5,6)
x

matrix(x,nrow=2,ncol=3)
matrix(x,nrow=3,ncol=2)

matrix(x,nrow=2,ncol=3,byrow=T)

# 배열
y <- c(1:6)
array(y,dim=c(2,2,3))

# 리스트
list1 <- list(c(1,2,3),'Hello')
list1

# 데이터 프레임 생성하기(p.96)
ID <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)
SEX <- c("F", "M", "F", "M", "M", "F", "F", "F", "M", "F")
AGE <- c(50, 40, 28, 50, 27, 23, 56, 47, 20, 38)
AREA <- c("서울", "경기", "제주", "서울", "서울", "서울", "경기", "서울",
          "인천", "경기")
length(ID)

dataframe_ex <- data.frame(ID, SEX, AGE, AREA)
dataframe_ex
View(dataframe_ex)

# 실습교재에 있는 부분들
# 변수 <- 값 / x에 1이라는 값을 저장.
x <- 1

# 변수에 저장된 값을 출력
print(x)

# 각각의 변수에 값을 저장
x <- 1
y <- "안녕하세요."
z <- TRUE


# 2일차 2강
x <- c(1, 2, 4, 8) # 벡터(숫자형)
y <- c("W", "e", "e", "k", "s") # 벡터(문자형)
z <- c(TRUE, FALSE) #벡터(# 논리형)
df <- data.frame(matrix(1:4, nrow = 2)) #데이터프레임

# 벡터 -> 리스트
x <- as.list(x)

# 데이터프레임 -> 행렬
df <- as.matrix(df)

class(x)
typeof(x)

class(df)
typeof(df)

readline("아무 알파벳이나 입력해주세요.: ")

iris <- read.csv("Iris.csv",stringsAsFactors = F)

x <- c(1, 2, 4, 8) # 벡터(숫자형)
y <- c("W", "e", "e", "k", "s") # 벡터(문자형)
z <- c(TRUE, FALSE) #벡터(# 논리형)
df <- data.frame(matrix(1:4, nrow = 2)) #데이터프레임

cat(x, y) #출력 결과: 1 2 4 8 W e e k s
print(x, y) #오류 발생.

# 에러 방지를 위해 경로 복사 후 '\\'을 '\\\\'로 바꾸어주세요!
# sep="기준": 각 열의 데이터를 나누는 기준, csv의 경우 sep=","으로 구성.
# row.names: 행의 이름 및 번호 포함 여부 결정. 기본적으로 T(포함).
table <- write.table(df, file="test.txt", sep="", row.names = F)
table

# 함수명 <- function() { 함수 내용 }
hello <- function(){
  print("Hello, World!")
}

# 함수 실행 시 함수명()으로 호출.
# 출력 결과: Hello, World!
hello()


# 인수 x=5, y=2 전달
# 기본값 미설정
minus <- function(x, y){
  print(y-x)
}

# x=5, y=2 -> y-x = 2-5
# 출력 결과 = -3
minus(5, 2)
# 인수 x=5, y=3 전달
# 인수 y의 기본값 = 3
minus <- function(x, y=3){
  print(y-x)
}

# x=5, y=3 -> y-x = 3-5
# 출력 결과 = -2
minus(5)

# 인수 x=1, y=2 전달
# 기본값 미설정
times <- function(x, y) {
  return(x*y)
}

# x=1, y=2 -> x*y = 1*2
# 출력 결과 = 2
times(1, 2)


# if문 사용 시
score_if <- function(x) {
  if (80<=x & x<=100) {
    return("A")
  }
  else if (60<=x & x<80) {
    return("B")
  }
  else if (40<=x & x<60) {
    return("C")
  }
  else {
    return("D")
  }
}
#------------------------------------
# ifelse 사용 시 
score_ifelse <- function(x) {
  ifelse(80 <= x & x <= 100, "A",
         ifelse(60 <= x & x < 80, "B",
                ifelse(40 <= x & x < 60, "C", "D")))
}

#------------------------------------
# dplyr 패키지의 case_when 함수 활용
library(dplyr)

score_case_when <- function(x) {
  case_when(
    x >= 80 & x <= 100 ~ "A",
    x >= 60 & x < 80 ~ "B",
    x >= 40 & x < 60 ~ "C",
    x >= 0 & x < 40 ~ "D",
    TRUE ~ "Invalid score"
  )
}

score_case_when(50)  # "C" 반환
#------------------------------------
# 테스트 코드.
score_if(90)
score_ifelse(90)
score_case_when(90)  

# 반복문
# for 문 사용 ----------------------------
twotimes_for <- function() {
  for (i in 1:9) {
    result = 2 * i
    print(result)
  }
}

# while 문 사용 ----------------------------
i = 1

twotimes_while <- function() {
  while (i < 10) {
    result = 2 * i
    print(result)
    i = i + 1
  }
}

# repeat 문 사용 -------------------
i = 1

twotimes_repeat <- function() {
  repeat{
    result = 2 * i
    print(result)
    if (i >= 9) {break}
    i = i + 1
  }
}

# 테스트 코드 -------------------
twotimes_for()
twotimes_while()
twotimes_repeat()
