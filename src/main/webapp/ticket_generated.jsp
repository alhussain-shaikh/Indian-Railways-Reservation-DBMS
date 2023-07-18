<%@page import="java.sql.*" %>
<%java.util.ArrayList al=new java.util.ArrayList();%>
<%
int tcode=(Integer)session.getAttribute("tcode");
String source=(String)session.getAttribute("source");
String dest=(String)session.getAttribute("dest");
String date=(String)session.getAttribute("date");
int tf=(Integer)session.getAttribute("total_fare");
String total_fare=""+tf;
String email=(String)session.getAttribute("email");
System.out.println(email);
String mobileNo=(String)session.getAttribute("mobile");
java.util.ArrayList pl=(java.util.ArrayList)session.getAttribute("passengerList");
String class_type=(String)session.getAttribute("class_type");
String pnr_no=(String)session.getAttribute("pnr_no");
String status=(String)session.getAttribute("status");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
PreparedStatement ps3=conn.prepareStatement("select train_name from train_info where train_code=?");
ps3.setInt(1,tcode);
ResultSet rs=ps3.executeQuery();
rs.next();
String train_name=rs.getString(1);
 %>
<div>
				<center><h2>Ticket Details</h2></center>
<table height="auto" width="80%" border="0"  align="center">
	<tbody align="center">

		<tr height="5%"><th>S.NO.</th><th>Name</th><th>Age</th><th>Gender</th><th>Berth</th><th>Status</th></tr>
<%
	for(int j=0; j<pl.size(); j++)
	{
		String passengers=(String)pl.get(j);
		String pd[]=passengers.split(":");
		int berthNo=(int)(Math.random()*30);
%>
	<tr height="5%"><td><%=j+1 %></td><td><%=pd[0] %></td><td><%=pd[1] %></td><td><%=pd[2] %></td><td>S<%=berthNo %></td><td><%=status %></td></tr>
<%
	}
 %>
</table> 
<br/>
<br/>
<br/>
<table width="80%" align="center">
	<tr height="5%"><th>PNR No<th>Train No</th><th>Train Name</th><th>Total Fare</th><th>Date Of Journey</th></tr>
	<tr height="5%" align="center"><td><%=pnr_no %></td><td><%=tcode %></td><td><%=train_name %></td><td><%=total_fare %></td><td><%=date %></td></tr>
</table>
<br/>
<br/>
<br/>
<table width="80%"><tr><td align="center"><a href="index.jsp" align="right">Back To Home!</a> </td></tr></table>
</div>