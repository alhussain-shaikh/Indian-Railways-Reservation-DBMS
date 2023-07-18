<%
String email=(String)session.getAttribute("email"); 
 if(email!=null)
{
%>
<%session.invalidate(); %>
<font color='green'><b>Logged out Successfully...</b></font>
<%
}
response.sendRedirect("index.jsp");
 %>