var request;
function sleeperFareValidation(tcode)
{
	//var tcode=document.getElementById("sleeper");
	var id=document.getElementById("fare");
	fareDatabaseCheck(tcode,"sleeper");
	return true;
}
function firstACFareValidation(tcode)
{
	//var tcode=document.getElementById("1ac");
	var id=document.getElementById("fare");
	fareDatabaseCheck(tcode,"1ac");
	return true;
}
function secondACFareValidation(tcode)
{
	//var tcode=document.getElementById("2ac");
	var id=document.getElementById("fare");
	fareDatabaseCheck(tcode,"2ac");
	return true;
}
function createRequest()
{
	try
	{
		request=new XMLHttpRequest();
	}
	catch(exc)
	{
		try
		{
			request=new ActiveXObject("MSxml2.XMLHTTP");
		}
		catch(exc)
		{
			try
			{
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			catch(exc)
			{
				request=null;
			}
		}
	}
	return request;
}
function fareInfo()
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var fare=document.getElementById("fare");
		fare.innerHTML=response;
	}
}
function fareDatabaseCheck(tcode,class_type)
{
	request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var url="check_ticket_fare.jsp?tcode="+tcode+"&class_type="+class_type;
	request.open("GET",url,true)
	request.onreadystatechange=fareInfo;
	request.send(null);
}
