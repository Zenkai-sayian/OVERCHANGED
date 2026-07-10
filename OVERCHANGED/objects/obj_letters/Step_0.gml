event_inherited()

switch dad.typee
{
	case "ndialogue" :
		image_blend = dad.image_blend
		depth = dad.depth
		if obj_dialoguebox.drawn - 1 >= order
		{
			image_alpha = dad.image_alpha
		}
		else
		{
			image_alpha = 0
		}
		break

	default :
		x = (dad.x + (xdista * dad.image_xscale)) + ((trueorder * dad.hspace * dad.image_xscale))
		y = (dad.y + (ydista * dad.vspace * dad.image_yscale))
		image_xscale = dad.image_xscale
		image_yscale = dad.image_yscale
		image_alpha = dad.image_alpha
		break
	
		
}
//show_debug_message(ydista)