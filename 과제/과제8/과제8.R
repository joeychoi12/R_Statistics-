#R 연습문제 
#참고 문서: https://datascienceschool.net/view-notebook/51212d612ab749e28ce44a9cb43ee615/

#4 이항 분포 
#1 다음의 문제가 베르누이 시행인지 판단하시오.
#1) 영화관에서 줄을 기다리는 시간을 측정한다. N 
#2) 전화가 왔을 때, 전화를 한 사람이 여자인지를 측정한다. Y
#3) 주사위를 한 번 던졌을 때, 나오는 숫자를 체크한다. N 
#4) 주사위를 한 번 던졌을 때, 숫자 2가 나오는지를 체크한다. Y

#2 한 축구 선수가 페널티킥을 차면 5번 중 4번을 성공한다고 한다.
#이 선수가 10번의 페널티킥을 차서 7번 성공할 확률을 구하시오.
p <- 0.8
n <- 10
x <- 0:n

pbinom(7, size = n, prob =  p)
##### CORRECT ANS #####

#Using dbinom instead
dbinom(7, size = 10, prob = p)

#3 A라는 회사는 스마트폰의 한 부품을 만드는 회사로, 이 A사의 불량률은 5%로 알려져 있다.
#이 회사의 제품 20개를 조사했을 때, 불량이 2개 이하로 나올 확률을 구하시오.
p <- 0.05
n <- 20
x <- 0:n 

pbinom(2,size = n , prob = p)

#4 어떤 희귀 바이러스에 감염되었을 때, 회복할 수 있는 치료율은 20%라고 한다.
#이 바이러스에 감염된 환자 20명을 치료했을 때, 적어도 2명 이상은 회복될 확률을 구하시오.
p <- 0.2
n <- 20
x <- 0:n 

1-pbinom(1, size = n, prob =p)

#5 주사위 두 개를 던졌을 때, 눈금의 합이 6이 될 확률을 구하시오.
die <- rolldie(2)
die_count <- count(die)
library(dplyr)
die6 <- die %>% 
  filter((X1 + X2) == 6) %>%
  count()
p <- (as.integer(die6)/die_count)
p

#5. 정규 분포
#1 A라는 전구회사에서 생산하는 전구의 수명은 800일이고 표준편차는 40일인 정규분포를
#따른다고 한다.  이때 전구의 수명이 750일 이하일 확률을 구하시오.
mu <-800
sigma <- 40
pnorm(750, mean = mu, sd = sigma)

#2 어느 한 회사에 다니는 종업원들의 근무기간을 조사하였더니, 평균은 11년이고 분산이
#   6년인 정규분포를 따른다고 한다.  
#1) 20년 이상 근무한 종업원의 비율을 구하시오.
#var(X) = E((X-mu)^2)
mu <- 11
var <- 6
sigma <- sqrt(6)
ll < - mu - 3* sigma
ul <- mu + 3* sigma 
x<- seq(ll, ul, by = 0.01)
nd <- dnorm(x, mean=mu, sd=sigma)
1 - pnorm(20, mean = mu, sd=sigma)


#2) 근무연수가 가장 오래된 10%의 종업원은 이 회사에서 몇 년 이상 근무했다고 볼 수 있는가?
qnorm(0.9, mean=mu,sd=sigma)

#3 어느 고등학교 3학년 학생들의 수학성적은 평균이 70이고 표준편차가 8인 정규분포를
# 따른다고 한다.이때 점수가 80점 이상이고 90점 이하인 학생의 비율을 구하시오.

#Z = (X-mu)/sigma

mu <- 70
sigma <- 8
100*(pnorm(90,mean = mu, sd = sigma) - pnorm(80,mean=mu, sd=sigma))  

############## 모범 답안################
paste(100*(pnorm(90,mean=70,sd=8)-pnorm(80,mean=70,sd=8)),"%")

#4 확률변수 X가 평균이 1.5, 표준편차가 2인 정규분포를 따를 때, 실수 전체의 집합에서
# 정의된 함수 H(t)는 H(t) = P(t ≤ X ≤ t+1) 이다.  (H(0) + H(2)의 값을 구하시오.
mu <- 1.5
sigma <- 2 
#H(t) = P(t <= X <= t+1)
#0 <= x <= 1
a <- pnorm(1,mean = mu, sd = sigma)-pnorm(0,mean = mu, sd = sigma) 

#2 <= x <= 3
b <- pnorm(3,mean = mu, sd = sigma)-pnorm(2,mean = mu, sd = sigma) 
ans <- a + b
ans


