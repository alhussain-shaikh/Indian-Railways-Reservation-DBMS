<%@page import="java.sql.*" %>
<%@page errorPage="err.jsp" %>
<script type="text/javascript" src="train_validation.js">
</script>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	PreparedStatement ps=con.prepareStatement("select * from train_info");
	ResultSet rs=ps.executeQuery();
 %>
<table width="80%"><tr><td align="right"><a href="index.jsp" align="right">Home!</a></td></tr></table>
<table height="auto" width="800" border="1" bgcolor="aquagreen" align="center" bordercolor=aquab">
<form name="form1" action="add_train.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=8 height="10%">
				<h2>
					Train Information
				</h2>
			</td>
		</tr>
		<tr>
			<th>Train Name</th><th>Train Code</th><th>Source</th><th>Destination</th><th>Via</th><th>Running Days</th>
		</tr>
<%
	while(rs.next())
	{
		int tcode=rs.getInt(1);
		String tname=rs.getString(2);
		String tsource=rs.getString(3);
		String tdest=rs.getString(4);
		ps=con.prepareStatement("select * from train_via where train_code=?");
		ps.setInt(1,tcode);
		ResultSet rs2=ps.executeQuery();
		PreparedStatement ps2=con.prepareStatement("select * from train_days where train_code=?");
		ps2.setInt(1,tcode);
		ResultSet rs3=ps2.executeQuery();
 %>
	<tr>
		<td><%=tname %></td><td><%=tcode %></td><td><%=tsource %></td><td><%=tdest %></td>
		<td>
<%
		while(rs2.next())
		{
			String via=rs2.getString(2);
			System.out.println(via);
 %> 
 			<label><%=via%></label><input checked="checked" type="radio"/>
 <%
 		}
  %>
		</td>
		
		<td>
<%
		while(rs3.next())
		{
			String days=rs3.getString(2);
			System.out.println(days);
 %> 
 			<label><%=days%></label><input checked="checked" type="radio"/>
 <%
 		}
  %>
		</td>
	</tr>
 <%
 	}
  %>
	</tbody>
	</form>
</table>