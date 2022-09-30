pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
p={x=3,y=3,h=2}
t={}
f=1
z={x=19,y=18}
r=6
g=0
n=0
s1="\ai3v3g2.c3b2"
tr=0
::q::
for x=1,z.x do
t[x]={}
for y=1,z.y do
t[x][y]=-1
if (p.x!=x or p.y!=y)and(x==1or x==z.x or y==1or y==z.y) then
t[x][y]=0
d=flr(f/5)
elseif rnd(250)<1+d then
t[x][y]=-2
elseif rnd(450)<1 then
t[x][y]=3
elseif rnd(1200)<1+d then
t[x][y]=5
end
end
end
try=1
while try do
rx=rnd(z.x-2)\1+1
ry=rnd(z.y-2)\1+1
if t[rx][ry]==-1 then
if f%10==0 then
t[rx][ry]=12+d/2
else
t[rx][ry]=4
end
try=nil
end
end

::_::
a=1
if n>0 then
xd=0
yd=0
else
if p.h<0 then
goto o
end
xd=btnp(0)and-1or(btnp(1)and 1or 0)
yd=btnp(2)and-1or(btnp(3)and 1or 0)
a=xd!=0or yd!=0
end
if xd==0and yd==0 then
a=nil
goto d
end

m=1
xd+=p.x
yd+=p.y
e=t[xd][yd]
if e==0 then
m=nil
elseif e==1 then
t[xd][yd]=-1
g+=1
?"\av2a"
elseif e==2 or e==9 then
t[xd][yd]=1*sgn(rnd(4)-2)
m=nil
?"\ai3v3g2.c3b2"
elseif e==3 then 
t[xd][yd]=-1
p.h=min(5,p.h+1)
?"\as7abcdef"
elseif e==4 then
f+=1
p.x=xd
p.y=yd
?"\ai6g3.g2.g1"
goto q
elseif e==5 then
t[xd][yd]=-1
g+=e
m=nil
?"\ae#.g#"
elseif e>10 then
t[xd][yd]=e-1
m=nil
?"\ai3v3g2.c3b2"
end
if m then
p.y=xd!=p.x and p.y or yd
p.x=xd
end

::d::
cls()
if n>0 then
c=n%6==0and 8or 2
n-=1
else
c=2
end
?"웃",r*(p.x),r*(p.y),c
m=1
for x=1,z.x do
for y=1,z.y do
v=r*x
w=r*y
e=t[x][y]
if e==0 then
rectfill(v,w,v+5,w+5,5)
elseif e==1 then
?"◆",v,w,10
elseif e==2 then
?"🐱",v,w,2
if a then
if rnd(2)>1 then
xd=x+sgn(p.x-x)
yd=y
else
xd=x
yd=y+sgn(p.y-y)
end
if xd==p.x and yd==p.y then
p.h=max(-1,p.h-1)
n=24
?"\af-2g1"
elseif t[xd][yd]==-1 then
t[x][y]=-1
if xd>x or yd>y then
t[xd][yd]=-2
else
t[xd][yd]=2
end
end
end
elseif e==3 then
?"♥",v,w,3
elseif e==4 then
?"▤",v,w,4
elseif e==5 then
?"★",v,w,9
elseif e==-2 then
?"🐱",v,w,2
t[x][y]=2
elseif e==10 then
t[x][y]=4
elseif e>10 then
?"😐",v,w,11
xd=x+rnd(3)\1-1
yd=y+rnd(3)\1-1
if a and t[xd][yd]==-1and m then
tr+=1
t[x][y]=tr%3==0and e or-1
t[xd][yd]=tr%3==0and-2 or e
m=nil
end
end
end
end
rectfill(0,114,128,128,1)
?"\*6♥",2,119,6
?"\*"..(p.h+1).."♥",2,119,8
?"f"..f,90,119,6
?"g"..g,54,119,9
flip()goto _
::o::
?"game over",40,64,8
?"score",40,74,6
?g.."g",70,74,9
goto o
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
