
function mobileValidation()
{
var a=document.form1.mobile.value;

if(isNaN(a))
{
alert("Enter the valid Mobile Number(Like : 9566137117)");
document.form1.mobile.focus();
return false;
}
else if((a.length < 1))
{
alert(" Your Mobile Number must not be empty");
document.form1.mobile.select();
return false;
}
else if(a.length!=10)
	{
		alert(" Please Enter 10 digit Contact Number");
		document.form1.mobile.select();
		return false;
	}
return true;
}
