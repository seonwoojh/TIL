# 뉴턴-랩슨 알고리즘
x=scan()
16.512 3.619 13.083 -1.457 11.060 11.012 7.248 14.198 
11.748 13.356 2.455 13.561 7.970 13.594 10.291 6.253 
3.512 3.726 10.206 9.132 18.802 24.119 11.757 25.495 
15.249 0.907 13.182 11.701 21.965 -12.685

# 허용오차보다 작으면 중단
tol = 1e-6; n=length(x); sx=sum(x)
x0 = c(1,1) # seed value
x0
for(k in 1:1000) {
  x1 = x0; m=x1[1]; s2=x1[2] 
  ssx=sum(x^2)-2*m*sx+n*m^2 
  d1 = (sx-n*m)/s2; d2=ssx/(2*s2^2)-n/(2*s2); d=rbind(d1,d2)
  h11=-n/s2; h12=-(sx-n*m)/s2^2
  h21=h12; h22=n/(2*s2^2)-ssx/s2^3;h=c(h11,h12,h21,h22)
  H=matrix(h,nrow=2)
  x0 = x1 - solve(H)%*%d
  change.x = sqrt(t(x0-x1)%*%(x0-x1))/sqrt(t(x1)%*%x1)
  cat(k, x1, change.x,"\n") 
  if (change.x < tol) break
}