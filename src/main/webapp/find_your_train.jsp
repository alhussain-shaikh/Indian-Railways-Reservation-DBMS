<%@page import="java.sql.*" import="dbcon.*"%>
<head>
<link href="style.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Find Train</title>

<link rel="stylesheet" type="text/css" media="all" href="jsdatepick-calendar\jsDatePick_ltr.min.css" />

	<link rel="stylesheet" type="text/css" media="all" href="jsdatepick-calendar\jsDatePick_ltr.css" />
	<body id="train">

<script type="text/javascript" src="jsdatepick-calendar\jsDatePick.min.1.3.js"></script>
<script type="text/javascript">
	window.onload = function(){
		new JsDatePick({
			useMode:2,
			target:"inputField",
			dateFormat:"%d-%M-%Y"
			/*selectedDate:{				This is an example of what the full configuration offers.
				day:5,						For full documentation about these settings please see the full version of the code.
				month:9,
				year:2006
			},
			yearsRange:[1978,2020],
			limitToToday:false,
			cellColorScheme:"beige",
			dateFormat:"%m-%d-%Y",
			imgPath:"img/",
			weekStartDay:1*/
		});
	};
</script>
<script>
function checkDate()
{
	var d1=document.getElementById("inputField");
	if(d1.value=="")
	{

		alert("please provide date ");
		return false;	
	}	
	else
	{
		var sdate=d1.value.substring(0,2);
		var smonth=d1.value.substring(3,6);
		var syear=d1.value.substring(7,11);
		//alert(sdate+" "+smonth+" "+syear);
		var m1="";
		if(smonth=="JAN")m1=0;else if(smonth=="FEB")m1=1;else if(smonth=="MAR")m1=2;else if(smonth=="APR")m1=3;else if(smonth=="MAY")m1=4;else if(smonth=="JUN")m1=5;else if(smonth=="JUL")m1=6;else if(smonth=="AUG")m1=7;else if(smonth=="SEP")m1=8;else if(smonth=="OCT")m1=9;else if(smonth=="NOV")m1=10;else if(smonth=="DEC")m1=11;
		
		var date1=new Date();
		var cdate=date1.getDate()
		var cmonth=date1.getMonth();
		var cyear=date1.getFullYear();
		
		if(syear<cyear)
		{
			alert("Plese select correct year");
			return false;	
		}
		else if(syear>=cyear+2)
		{
			alert("you can not select that year");
			return false;
		}
		else if(syear==cyear && m1<cmonth)
		{
			alert("Plese select correct Month");
			return false;
		}
		else if(cmonth<8 && syear==cyear+1)           // less than 8 means less than sep because java script treat jan as 0 and dec as 11
		{
			alert("You cant select that year");
			return false;
		}
		else if(cmonth==8 && cdate==1 && syear==cyear+1)           // less than 8 means less than sep because java script treat jan as 0 and dec as 11
		{
			alert("You cant select that year.");
			return false;
		}
		else if(cmonth>=8 && cdate>=1 && syear==cyear+1)           
		{
			alert("You cant select that year.");
			return false;
		}		
		else if(m1==cmonth+4 && sdate>cdate)
		{
			alert("Your are only allowed to reserve seat within next 120 days");
			return false;
		}
		else if(m1>cmonth+4)
		{
			alert("Your are only allowed to reserve seat within next 4 months");
			return false;
		}
		else if(m1==cmonth && sdate<cdate)
		{
			alert("Plese select correct Date ");
			return false;
		}
		//else if()
	}
	return true;
}
</script>
</head>
<%
	String email=(String)session.getAttribute("email");
	if(email!=null)
	{
%>
		<%@include file="user_welcome.jsp"%>
<%
	}
 %>


<div>
<table width="80%" style="font-alignment:right"><tr><td align="left"><a href="index.jsp"><font color="yellow" size="5">Back!</font></a> </td><td align="right"><a href="index.jsp" align="right" valign="right"><font color="yellow" face="comic sans ms" size="5">Home!</a> </td></tr></table>
<form action="train_found.jsp"> 
<h1 align="center" valign="top" ><font color="white" face="comic sans ms" size="8">Find Your Train</font></h1><br>
<hr />

<% 	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	
	PreparedStatement ps=con.prepareStatement("select source from train_info");
	ResultSet rs=ps.executeQuery();
%>
<table align="center" id="findtrain">
<tr><td> <font color="white" face="comic sans ms" size="4">Source</font></td><td>
<select name="source">
<option>Select Source</option>
<% 
	java.util.ArrayList al=new java.util.ArrayList();
	while(rs.next())
	{
		String source=rs.getString(1);
		int index=al.indexOf(source);
		if(index==-1)
		{
	%>
			<option><%=source%></option>
	<%
		}
		al.add(source);
	}
 %>



</select></td></tr><br>
<tr><td><font color="white" face="comic sans ms" size="4">Destination</font></td><td>
<select name="dest">
<option>Select Destination</option>
<% 
	PreparedStatement ps1=con.prepareStatement("select destination from train_info");
	ResultSet rs1=ps1.executeQuery();
	al=new java.util.ArrayList();
	while(rs1.next())
	{
		String destination=rs1.getString(1);
		int index=al.indexOf(destination);
		if(index==-1)
		{
	%>
			<option><%=destination%></option>
	<%
		}
		al.add(destination);
	}
 %>

</select></td></tr><br>
<tr><td><font color="white" face="comic sans ms" size="4">journey Date</font></td><td><input id="inputField" type="text" placeholder="11 JAN 2022"size="20"  name="date"></tr><td></td><br>
<tr><td colspan="2"><center><input type="submit" onclick="return checkDate()" value="submit" style="font-size:100%"></center></td></tr>
</form>
</table>
</div>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>
<br>

<%@include file="footer.jsp"%>
<body></body>
