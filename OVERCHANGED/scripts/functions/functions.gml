
function print(stuff)
{
	var p = ""
	for (var i = 0; i < array_length(stuff); i++)
	{
		p = string_concat(p, stuff[i], " ")
	}
	show_debug_message(p)
}