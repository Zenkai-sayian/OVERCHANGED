#macro FIGHT_BT 0
#macro ACT_BT   1
#macro ITEM_BT  2
#macro MERCY_BT 3

enum FightState
{
	INTRO         = 0,
	PLAYER_MENU   = 1,
	TARGET_SELECT = 2,
	ACT_SELECT    = 3,
	ITEM_SELECT   = 4,
	MERCY_SELECT  = 5,
	ENEMY_ATTACK  = 6,
	PLAYER_WON    = 7
}

global.encounters = 
[
	{
		name : "encounter_test1",
		enemy_count : 1,
		intro_line : "* Test encounter intro!",
		initialized : false,
		init : function(s)
		{
			obj_battle_box.use_ideal()
			obj_battle_box.my_line = intro_line
			s.enemies[0] = instance_create_depth(80, 50, -999, obj_enemy,
			{
				name         : "Test",
				hp           : 35,
				def          : 3,
				idle_sprite  : spr_enemy_test,
				sprite_index : spr_enemy_test,
				image_index  : 1,
				image_speed  : 1,
				hurt_sprite  : spr_enemy_test_hurt,
				acts         : 
				[
					{
						name      : "* Check",
						bbox_line : "* Test check",
						effect    : function(target) {}
					}
				],
				attacks      :
				[
					{
						name : "attack_test",
						behavior : function()
						{
							obj_battle_box.my_line = ""
							obj_battle_box.target_left += 100
							obj_battle_box.target_right -= 100
							instance_create_depth(0, 0, -800, obj_simple_bullet)
							instance_create_depth(100, 0, -800, obj_simple_bullet)
							instance_create_depth(150, 0, -800, obj_simple_bullet)
						},
						length : 120
					}
				]
			})
			show_debug_message(s.name + " initialized")
			s.initialized = true
		}
	}
]