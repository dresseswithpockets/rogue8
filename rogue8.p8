pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
--p is player table
--t is tiles array
--f is floor number
--z is floor size
--r is pixels per space
--g is gold
p={x=3,y=3,h=2}
t={}
f=0
z={x=18,y=18}
r=6
g=0

--entities:
-- -1:empty, 0:wall, 1:gold
-- 2:enemy, 3:health, 4:stairs
-- 5:treasure

--todo: handle death
--todo: sfx
::q::
for x=1,z.x do
	t[x]={}
 for y=1,z.y do
  t[x][y]=-1
  --put wall on edges, and
  --avoid putting a wall over
  --player pos
  if (p.x!=x or p.y!=y)and(x==1or x==z.x or y==1or y==z.y) then
   t[x][y]=0
  --have a random chance
  --(increasing per floor)
  --to spawn an enemy
  elseif rnd(250) < 1+f/2 then
   t[x][y] = -2
  --or to spawn a health pot
  elseif rnd(450) < 1 then
   t[x][y] = 3
  --even rarer to spawn a chest
  elseif rnd(1200) < 1+f/2 then
   t[x][y] = 5
  end
 end
end
--put exit at rand location
--may replace this with a more
--deterministic method
try=1
while try do
 rx = rnd(z.x-2)\1+1
 ry = rnd(z.y-2)\1+1
 if t[rx][ry] == -1 then
  t[rx][ry]=4
  try=nil
 end
end

::_::
a=1
--xd is move x
--yd is move y
--a is true if action done
xd=btnp(0)and-1or(btnp(1)and 1or 0)
yd=btnp(2)and-1or(btnp(3)and 1or 0)
a=xd!=0or yd!=0
--escape actions if no input
if xd==0and yd==0 then
 a=nil
 goto d
end

m=1
--store the new position
xd+=p.x
yd+=p.y
e=t[xd][yd]
--check for entity type at
--new position
if e==0 then
 m=nil
elseif e==1 then
 t[xd][yd]=-1
 g+=1
elseif e==2 or e==9 then
 if rnd(3) < 1 then
  t[xd][yd]=-1
 else
  t[xd][yd]=1
 end
 m=nil
elseif e==3 then 
 t[xd][yd]=-1
 p.h = min(6,p.h+1)
elseif e==4 then
 f+=1
 p.x=xd
 p.y=yd
 goto q
elseif e==5 then
 t[xd][yd]=-1
 g+=5
 m=nil
end
if m then
 p.x=xd
 p.y=yd
end

::d::
cls()
--iterate through the array
?"웃",r*(p.x),r*(p.y),2
for x=1,z.x do
 for y=1,z.y do
  e=t[x][y]
  if e==0 then
   rectfill(r*x,r*y,r*(x+1),r*(y+1),5)
  elseif e==1 then
   ?"◆",r*x,r*y,10
  elseif e==2 then
   ?"🐱",r*x,r*y,2
   --if action step, move enemy
   if a then
    --randomize enemy movement
    if rnd(2) > 1 then
     xd = x+sgn(p.x-x)
     yd = y
    else
   	 xd = x
     yd = y+sgn(p.y-y)
    end
    --if enemy catches player
    --deal damage
    if xd == p.x and yd == p.y then
     p.h -= 1
    --other check for empty
    --space to move to
    elseif t[xd][yd] == -1 then
   	 t[x][y] = -1
   	 if xd > x or yd > y then
   	  --if the enemy would be
   	  --placed ahead in the table
   	  --then set it to a
   	  --placeholder to prevent
   	  --double actions
   	  t[xd][yd] = -2
   	 else
   	  t[xd][yd] = 2
					end
    end
   end
  elseif e==3 then
  	?"♥",r*x,r*y,3
  elseif e==4 then
   ?"▤",r*x,r*y,4
  elseif e==5 then
   ?"★",r*x,r*y,9
  elseif e==-2 then
   --create new enemy at
   --placeholder
   ?"🐱",r*x,r*y,2
   t[x][y] = 2
  end
 end
end
--draw hp
for i=0,5 do
	?"♥",2+i*7,119,6
	if i<=p.h then ?"♥",2+i*7,119,8
	end
end
--draw floor number
?"f"..f,90,119
--draw gold count
?"g"..g,50,119
flip()goto _
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
