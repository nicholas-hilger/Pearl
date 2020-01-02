//Thank you, Cowboy Color
//http://blog.cowboycolor.com/binary-auto-tiling-in-game-maker/
//and https://gamedevelopment.tutsplus.com/tutorials/how-to-use-tile-bitmasking-to-auto-tile-your-level-layouts--cms-25673

count = 0
nUp = place_meeting(x,y-32,wall)
nDown = place_meeting(x,y+32,wall)
nLeft = place_meeting(x-32,y,wall)
nRight = place_meeting(x+32,y,wall)

if(nUp) count += 1
if(nRight) count += 4
if(nDown) count += 8
if(nLeft) count += 2

image_index = count

