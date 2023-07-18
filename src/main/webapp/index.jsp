<html id="home">
<link href="style.css" rel="stylesheet" type="text/css"/>
<!-- <script type="text/javascript" src="refresh.js"></script> -->
<%
String type=(String)session.getAttribute("type");
String email=(String)session.getAttribute("email"); 
String username=(String)session.getAttribute("username");
if(email!=null)
{
%>
<table width="100%" align="center"><tr><td><font color="White" face="comic sans ms">Welcome :</font> <font color="red"><%=username %></font></td><td align="right"><a href="logout.jsp" align="right"><font color="white" face="comic sans ms">Logout!</font></a> </td></tr></table>
<jsp:include page="header.jsp"/>
<%if(type.equals("user"))
	{
 %>
	<jsp:include page="login_body.jsp"/>
<%
	}
	else
	{
 %>
		<jsp:include page="admin_body.jsp"/>
<%
	}
} 
else
{
%>
<jsp:include page="header.jsp"/>
<jsp:include page="body.jsp"/>
<%} %>
<br/>
<br/>
<jsp:include page="footer.jsp"/>
</html>