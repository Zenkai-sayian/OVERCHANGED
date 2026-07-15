audio_play_sound(mus_temp,10,true)
global.song = mus_temp

display_set_gui_size(320, 240)

dialoguebox = instance_create_depth(
camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0]) / 2,
camera_get_view_y(view_camera[0]) + camera_get_view_height(view_camera[0]) - 10,
-99,obj_dialoguebox, {image_alpha : 0})