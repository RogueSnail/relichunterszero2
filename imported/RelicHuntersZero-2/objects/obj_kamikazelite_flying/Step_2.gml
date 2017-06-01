/// @description dynamic depth and scale
// You can write your code in this editor
if (flightState == "go") 
{
    depth = layer_get_depth("Interactive_Over");
}
else depth = -y;

if (targetDirection > 90) && (targetDirection < 270) image_xscale = -1;
else image_xscale = 1;

image_yscale = 1.25;
