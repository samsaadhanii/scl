/*

Copyright (C) 2005 Sunil Mohan Adapa <sunil at atc tcs co in>

This program is free software; you can redistribute it and/or 
modify it under the terms of the GNU General Public License 
as published by the Free Software Foundation; either 
version 2 of the License, or (at your option) any later 
version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
*/

function register_keys ()
{
	enable_keyboard_shortcuts ();
	
	var input_fields = document.getElementsByTagName("INPUT");
	for (i=0; i < input_fields.length; i++)
	{
		input_fields[i].onfocus = disable_keyboard_shortcuts;
		input_fields[i].onblur = enable_keyboard_shortcuts;
	}
	/*
	if (initial_hide_rows)
	{
		for (var i=0; i< initial_hide_rows.length; i++)
		{
			if (0 == initial_hide_rows[i])
				show_hide ("row" + (i+1));
		}
	}
	*/
}

function enable_keyboard_shortcuts ()
{
	document.onkeypress = key_press;
}

function disable_keyboard_shortcuts ()
{
	document.onkeypress = "";
}

function show_hide(row)
{
	var row_name = "row" + row;
	var display = "none";
	rows_visibility[row-1] = get_row_display_status(row) ? 0 : 1;
	if (rows_visibility[row-1])
	{
		display = "";
	}

	var css_rules;
	if (document.styleSheets[1].cssRules)
		css_rules = document.styleSheets[1].cssRules;
	else // Stupid, Ugly, Braindead, Idiotic IE
		css_rules = document.styleSheets[1].rules;
		
	for (i = 0; i < css_rules.length; i++)
		if (match_selector_text (css_rules[i].selectorText, "tr." + row_name))
			css_rules[i].style.display = display;
}

function match_selector_text (text1, text2)
{
	text1 = text1.toLowerCase();
	text2 = text2.toLowerCase();

	if (text1 == text2)
		return true;

	regexp = new RegExp(text2 + "[^0-9a-zA-Z_.].*");
	if (text1.match (regexp))
		return true;
	return false;
}

function get_row_display_status (row)
{
	return rows_visibility[row-1];
}

function get_label (row)
{
	if (row_labels)
		return row_labels[row-1];
	return "Row" + row;
}

function get_description (row)
{
	if (row_descriptions)
		return row_descriptions[row-1];
	return "Row" + row;
}

function key_press (event)
{
	// Obtain the event from crazy browsers
	if (!event) event = window.event;

	// Obtain the key code
	var key_code;
	if (event.which)
		key_code = event.which;
	if (event.keyCode)
		key_code = event.keyCode;

	// To Upper
	if (key_code >= 97 && key_code <= 122)
		key_code = key_code - 97 + 65;

	if (key_code >= 65 && key_code <= 90)
	{
		show_hide ((key_code - 65 + 1));
	}
}

function goto_section()
{
	window.open("#sentence_" + document.forms[0].goto_section_value.value, "_self", "");
}

function toggle_borders()
{
        var css_rules;
        if (document.styleSheets[0].cssRules)
                css_rules = document.styleSheets[0].cssRules;
        else // Stupid, Ugly, Braindead, Idiotic IE
                css_rules = document.styleSheets[0].rules;

	var value = document.forms[0].border_value.checked == true ? "black" : "white"
        for (i = 0; i < css_rules.length; i++)
                if (match_selector_text (css_rules[i].selectorText, "td"))
		{
                        css_rules[i].style.borderColor = value;
			break;
		}
}

function toggle_numbers()
{
        var css_rules;
        if (document.styleSheets[0].cssRules)
                css_rules = document.styleSheets[0].cssRules;
        else // Stupid, Ugly, Braindead, Idiotic IE
                css_rules = document.styleSheets[0].rules;

	var value = document.forms[0].numbers_value.checked == true ? "black" : "lightgreen"
        for (i = 0; i < css_rules.length; i++)
                if (match_selector_text (css_rules[i].selectorText, "td.number"))
		{
                        css_rules[i].style.color = value;
			break;
		}
}

