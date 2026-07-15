switch (state)
{
	case FightState.INTRO:
		if (!encounter.initialized)
		{
			encounter.init(encounter)
		}
		set_state(FightState.PLAYER_MENU)
		break
	case FightState.PLAYER_MENU:
		var living = 0
		for (var i = 0; i < array_length(encounter.enemies); ++i)
		{
			if (encounter.enemies[i].dead == false)
			{
				living++
			}
		}
		if (!living)
		{
			set_state(FightState.PLAYER_WON)
		}
	
		if (!line_set)
		{
			bbox.my_line = encounter.intro_line
		}
		
		if (menu_reset)
		{
			bbox.use_ideal()
			menu_reset = false
		}
	
		if (keyboard_check_pressed(global.LEFT))
		{
			menu_selection--
			if (menu_selection < FIGHT_BT)
				menu_selection = MERCY_BT
			selection_changed = true
		}
		
		if (keyboard_check_pressed(global.RIGHT))
		{
			menu_selection++
			if (menu_selection > MERCY_BT)
				menu_selection = FIGHT_BT
			selection_changed = true
		}
		
		if (keyboard_check_pressed(global.CONFIRM))
		{
			switch (menu_selection)
			{
				case FIGHT_BT:
					set_state(FightState.TARGET_SELECT)
					break
				case ACT_BT:
					set_state(FightState.TARGET_SELECT)
					break
				case ITEM_BT:
					set_state(FightState.ITEM_SELECT)
					break
				case MERCY_BT:
					set_state(FightState.MERCY_SELECT)
					break
			}
		}
		
		if (selection_changed)
		{
			layer_sprite_change(fight_bt, menu_selection == FIGHT_BT ? spr_fight_bt_sel : spr_fight_bt)
			layer_sprite_change(act_bt, menu_selection == ACT_BT ? spr_act_bt_sel : spr_act_bt)
			layer_sprite_change(item_bt, menu_selection == ITEM_BT ? spr_item_bt_sel : spr_item_bt)
			layer_sprite_change(mercy_bt, menu_selection == MERCY_BT ? spr_mercy_bt_sel : spr_mercy_bt)
			
			heart.x = heart_positions_menu[menu_selection][0]
			heart.y = heart_positions_menu[menu_selection][1]
		}
		
		break
		case FightState.TARGET_SELECT:
			if (!line_set)
			{
				bbox.my_line = ""
				
				for (var i = 0; i < array_length(encounter.enemies); ++i)
				{
					if (instance_exists(encounter.enemies[i]))
						bbox.my_line += "* " + encounter.enemies[i].name
					
				}
				
				line_set = true
			}
			
			if (keyboard_check_pressed(global.LEFT))
			{
				submenu_selection--
			}
			
			if (keyboard_check_pressed(global.RIGHT))
			{
				submenu_selection++
			}
			
			if (keyboard_check_pressed(global.UP))
			{
				submenu_selection -= 2
			}
			
			if (keyboard_check_pressed(global.DOWN))
			{
				submenu_selection += 2
			}
			
			if (keyboard_check_pressed(global.CONFIRM))
			{
				if (!player_attack_started)
					start_player_attack(encounter.enemies[submenu_selection])
			}
			
			submenu_selection = clamp(submenu_selection, 0, array_length(encounter.enemies) - 1)
			
			heart.x = heart_positions_submenu[submenu_selection][0]
			heart.y = heart_positions_submenu[submenu_selection][1]
			
			break
        case FightState.ENEMY_ATTACK:
			if (encounter.enemies[0].dead == false)
			{
				if (!enemy_attack_started)
				{
					heart.x = 162
					heart.y = 142
					heart.enablemovement = true
					encounter.enemies[0].attacks[0].behavior()
					enemy_attack_started = true
				}
			
				if (attack_time < encounter.enemies[0].attacks[0].length)
				{
					attack_time++
				}
				else
				{
					set_state(FightState.PLAYER_MENU)
					enemy_attack_started = false
					player_attack_started = false
					menu_reset = true
					attack_time = 0
				}
				
				heart.x = clamp(heart.x, bbox.bb_left + 8, bbox.bb_right - 8)
				heart.y = clamp(heart.y, bbox.bb_top + 8, bbox.bb_bottom - 8)
			}
			else
			{
				set_state(FightState.PLAYER_MENU)
			}
            break
		case FightState.PLAYER_WON:
			audio_stop_all()
			bbox.my_line = "* You won!\n* You earned nothing."
			if (keyboard_check_pressed(global.CONFIRM))
			{
				obj_plrmove.fight = false
				obj_plrmove.enablemovement = true
				obj_plrmove.alarm[1] = 10
				obj_plrmove.actor.image_speed = 1
				obj_plrmove.steps = 100
				
				instance_create_depth(0, 0, -999, obj_fade, { target_room : global.return_room, location : [obj_plrmove.x, obj_plrmove.y] })
			}
			break
}

if ((state == FightState.TARGET_SELECT || state == FightState.ITEM_SELECT || state == FightState.MERCY_SELECT) && keyboard_check_pressed(global.CANCEL))
{
	set_state(FightState.PLAYER_MENU)
}