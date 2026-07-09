switch dad.typee
{
	default :
		x = (dad.x + (xdista * dad.image_xscale)) + ((trueorder * dad.sep* dad.image_xscale))
		y = (dad.y + (ydista * dad.w * dad.image_yscale))
		image_xscale = dad.image_xscale
		image_yscale = dad.image_yscale
		image_alpha = dad.image_alpha
		break
	case "ndialogue" :
		x = (dad.x + (xdista * dad.image_xscale)) + ((trueorder * dad.sep* dad.image_xscale))
		y = (dad.y + (ydista * dad.w * dad.image_yscale))
		image_xscale = dad.image_xscale
		image_yscale = dad.image_yscale
		image_blend = dad.image_blend
		depth = dad.depth
		if ui_dialogue.drawn - 1 >= order
		{
			image_alpha = dad.image_alpha
		}
		else
		{
			image_alpha = 0
		}
		break

}
//show_debug_message(ydista)