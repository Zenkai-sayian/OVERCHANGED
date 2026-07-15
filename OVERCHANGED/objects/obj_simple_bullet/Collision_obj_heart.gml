if (!other.iframes)
{
	global.hp -= 3
	audio_play_sound(snd_hurt1, 99, false)
	show_debug_message("hit")
	other.iframes = 15
	instance_destroy(id)
}