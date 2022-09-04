pico-8 cartridge // http://www.pico-8.com
version 38
__lua__
// p is player hp
// t is tiles array
// f is floor number
// z is floor size
p={x=3,y=3,h=2}
t={}
f=0
z={x=18,y=16}

// todo: handle floor gen
//   puts: mobs, hpots, exit, walls
// todo: handle floor exit
// todo: handle death
// todo: handle e->p damage
// todo: enemy movement
// todo: sfx on damage
-- bug: if exit is on wall spot
--  and player exits, error on
--  next generation
::q::
for x=1,z.x do
	t[x]={}
 for y=1,z.y do
  t[x][y]=-1
  -- put wall on edges, and
  -- avoid putting a wall over
  -- player pos
  if (p.x!=x or p.y!=y)and(x==1or x==z.x or y==1or y==z.y) then
   t[x][y]=0
  end
 end
end
t[4][6] = 2
t[7][7] = 3
t[10][9] = 4
::_::
xd = 0
yd = 0
//check for player input
if btnp(0) then xd = -1
 elseif btnp(1) then xd = 1
 elseif btnp(2) then yd = -1
 elseif btnp(3) then yd = 1
 //if no player input,
 //continue to draw
 else goto d
end
goto t
::d::
cls()
//draw the room
rect(7,7,7*z.x+7,7*z.y+7,5)
//iterate through the array
print("웃",7*p.x,7*p.y,3)
for x=1,z.x do
 for y=1,z.y do
  e = t[x][y]
  if e == 2 then
   print("🐱",7*x,7*y,2)
  elseif e == 3 then
  	print("♥",7*x,7*y,3)
  elseif e == 4 then
   print("▤",7*x,7*y,10)
  end
 end
end
// draw hp
for i=0,p.h do
	print("♥",2+i*7,119,7)
end
// draw floor number
print("f"..f,50,119)
flip()goto _
//turn logic
::t::
move = 1
//store the new position
xd += p.x
yd += p.y
e = t[xd][yd]
//check for entity type at
//new position
if e == 2 then
 t[xd][yd] = -1
 move = nil
elseif e == 3 then 
 t[xd][yd] = -1
 p.h += 1
elseif e == 4 then
 f += 1
 goto f
end
if move then
//clamp player location
 p.x = max(1,min(z.x,xd))
 p.y = max(1,min(z.y,yd))
end
//then return to the draw loop
goto d
__gfx__
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00700700000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
