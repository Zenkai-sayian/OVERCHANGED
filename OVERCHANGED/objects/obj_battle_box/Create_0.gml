encounter = global.encounters[global.use_encounter]

bb_left   = global.bbox_ideal[0]
bb_top    = global.bbox_ideal[1]
bb_right  = global.bbox_ideal[2]
bb_bottom = global.bbox_ideal[3]

target_left   = bb_left
target_top    = bb_top
target_right  = bb_right
target_bottom = bb_bottom

resize_speed = 10

my_line = ""

use_ideal = function()
{
	target_left = global.bbox_ideal[0]
	target_top = global.bbox_ideal[1]
	target_right = global.bbox_ideal[2]
	target_bottom = global.bbox_ideal[3]
}