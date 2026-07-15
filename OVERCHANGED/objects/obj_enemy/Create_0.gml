dead = false

take_damage = function(dmg)
{
	dmg += def
	dmg = clamp(dmg, 0, 9999)
	hp -= dmg
	show_debug_message(name + " " + string(hp))
	sprite_index = hurt_sprite
	alarm[0] = 15
}