pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
p={x=3,y=3,h=2}t={}f=0z={x=18,y=18}r=6g=0
::q::for x=1,z.x do t[x]={}for y=1,z.y do t[x][y]=-1if(p.x!=x or p.y!=y)and(x==1or x==z.x or y==1or y==z.y)then t[x][y]=0elseif rnd(250)<1+f/2then t[x][y]=-2elseif rnd(450)<1then t[x][y]=3elseif rnd(1200)<1+f/2then t[x][y]=5end end end try=1while try do rx=rnd(z.x-2)\1+1ry=rnd(z.y-2)\1+1if t[rx][ry]==-1then t[rx][ry]=4try=nil end end
::_::a=1xd=btnp(0)and-1or(btnp(1)and 1or 0)yd=btnp(2)and-1or(btnp(3)and 1or 0)a=xd!=0or yd!=0if xd==0and yd==0then a=nil goto d end m=1xd+=p.x yd+=p.y e=t[xd][yd]if e==0 then m=nil elseif e==1then t[xd][yd]=-1g+=1elseif e==2or e==9then if rnd(3)<1then t[xd][yd]=-1else t[xd][yd]=1end m=nil elseif e==3then t[xd][yd]=-1p.h=min(6,p.h+1)elseif e==4 then f+=1p.x=xd p.y=yd goto q elseif e==5 then t[xd][yd]=-1g+=5m=nil end if m then p.x=xd p.y=yd end
::d::cls()?"웃",r*(p.x),r*(p.y),2for x=1,z.x do for y=1,z.y do e=t[x][y]if e==0then rectfill(r*x,r*y,r*(x+1),r*(y+1),5)elseif e==1 then?"◆",r*x,r*y,10elseif e==2 then?"🐱",r*x,r*y,2if a then if rnd(2)>1then xd=x+sgn(p.x-x)yd=y else xd=x yd=y+sgn(p.y-y)end if xd==p.x and yd==p.y then p.h-=1elseif t[xd][yd]==-1then t[x][y]=-1if xd>x or yd>y then t[xd][yd]=-2else t[xd][yd]=2end end end elseif e==3then?"♥",r*x,r*y,3elseif e==4then?"▤",r*x,r*y,4elseif e==5then?"★",r*x,r*y,9elseif e==-2then?"🐱",r*x,r*y,2t[x][y]=2end end end for i=0,5 do?"♥",2+i*7,119,6if i<=p.h then?"♥",2+i*7,119,8end end?"f"..f,90,119?"g"..g,50,119flip()goto _
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
