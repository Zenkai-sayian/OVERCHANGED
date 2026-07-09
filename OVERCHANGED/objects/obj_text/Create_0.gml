xdist = 0
ydist = 0
trueord = 0
letterz = array_create(string_length(setstring),0)
wordz = string_split(setstring,chr(32))
canto = 0
llist = []
tr = 0
bad = 0
first = 0
dcount = 0
waw = 0
visib = 0
richtext = 0
//show_debug_message(string_concat("LENGTH : ",string_length(setstring)))
//show_debug_message(wordz)
show_debug_message(string_concat("maxlwidth: ", string(maxlwidth)))
show_debug_message(string_concat("setstring: ", setstring))

//parses rich text
    var _words = string_split(setstring, chr(32));
    var open_styles = [];
    var pending_word_idx = -1;  
    var cleanWords = [];
    var rawBlocks = [];         

    for (var i = 0; i < array_length(_words); i++) {
        var _w = _words[i];
        var _len = string_length(_w);

        if (_w == "end\\") {
            if (array_length(open_styles) > 0) {
                array_push(rawBlocks, {
                    styles : open_styles,
                    startWordIdx : pending_word_idx,
                    endWordIdx : array_length(cleanWords) - 1
                });
            }
            open_styles = [];
            pending_word_idx = -1;
            continue;
        }

        if (_len > 1 && string_char_at(_w, 1) == "\\") {
            array_push(open_styles, string_delete(_w, 1, 1)); 
            continue;
        }

        if (array_length(open_styles) > 0 && pending_word_idx == -1) {
            pending_word_idx = array_length(cleanWords);
        }
        array_push(cleanWords, _w);
    }
    var _cleanTxt = "";
    var wordCharStart = array_create(array_length(cleanWords), 0);
    var wordCharEnd = array_create(array_length(cleanWords), 0);
    for (var i = 0; i < array_length(cleanWords); i++) {
        wordCharStart[i] = string_length(_cleanTxt);
        _cleanTxt += cleanWords[i];
        wordCharEnd[i] = string_length(_cleanTxt) - 1; // last char index of this word
        if (i != array_length(cleanWords) - 1) _cleanTxt += " ";
    }
    var listB = [];
    for (var i = 0; i < array_length(rawBlocks); i++) {
        var _b = rawBlocks[i];
        array_push(listB, {
            styles : _b.styles,
            location : [ wordCharStart[_b.startWordIdx], wordCharEnd[_b.endWordIdx] ]
        });
    }

richtext = listB

//per word
for (var i  = 0; i < (array_length(wordz)); i++)
{
	//per letter
	var _cur = wordz[i]
	for (var l = 0; l < string_length(_cur); l++)
	{
		if l = 0
		{
			first = waw
		}
		var _letterord = ord(string_char_at(_cur,l + 1)) - 32
		visib = _letterord
		var _sprlength = (sprite_get_width(spr_maintext) - global.font1[_letterord])
		canto += hspace
		show_debug_message(string_concat("canto: ", string(canto), " maxlwidth: ", string(maxlwidth), " sprlength: ", string(_sprlength)))
		if canto + _sprlength > maxlwidth
		{
			//show_debug_message(string_concat("canto: ", canto))
			canto = 0
			bad = first
		}
		canto += _sprlength
		waw += 1
		show_debug_message(string_concat("space width: ", string(sprite_get_width(spr_maintext) - global.font1[0]), " canto after space: ", string(canto)))
	}
	if bad != 0
	{
		//show_debug_message(string_concat("yes, theres bad: ", bad))
		array_push(llist,bad)
		tr = 1
		bad = 0
	}
	waw += 1
	canto += (sprite_get_width(spr_maintext) - global.font1[0])
	//show_debug_message(string_concat("loop: ", i))
}


//show_debug_message(llist)
show_debug_message(string_concat(string(llist), "aaaaa"))  // <-- here
for (var i = 0; i < string_length(setstring);i ++)
{
	var k = -1
	if tr != 0 && dcount < array_length(llist)
	{
	    k = llist[dcount]
	}
	var p = 0
	var _child = 0
	var _letterord = ord(string_char_at(setstring,i + 1)) - 32
	var _sprlength = (sprite_get_width(spr_maintext) - global.font1[_letterord])
	var _sprheight = 18 * image_yscale
	
	//show_debug_message(string_concat(string_char_at(setstring,i + 1)," ",_letterord, " ", _sprlength))
	
	if i = k
	{
	    trueord = 0
	    xdist = 0
	    ydist += 1
	    dcount += 1  // just always increment, k will become -1 naturally on next iter
	}
	if _letterord = 74
		{
			if xdist != 0
			{
				switch string_char_at(setstring,i)
				{
					case "y" :
					break
					case "j" :
					break
					case "q" :
					break
					case "g" :
					break
					default :
					xdist -= 3
					break
				}
			}
			else
			{
				xdist -=2
			}
		}
		if 1 = 0
		{
		_child = instance_create_depth(xdist * image_xscale,((ydist * _sprheight) + (ydist * vspace)) * image_yscale,depth,obj_letters,{
			lttr : _letterord,
			order : i,
			xdista : xdist,
			ydista : ydist,
			dad : id,
			trueorder : trueord
		})
		letterz[i] = _child
		}
	xdist += _sprlength
	trueord += 1
}