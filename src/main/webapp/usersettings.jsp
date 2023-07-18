<%@page import="java.sql.*" %>
<%@page errorPage="err.jsp" %>
<script type="text/javascript">
</script>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	PreparedStatement ps=con.prepareStatement("select * from user_info");
	ResultSet rs=ps.executeQuery();
 %>

<table width="80%"><tr><td align="right"><a href="index.jsp" align="right">Home!</a> </td></tr></table>
<table height="600" width="800" border="1" bgcolor="" align="center">
<form name="form1" action="update.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2>
					Update Your Profile
				</h2>
			</td>
		</tr>
		<%
	while(rs.next())
	{
		String name=rs.getString(1);
		String email=rs.getString(2);
		String password=rs.getString(3);
		String gender=rs.getString(4);
		long contact=rs.getLong(5);

 %>	
 

		<tr>
			<td valign="middle" align="left">&nbsp; Name :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="name" value="<%=name%>" maxlength="auto" >
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; EMAIL &nbsp; :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="email" value="<%=email %>">
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp;Password :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="password" value="<%=password %>" />
				
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Gender:</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="gender" value="<%=gender%>"/>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Contact : <br></td><td align="left" valign="middle" height="8%">&nbsp; 
	  <%}%>
	  
	</tbody>
	
	</form>
</table>
<br>