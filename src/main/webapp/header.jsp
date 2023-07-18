<html>
<link href="style.css" rel="stylesheet" type="text/css"/>
<body>
<br/>

<table height="250" width="88%" border="0" align="center" id="header">
<tbody><tr align="center" id="logo">
<td ><font color=White face="comic sans ms" size="5"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br><h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Welcome To Indian Railway!</h1></font> <br></td>
</tr>

<tr align="center" height="40">
<td align="center" ><a href="index.jsp"><font color="white" face="comic sans ms">Home</font></a> </td>
<%String email=(String)session.getAttribute("email"); 
String username=(String)session.getAttribute("username");
if(email!=null)
{
%>
<td><a href="reservation_form.jsp"><font color="white" face="comic sans ms">Reservation</font></a> </td>
<%} 
else
{
%>
<td ><a href="signup.jsp"><font color="white" face="comic sans ms">Sign UP</font></a> </td>
<%} %>
<td><a href="enter_pnr_no.jsp" name="pnr_no"><font color="white" face="comic sans ms">PNRStatus</font></a> </td>
<td><a href="find_your_train.jsp"><font color="white" face="comic sans ms">Find your Train</font></a> </td>
<td><a href="Contact.jsp"><font color="white" face="comic sans ms">Contact Us</font></a></td>
<td><a href="About.jsp"><font color="white" face="comic sans ms">About Us</font></a> </td></tr>
</tbody>
</table>