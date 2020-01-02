/// draw_text_outline(x, y, string, *text color, *outline color)

//Thank you, marasovec

var xx = argument[0]
var yy = argument[1]
var s = argument[2]
var c1 = argument[3]
if(argument_count > 4)
{
    var c2 = argument[4]
}


if(argument_count > 4) draw_set_color(c2)
else draw_set_color(c_black)

draw_text(xx+1, yy+1, s)
draw_text(xx-1, yy+1, s)
draw_text(xx+1, yy-1, s)
draw_text(xx-1, yy-1, s)

draw_set_color(c1)
draw_text(xx, yy, s)
