event_inherited()

if (hp <= 0 && !dead)
{
	dead = true
	sprite_index = spr_enemy_test_dead
}

if (dead)
{
	if (image_index > image_number - 1)
		instance_destroy(id)
}