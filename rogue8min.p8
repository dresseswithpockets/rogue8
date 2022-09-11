pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
p={x=3,y=3,h=2,n=0}t={}f=0z={x=18,y=18}r=6g=0n=nil
::q::
for x=1,z.x do
	t[x]={}
 for y=1,z.y do
  t[x][y]=-1
  if (p.x!=x or p.y!=y)and(x==1or x==z.x or y==1or y==z.y) then
   t[x][y]=0
  elseif rnd(250)<1+f/2then
   t[x][y]=-2
  elseif rnd(450)<1then
   t[x][y]=3
  elseif rnd(1200)<1+f/2then
   t[x][y]=5
  end
 end
end
try=1
while try do
 rx=rnd(z.x-2)\1+1
 ry=rnd(z.y-2)\1+1
 if t[rx][ry]==-1then
  t[rx][ry]=4
  try=nil
 end
end

::_::
if p.n==0then
 n=nil
end
a=1
if n then
 xd=0
 yd=0
else
 xd=btnp(0)and-1or(btnp(1)and 1or 0)
 yd=btnp(2)and-1or(btnp(3)and 1or 0)
 a=xd!=0or yd!=0
end
if xd==0and yd==0then
 a=nil
 goto d
end
m=1
xd+=p.x
yd+=p.y
e=t[xd][yd]
if e==0then
 m=nil
elseif e==1then
 t[xd][yd]=-1
 g+=1
 ?"\av2a"
elseif e==2or e==9then
 if rnd(3)<1then
  t[xd][yd]=-1
 else
  t[xd][yd]=1
 end
 m=nil
 ?"\ai3v3g2.c3b2"
elseif e==3then 
 t[xd][yd]=-1
 p.h=min(5,p.h+1)
 ?"\as7abcdef"
elseif e==4then
 f+=1
 p.x=xd
 p.y=yd
 ?"\ai6g3.g2.g1"
 goto q
elseif e==5then
 t[xd][yd]=-1
 g+=5
 m=nil
 ?"\ae#.g#"
end
if m then
 p.x=xd
 p.y=yd
end
::d::
cls()
if n then
 c=p.n%6==0and 8or 2
 p.n-=1
else
 c=2
end
?"웃",r*(p.x),r*(p.y),c
for x=1,z.x do
 for y=1,z.y do
  e=t[x][y]
  if e==0then
   rectfill(r*x,r*y,r*(x+1),r*(y+1),5)
  elseif e==1then
   ?"◆",r*x,r*y,10
  elseif e==2then
   ?"🐱",r*x,r*y,2
   if a then
    if rnd(2)>1then
     xd=x+sgn(p.x-x)
     yd=y
    else
   	 xd=x
     yd=y+sgn(p.y-y)
    end
    if xd==p.x and yd==p.y then
     p.h-=1
     p.n=24
     n=1
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
  elseif e==3then
  	?"♥",r*x,r*y,3
  elseif e==4then
   ?"▤",r*x,r*y,4
  elseif e==5then
   ?"★",r*x,r*y,9
  elseif e==-2then
   ?"🐱",r*x,r*y,2
   t[x][y]=2
  end
 end
end
for i=0,5do
	?"♥",2+i*7,119,6
	if i<=p.h then?"♥",2+i*7,119,8
	end
end
?"f"..f,90,119,6
?"g"..g,50,119,9
flip()goto _
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
