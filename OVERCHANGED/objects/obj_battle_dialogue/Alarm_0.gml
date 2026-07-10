text_pos++

if (string_char_at(text, text_pos) == "%")
{
	text_pos++
	switch (string_char_at(text, text_pos))
	{
		case "s":
			text_speed = real(string_char_at(text, text_pos + 1) + string_char_at(text, text_pos + 2))
			text_pos += 3
			break
	}
}

if (text_pos == string_length(text))
	done = true

show_text += string_char_at(text, text_pos)
if (!done)
	audio_play_sound(snd_txt2, 999, false)
	
alarm[0] = text_speed