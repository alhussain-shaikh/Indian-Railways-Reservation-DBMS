var request;
function emailValidation()
{
	var email=document.form1.email.value;
	var mail2=document.getElementById("mail2");
	var i1=email.indexOf("@");
	var i2=email.indexOf(".",i1);
	var i3=email.lastIndexOf(".");
	var content="<font color='red'>incorrect email id</font>";
	var id=document.getElementById("mail");
	if(i1<=0)
	{
		id.innerHTML=content;
		mail2.innerHTML="";
		document.form1.email.focus;
		return false;
	}
	else if(i2<0 || i3==email.length-1)
	{
		id.innerHTML=content;
		mail2.innerHTML="";
		window.document.form1.email.focus;
		return false;
	}
	else
	{
		id.innerHTML="";
		//mail2.innerHTML="";
		document.form1.email.focus;
	}
	emailDatabaseCheck();
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
function emailInfo()
{
	if(request.readyState==4)
	{
		var response=request.responseText;
		var mail2=document.getElementById("mail2");
		mail2.innerHTML=response;
	}
}
function emailDatabaseCheck()
{
	request=createRequest();
	if(request==null)
		alert("unable to create request.");
	var email=document.form1.email.value;
	var url="check_ajax.jsp?email="+email;
	request.open("GET",url,true)
	request.onreadystatechange=emailInfo;
	request.send(null);
}
function complete()
{
	var v=emailValidation();
	if(v==false)
	{
		window.alert("Incorrect email id");
		return false;
	}
	v=checkPass();
	if(v==false)
	{
		window.alert("Passwords do not match.");
		return false;
	}
	return true;	
}

