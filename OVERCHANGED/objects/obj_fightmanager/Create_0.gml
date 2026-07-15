audio_stop_all()
audio_play_sound(mus_panic_valor, 1, true)

encounter = 
{
	name        : global.encounters[global.use_encounter].name,
	intro_line  : global.encounters[global.use_encounter].intro_line,
	initialized : global.encounters[global.use_encounter].initialized,
	init		: global.encounters[global.use_encounter].init,
	enemies      : []
}

bbox  = instance_find(obj_battle_box, 0)
heart = instance_find(obj_heart, 0)

button_layer = layer_get_id("Assets_Buttons")
fight_bt     = layer_sprite_get_id(button_layer, "inst_fight")
act_bt       = layer_sprite_get_id(button_layer, "inst_act")
item_bt      = layer_sprite_get_id(button_layer, "inst_item")
mercy_bt     = layer_sprite_get_id(button_layer, "inst_mercy")

state = FightState.INTRO

line_set = false
menu_reset = true

menu_selection    = FIGHT_BT
submenu_selection = 0
selection_changed = true

player_attack_started = false
enemy_attack_started  = false
attack_time = 0

heart_positions_menu = 
[
	[30, 220],
	[105, 220],
	[180, 220],
	[250, 220]
]

heart_positions_submenu = 
[
	[bbox.x + 8, bbox.y + 16],
	[102, 140],
	[72, 160],
	[102, 160],
	[72, 180],
	[102, 180]
]

set_state = function(_state)
{
	state = _state
	selection_changed = true
	line_set = false
}

start_player_attack = function(target)
{
	instance_create_depth(16, 110, -600, obj_field, {target : target})
	player_attack_started = true
}