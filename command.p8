pico-8 cartridge // http://www.pico-8.com
version 16
__lua__
-- here's a simple player class:

function player(o)
 return {
  x=64,
  y=64,
  on_input=o.on_input,
 }
end

function player_draw(p)
 rectfill(p.x,p.y,p.x+2,p.y+2)
end

function player_move_left(p)
 p.x-=1
end

function player_move_right(p)
 p.x+=1
end

-- here are the different input handlers
-- we can pass to our player class:

function player_human(p)
 if btn(⬅️) then
  player_move_left(p)
 end

 if btn(➡️) then
  player_move_right(p)
 end
end

function player_ai(p)
 local t=time()%1
 if t<0.5 then
  player_move_left(p)
 else
  player_move_right(p)
 end
end

-- and here's our game loop:

function _init()
 p1=player{
  -- play with these:
  -- on_input=player_human,
  -- on_input=player_ai,
 }
end

function _update60()
 p1.on_input(p1)
end

function _draw()
 cls()
 player_draw(p1)
end
