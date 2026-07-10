function find(n)
{
	with (obj_base) {
	    if (object_index == n) {
	        return id
	    }
	}
	return noone
}

function print(stuff)
{
	var p = ""
	for (var i = 0; i < array_length(stuff); i++)
	{
		p = string_concat(p, stuff[i], " ")
	}
	show_debug_message(p)
}

function basicline(n)
{
	return {line : n}
}

function newcutscene()
{
	var p = find(obj_dialoguebox)
	var plr = find(obj_plrmove)
	if p != noone
	{
		p.image_alpha = 1
		p.start_dialogue()
		if plr != noone {plr.enablemovement = false}
		
	}
	else
	{
		print(["Error! Dialogue box not found"])
	}
}

function start_fight()
{
	global.return_room = room
	global.use_encounter = 0
	print([global.encounters[global.use_encounter]])
	room_goto(room_fight)
}

function createtext(textX,textY,textlayer,stringset,horizontalspace,verticalspace,legnthperline,xsca,ysca)
{
	var l = textlayer
	if typeof(textlayer) == "string" 
	{
		l = layer_get_depth(textlayer)
	}
	var _texter = instance_create_depth(textX,textY,l,obj_text,
	{
		setstring : stringset,
		hspace : horizontalspace,
		vspace : verticalspace,
		maxlwidth : legnthperline,
	})
	_texter.image_xscale = (xsca * 0.01)
	_texter.image_yscale = (ysca * 0.01)
	return _texter
}
