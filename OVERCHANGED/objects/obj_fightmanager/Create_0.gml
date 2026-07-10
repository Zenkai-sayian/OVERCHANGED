audio_stop_all()
audio_play_sound(mus_temp_fight, 999, true)

dialogue = instance_find(obj_battle_dialogue, 0)
heart = instance_find(obj_heart, 0)
heart.enablemovement = false

turn = 0

is_player_attacking = false
is_enemy_attacking = false

menu_select = 0
menu_depth = 0
menu_change = true
text_change = true
submenu_select = 0

buttons_layer = layer_get_id("Assets_Buttons")

fight_bt = layer_sprite_get_id(buttons_layer, "graphic_2D217E0D")
act_bt = layer_sprite_get_id(buttons_layer, "graphic_489AF7B9")
item_bt = layer_sprite_get_id(buttons_layer, "graphic_58C69BD7")
mercy_bt = layer_sprite_get_id(buttons_layer, "graphic_2F0F34B9")

heart_positions_menu_one =
[
	[30, 212],
	[105, 212],
	[175, 212],
	[250, 212]
]

hp_fill_ratio = 1

end_player_attack = function(dmg, target)
{
	target.hp -= (dmg - target.df)
	show_debug_message(target)
	turn = 1
}