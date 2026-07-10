text = "* " + global.encounters[global.use_encounter].enemies[0].name + " drew near!"
show_text = ""
text_pos = 0
text_speed = 1
done = false

clear = function()
{
	text = ""
	show_text = ""
	text_pos = 0
	text_speed = 1
}

use_default = function()
{
	text = "* " + global.encounters[global.use_encounter].enemies[0].name + " drew near!"
	show_text = ""
	text_pos = 0
	text_speed = 1
	done = false
}

use_enemy_list = function()
{
	for (var i = 0; i < array_length(global.encounters[global.use_encounter].enemies); i++)
	{
		text += "* " + global.encounters[global.use_encounter].enemies[i].name + "\n"
	}
	text_pos = string_length(text)
	show_text = text
}

use_act_list = function(enemy)
{
	for (var i = 0; i < array_length(global.encounters[global.use_encounter].enemies[enemy].acts); i++)
	{
		text += "* " + global.encounters[global.use_encounter].enemies[enemy].acts[i] + "\n"
	}
	text_pos = string_length(text)
	show_text = text
}

alarm[0] = text_speed