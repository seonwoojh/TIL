# igraph의 graph_from_literal() 함수를 이용하는법

#install.packages("igraph")
library(igraph)
g <- graph_from_literal(지윤--나래--영희)
plot(g, vertex.size=30)

#igraph의 graph_from_adjacency_matrix() 를 이용하는 방법
a.matrix <- matrix(
  c(0, 1, 0, 0, 0, 0, 0, 0,
    1, 0, 1, 1, 0, 0, 1, 0,
    0, 0, 0, 0, 1, 0, 0, 0), by.row=T, nrow=8)
g <- graph_from_adjacency_matrix(a.matrix, 
                                 mode = "undirected")
V(g)$name <- c("철수", "갑돌", "영희", "나래", 
               "시원", "지윤", "현수", "영숙")
plot(g, vertex.size=30)

#igraph패키지의 graph_from_data_frame() 함수를 이용하는 방법
v <- data.frame(id=1:8, 
                name=c("철수", "갑돌", "영희", "나래", 
                       "시원", "지윤", "현수", "영숙"), 
                size=30) 
e <- data.frame(
  from=c(1,2,2,2,2,3,3,3,4,4,4,4,5,5,5,6,7,8), 
  to=c(2,1,3,4,7,2,4,5,2,3,5,6,3,4,8,4,2,5))
g <- graph_from_data_frame(
  d = e, vertices = v, directed = F)
plot(g, edge.curved=0)

# 전체 노드의 차수의 분포 관찰하기

supervisor <- read.table("supervisor.txt", 
                         sep='\t', dec=',', header=T)
g <- graph.data.frame(supervisor, directed=F)
V(g)
E(g)
summary(g)
degree(g)
set.seed(1001) 
plot(g)

# 연결된 엣지 수(차수)가 너무 작은 노드는 제거하기(지도 학생 수가 2명 이하인 경우를 제거)

## 적절한 시각화를 위해 차수가 작은 노드 제거 & 노드 크기 설정
supervisor <- read.table("supervisor.txt", 
                         sep='\t', dec=',', header=T)
g <- graph.data.frame(supervisor, directed=F)
V(g)$size <- degree(g) / 3 # 노드 크기 설정
condition <- V(g)[degree(g)<3] 
g1 <- delete.vertices(g, condition)
head(sort(closeness(g1), decreasing=T))
head(sort(betweenness(g1), decreasing=T))
#closeness(g1)[which.max(closeness(g1))]
#betweenness(g1)[which.max(betweenness(g1))]
set.seed(1001) 
plot(g1)

