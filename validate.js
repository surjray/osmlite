function validateForm(frm)
{
	with(frm)
	{
		for(var i in frm.elements)
		{
			var field=frm.elements[i];
			if(empty(field))
				return false;
			else if(field.id=='num' && !isNum(field))
				return false;
			else if(field.id=='email' && !validEmailAddr(field))
				return false;
		}
		return true;	
	}
}

function empty(field)
{
	with(field)
	{
		if(value==null||value=="")
		{
			alert("Field can not be empty.");
			field.focus();
			return true;
		}
		else return false;
	}
}

function validEmailAddr(field)
{
	with(field)
	{
		var atpos=value.indexOf("@");
		var dotpos=value.lastIndexOf(".");
		if(atpos<1 || (dotpos-atpos)<3 || (value.length-(dotpos+1))<2)
		{
			alert("Not a valid email address.");
			field.focus();
			return false;
		}
		return true;
	}
}
function isNum(field) 
{
	if(isNaN(field.value))	
	{
		alert("Invalid input.");
		field.focus();
		return false;
	}
	return true;
}
