<%@page import="java.sql.*" %>

<table align="right"><tr><td><td align="left"><a href="enter_pnr_no.jsp">Back!</a></td><a href="index.jsp">Home</a></td></tr></table>
<div>	
<center><h1>PNR Status</h1></center>

<%
int count=0;
int pnr_no=Integer.parseInt(request.getParameter("pnr_no"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
PreparedStatement ps3=conn.prepareStatement("select * from passenger_details where pnr_number=?");
ps3.setInt(1,pnr_no);
ResultSet rs=ps3.executeQuery();
while(rs.next())
{
count++;


String name=rs.getString(2);
int age=Integer.parseInt(rs.getString(3));
String gender=rs.getString(4);
PreparedStatement ps4=conn.prepareStatement("select * from pnr_status where pnr_number=?");
ps4.setInt(1,pnr_no);
ResultSet rs1=ps4.executeQuery();
while(rs1.next())
{

String status=rs1.getString(2);
if(count==1)
{
%>
<table align="center" width="13%"><tr><td><font color="blue"><b>PNR NUMBER : </b></font></td><td><font color="red"><%=pnr_no %></font> </td></tr></table><br>
<table height="auto" width="80%" border="0"  align="center">
	<tbody align="center">
<tr height="5%"><th>Name</th><th>Age</th><th>Gender</th><th>Status</th></tr>
<%
}
 %>


<tr height="5%"><td><%=name %></td><td><%=age %></td><td><%=gender %></td><td><%=status %></td></tr>
<%
}

}
%>
<%
if(count==0)
	{
	%>
	<center><p><font color="red" size="20%">No Record Found</font></p></center>
	<%
		}
	%>
</tbody>
</table> 
</div>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>
<br/>

<jsp:include page="footer.jsp"></jsp:include>

