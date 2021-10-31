a,b,v = map(int,input().split())
k = (v-b)/(a-b)
print(int(k) if k == int(k) else int(k)+1)
