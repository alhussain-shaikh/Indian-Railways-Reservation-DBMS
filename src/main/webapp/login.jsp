<jsp:useBean id="t2" class="user.UserLogin"/>
<jsp:setProperty name="t2" property="*"/>
<% String valid=t2.validate();
	if(!valid.equals("invalid"))
	{
			
		String st[]=valid.split(" ");
		System.out.println(valid);
		System.out.println(st[0]+" "+st[1]);
		session.setAttribute("type",st[0]);
		session.setAttribute("email",st[1]);
		session.setAttribute("username",st[2]);
 %>
	<jsp:include page="index.jsp"/>
 <%	
 }
 else
 	{
 		out.println("<font color='green'><b>Wrong Email Id or Password...try again.</b></font>");
  %>	
<table width="80%"><tr><td align="left"><a href="index.jsp" align="right"><font color="brown" size="5">Back!</font></a> </td></tr></table>
  	<%
  	}
  	
 %>