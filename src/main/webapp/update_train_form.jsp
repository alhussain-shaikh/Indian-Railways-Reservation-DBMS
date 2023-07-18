<%@page import="java.sql.*" %>
<%@page errorPage="err.jsp" %>


<script type="text/javascript" src="train_validation.js">
</script>
<%
	int tcode1=Integer.parseInt(request.getParameter("tcode"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	PreparedStatement ps=con.prepareStatement("select * from train_info where train_code="+tcode1);
	ResultSet rs=ps.executeQuery();
 %>

<table width="80%"><tr><td align="right"><a href="index.jsp" align="right">Home!</a> </td></tr></table>
<table height="600" width="800" border="1" bgcolor="" align="center">
<form name="form1" action="update.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2>
					Update Train
				</h2>
			</td>
		</tr>
		<%
	if(rs.next())
	{
		int tcode=rs.getInt(1);
		String tname=rs.getString(2);
		String tsource=rs.getString(3);
		String tdest=rs.getString(4);
		String tdistance=rs.getString(5);
		String ttravel_time=rs.getString(6);
		String tdeparture_time=rs.getString(7);
		String tarrival_time=rs.getString(8);
		ps=con.prepareStatement("select * from train_via where train_code=?");
		ps.setInt(1,tcode);
		ResultSet rs2=ps.executeQuery();
		PreparedStatement ps2=con.prepareStatement("select * from train_days where train_code=?");
		ps2.setInt(1,tcode);
		ResultSet rs3=ps2.executeQuery();
		PreparedStatement ps3=con.prepareStatement("select * from train_coach where train_code=?");
		ps3.setInt(1,tcode);
		ResultSet rs4=ps3.executeQuery();
		int sleeper_class=0;
		int firstac_class=0;
		int secondac_class=0;
		if(rs4.next())
		{
			sleeper_class=rs4.getInt(2);
		 firstac_class=rs4.getInt(3);
		 secondac_class=rs4.getInt(4);
			}
 %>	
 

		<tr>
			<td valign="middle" align="left">&nbsp; Train Name :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="tname" value="<%=tname%>" maxlength="auto" >
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Train Code &nbsp; :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="tcode" value="<%=tcode %>" readonly="readonly"/>
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp;Source :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="source" value="<%=tsource %>" />
				
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Destination :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="dest" value="<%=tdest%>"/>
			</td>
		</tr>
		

			<td valign="middle" align="left" height="8%">&nbsp; Running Days : <br></td><td align="left" valign="middle" height="8%">&nbsp; 
				<%
				String train_running_days[]=new String[7];
		while(rs3.next())
		{
			String days=rs3.getString(2);
			if(days.equals("Sun"))
				train_running_days[0]="Sun";
			else if(days.equals("Mon"))
				train_running_days[1]="Mon";
			else if(days.equals("Tue"))
				train_running_days[2]="Tue";
			else if(days.equals("Wed"))
				train_running_days[3]="Wed";
			
			else if(days.equals("Thu"))
				train_running_days[4]="Thu";
			else if(days.equals("Fri"))
				train_running_days[5]="Fri";
			else if(days.equals("Sat"))
				train_running_days[6]="Sat";
		}
			%>
			
				
				
			Sunday
			<% if(train_running_days[0]!=null)
			{
			 %>
				<input  checked="checked" type="checkbox" value="Sun" name="sunday"> 
				
			<% }else {%>
			    <input type="checkbox" value="Sun" name="sunday"> 
			    <%} %>
			Monday 
			<% if(train_running_days[1]!=null)
			{
			 %>
				<input checked="checked" type="checkbox" value="Mon" name="monday">
				<%} else {%>
				<input type="checkbox" value="Mon" name="monday">
				 <%} %>
			Tuesday 
			<% if(train_running_days[2]!=null)
			{
			 %>
				<input checked="checked" type="checkbox" value="Tue" name="tuesday">
				<%} else {%>
				<input type="checkbox" value="Tue" name="tuesday">
				 <%} %>
			Wednesday 
			<% if(train_running_days[3]!=null)
			{
			 %>
				<input checked="checked" type="checkbox" value="Wed" name="wednesday">
				<%} else {%>
				<input type="checkbox" value="Wed" name="wednesday">
				 <%} %>
			Thursday 
			<% if(train_running_days[4]!=null)
			{
			 %>
				<input checked="checked" type="checkbox" value="Thu" name="thursday">
				<%} else {%>
				<input type="checkbox" value="Thu" name="thursday">
				 <%} %>
			Friday 
			<% if(train_running_days[5]!=null)
			{
			 %>
				<input checked="checked" type="checkbox" value="Fri" name="friday">
				<%} else {%>
				<input type="checkbox" value="Fri" name="friday">
				 <%} %>
			Saturday
			<% if(train_running_days[6]!=null)
			{
			 %>
				<input checked="checked" checked="checked" type="checkbox" value="Sat" name="saturday"></td>
				<%} else {%>
				<input type="checkbox" value="Sat" name="saturday"></td>
				 <%} %>
				</td>
		</tr>
		<%
		String via="";
		while(rs2.next())
		{
			via=via+","+rs2.getString(2);
 %> 
 <%
 		}
 		if(!via.equals(""))
 			via=via.substring(1,via.length());
  %>
		<tr>
			<td valign="middle" align="left">&nbsp; Via :</td><td align="left" valign="middle" height="8%">&nbsp; 
				<input type="text" name="via" value="<%=via%>"/>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left">&nbsp;Distance :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="distance" value="<%=tdistance%>" maxlength="auto" >
			</td>
			</tr>
			<td valign="middle" align="left">&nbsp;Travel Time :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="travel_time" value="<%=ttravel_time%>" maxlength="auto" >
			</td>
			</tr>
			<td valign="middle" align="left">&nbsp;Departure Time :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="departure_time" value="<%=tdeparture_time%>" maxlength="auto" >
			</td>
			</tr>
			<td valign="middle" align="left">&nbsp;Arrival Time :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="arrival_time" value="<%=tarrival_time%>" maxlength="auto" >
			</td>
			</tr>
			<tr>
			<td valign="middle" align="left">&nbsp; Sleeper Class :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="sleeper_class" value="<%=sleeper_class%>" maxlength="auto" >
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left">&nbsp; FirstAC_Class :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="firstac_class" value="<%=firstac_class%>" maxlength="auto" >
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left">&nbsp; SecondAC Class :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="secondac_class" value="<%=secondac_class%>" maxlength="auto" >
			</td>
		</tr>
		<tr>
			<td colspan=2 height="7%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="update!"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;			
             <%
             } 
             %>
		

		</td>
		
		


	</tr>

	</tbody>
	</form>
</table>
<br>