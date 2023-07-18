<%@page import="java.sql.*" %>
<table align="right"><tr><td><td align="left"><a href="index.jsp">Back!</a></td><a href="index.jsp">Home</a></td></tr></table>
<%
String email=(String)session.getAttribute("email");
System.out.println(email);
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
PreparedStatement ps3=conn.prepareStatement("select o.*,p.status from train_booking_info o, pnr_status p where o.email=? and o.pnr_no=p.pnr_number");
ps3.setString(1,email);
ResultSet rs=ps3.executeQuery();
%>



	<tbody align="center">
	<%
	int count=0;
	while(rs.next())
{
count++;
if(count==1)
{
%>
<table height="auto" width="80%" border="1"  align="center" style="width:100%;border-collapse: collapse;border-spacing: 15px;">
<center><h1><font size="20%" color="blue">Your Ticket History/Cancel Your Ticket</font></h1></center>
<tr><th>PNR No</th><th>Train No</th><th>Source</th><th>Destination</th><th>Booking Date</th><th>Transaction ID</th><th>Paid Amount</th><th>Email</th><th>Mobile No</th></tr>
<%
}
%>
<%
int pnr_no=rs.getInt(1);
int tcode=rs.getInt(2);
String source=rs.getString(3);
String destination=rs.getString(4);
String booking_date=rs.getString(5);
long transaction_id=rs.getLong(6);
int paid_amount=rs.getInt(7);
String user_email=rs.getString(8);
long mobile_no=rs.getLong(9);
String status=rs.getString(10);
 %>
				
		

	<tr><td style="padding: 10px"><%=pnr_no%></td><td><%=tcode %></td><td><%=source %></td><td><%=destination %></td><td><%=booking_date %></td><td><%=transaction_id %></td><td><%=paid_amount %></td><td><%=user_email %></td><td><%=mobile_no %></td>
<td>
<%
	if(status.equalsIgnoreCase("Cancelled"))
	{
		out.println(status);
	}
	else
	{
%>
<a href="cancel_ticket.jsp?pnr_no=<%=pnr_no%>">Cancel</a>
<%
	}
%>
</td></tr>
	<%
	}
	 if(count==0)
	{
	%>
	<center><p><font color="red" size="20%">No Record Found</font></p></center>
	<%
		}
	%>
</table> 

<br/>
<br/>
<br/>

</div>