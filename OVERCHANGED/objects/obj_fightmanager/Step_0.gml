if (turn == 0 && !is_player_attacking)
{
	if (keyboard_check_pressed(global.LEFT) && menu_depth == 0)
	{
		menu_select = max(menu_select - 1, 0)
		menu_change = true
		audio_play_sound(snd_squeak, 999, false)
	}
	if (keyboard_check_pressed(global.RIGHT) && menu_depth == 0)
	{
		menu_select = min(menu_select + 1, 3)
		menu_change = true
		audio_play_sound(snd_squeak, 999, false)
	}
	
	if (keyboard_check_pressed(global.CONFIRM))
	{
		if (menu_depth == 0)
		{
			menu_depth = 1
			submenu_select = 0
			audio_play_sound(snd_select, 999, false)
			switch (menu_select)
			{
				case 0:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				case 1:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				case 2:
					dialogue.clear()
					break
				case 3:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				default:
					break
			}
		}
		else if (menu_depth == 1)
		{
			menu_depth = 2
			switch (menu_select)
			{
				case 0:
					dialogue.clear()
					dialogue.sprite_index = spr_field
					instance_create_depth(0, 0, depth - 2, obj_attack_bar).target = global.encounters[global.use_encounter].enemies[submenu_select]
					is_player_attacking = true
					break
				case 1:
					dialogue.clear()
					dialogue.use_act_list(submenu_select)
					heart.x = 20
					heart.y = 180
					break
				default:
					dialogue.clear()
					break
			}
		}
	}
	
	if (keyboard_check_pressed(global.DOWN) && menu_depth >= 1)
	{
		submenu_select = min(submenu_select + 1, global.encounters[global.use_encounter].number_of_enemies - 1)
	}
	if (keyboard_check_pressed(global.UP) && menu_depth >= 1)
	{
		submenu_select = max(submenu_select - 1, 0)
	}
	
	if (keyboard_check_pressed(global.CANCEL))
	{
		menu_depth = max(menu_depth - 1, 0)
		if (menu_depth == 0)
		{
			dialogue.use_default()
		}
		else if (menu_depth == 1)
		{
			switch (menu_select)
			{
				case 0:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				case 1:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				case 2:
					dialogue.clear()
					break
				case 3:
					dialogue.clear()
					dialogue.use_enemy_list()
					break
				default:
					break
			}
		}
	}
	
	if (menu_change)
	{
		layer_sprite_change(fight_bt, menu_select == 0 ? spr_fight_bt_sel : spr_fight_bt)
		layer_sprite_change(act_bt, menu_select == 1 ? spr_act_bt_sel : spr_act_bt)
		layer_sprite_change(item_bt, menu_select == 2 ? spr_item_bt_sel : spr_item_bt)
		layer_sprite_change(mercy_bt, menu_select == 3 ? spr_mercy_bt_sel : spr_mercy_bt)
		
		heart.x = heart_positions_menu_one[menu_select][0]
		heart.y = heart_positions_menu_one[menu_select][1]
		
	}
	
}
else if (turn == 1)
{
	layer_sprite_change(fight_bt, spr_fight_bt)
	dialogue.sprite_index = spr_dialoguebox
	dialogue.image_xscale = 0.4
	dialogue.image_yscale = 1.2
	heart.x = 160
	heart.y = 145
	heart.depth = dialogue.depth - 1
	heart.enablemovement = true
}

hp_fill_ratio = global.hp / global.maxhp
hp_fill_ratio = clamp(hp_fill_ratio, 0, 1)
menu_change = false
text_change = false