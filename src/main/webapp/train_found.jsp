<%@page import="java.sql.*" %>
<%@page errorPage="err.jsp" %>
<script type="text/javascript" src="train_validation.js">
</script>
<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	String source=request.getParameter("source").toLowerCase();
	String dest=request.getParameter("dest").toLowerCase();
	String date=request.getParameter("date");
	String class1=request.getParameter("class");
	PreparedStatement ps=con.prepareStatement("select * from train_info where source=? and destination=?");
	ps.setString(1,source);
	ps.setString(2,dest);
	ResultSet rs=ps.executeQuery();
 %>
<table width="100%" style="border-collapse: collapse;"><tr><td align="left"><a href="index.jsp" align="right"><font color="blue" size="5">HOME!</font></a> </td><td align="right"><a href="index.jsp" align="right">Home!</a></td></tr></table>
<table height="auto" width="100%" border="1" bgcolor="aquagreen" align="center" bordercolor=aquab" style="border-collapse: collapse;">

	<tbody align="center">
		<tr align="center">
			<td  colspan=15 height="10%">
				<h2>
					Train Information
				</h2>
			</td>
		</tr>
		<tr>
			<th>Train Name</th><th>Train Code</th><th>Source</th><th>Destination</th><th>Distance</th><th>Travel time</th><th>Departure Time</th><th>Arrival Time</th><th>Via</th><th width="40%">Running Days</th><th>Sleeper Class</th><th>FirstAC Class</th><th>SecondAC Class</th>
		</tr>
<%
	while(rs.next())
	{
		int tcode=rs.getInt(1);
		String tname=rs.getString(2);
		String tsource=rs.getString(3);
		String tdest=rs.getString(4);
		String tdistance=rs.getString(5);
		String ttravel=rs.getString(6);
		String tdeparture=rs.getString(7);
		String tarrival=rs.getString(8);
		ps=con.prepareStatement("select * from train_via where train_code=?");
		ps.setInt(1,tcode);
		ResultSet rs2=ps.executeQuery();
		PreparedStatement ps2=con.prepareStatement("select * from train_days where train_code=?");
		ps2.setInt(1,tcode);
		ResultSet rs3=ps2.executeQuery();
		PreparedStatement ps3=con.prepareStatement("select * from train_coach where train_code=?");
		ps3.setInt(1,tcode);
		ResultSet rs4=ps3.executeQuery();
 %>
	<tr>
		<td style="padding: 10px"><%=tname %></td><td><%=tcode %></td><td><%=tsource %></td><td><%=tdest %></td><td><%=tdistance %></td><td><%=ttravel %></td><td><%=tdeparture %></td><td><%=tarrival %></td>
		<td width="50%">
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
  <%
  	while(rs4.next())
  	{
  		int sleeper_class=rs4.getInt(2);
  		int firstac_class=rs4.getInt(3);
  		int secondac_class=rs4.getInt(4);
  		%>
  		<td><%=sleeper_class %></td><td><%=firstac_class%></td><td><%=secondac_class%></td>
  <%
  	}
   %>
   
		</td>

	</tr>
 <%
 	}
  %>
	</tbody>
	
</table>
<table width="100%"><tr><td align="right"><a href="find_your_train.jsp"><font color="blue" size="5">Back!</font></a> </td>