<%java.util.ArrayList al=new java.util.ArrayList();%>
<%
	String passenger1=request.getParameter("passenger1");
	String passenger2=request.getParameter("passenger2");
	String passenger3=request.getParameter("passenger3");
	String passenger4=request.getParameter("passenger4");
	String passenger5=request.getParameter("passenger5");
	String passenger6=request.getParameter("passenger6");
	String mobileNo=request.getParameter("mobile");
	int net_fare=(Integer)session.getAttribute("net_fare");	
	int total_fare=0;
 %>
 <link href="style.css" rel="stylesheet" type="text/css"/>
<body bgcolor="sky blue">
<div>
<table width="80%"><tr><td align="right" id="payment"><a href="index.jsp" align="right">Home!</a> </td></tr></table>
<table height="400" width="600" border="1"  align="center" style="border-collapse: collapse;">
<form name="form1" action="payment.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=5 height="10%">
				<h2>
					Payment Details
				</h2>
			</td>
		</tr>
		<tr height="5%"><th>S.NO.</th><th>Name</th><th>Age</th><th>Gender</th><th>Fare</th></tr>
		<%if(!passenger1.equals("")){ total_fare=total_fare+net_fare; al.add(passenger1+":"+request.getParameter("p1age")+":"+request.getParameter("p1gender"));%>
		<tr height="5%"><td>1</td><td><%=passenger1 %></td><td><%=request.getParameter("p1age")%></td><td><%=request.getParameter("p1gender")%></td><td><%=net_fare %></td></tr>
		<%}if(!passenger2.equals("")){ total_fare=total_fare+net_fare;al.add(passenger2+":"+request.getParameter("p2age")+":"+request.getParameter("p2gender"));%>
		<tr height="5%"><td>2</td><td><%=passenger2 %></td><td><%=request.getParameter("p2age")%></td><td><%=request.getParameter("p2gender")%></td><td><%=net_fare %></td></tr>
		<%}if(!passenger3.equals("")){ total_fare=total_fare+net_fare;al.add(passenger3+":"+request.getParameter("p3age")+":"+request.getParameter("p3gender"));%>
		<tr height="5%"><td>3</td><td><%=passenger3 %></td><td><%=request.getParameter("p3age")%></td><td><%=request.getParameter("p3gender")%></td><td><%=net_fare %></td></tr>
		<%}if(!passenger4.equals("")){total_fare=total_fare+net_fare; al.add(passenger4+":"+request.getParameter("p4age")+":"+request.getParameter("p4gender"));%>
		<tr height="5%"><td>4</td><td><%=passenger4 %></td><td><%=request.getParameter("p4age")%></td><td><%=request.getParameter("p4gender")%></td><td><%=net_fare %></td></tr>
		<%}if(!passenger5.equals("")){total_fare=total_fare+net_fare; al.add(passenger5+":"+request.getParameter("p5age")+":"+request.getParameter("p5gender"));%>
		<tr height="5%"><td>5</td><td><%=passenger5 %></td><td><%=request.getParameter("p5age")%></td><td><%=request.getParameter("p5agegender")%></td><td><%=net_fare %></td></tr>
		<%}if(!passenger6.equals("")){total_fare=total_fare+net_fare; al.add(passenger6+":"+request.getParameter("p6age")+":"+request.getParameter("p6gender"));%>
		<tr height="5%"><td>6</td><td><%=passenger6 %></td><td><%=request.getParameter("p6age")%></td><td><%=request.getParameter("p6gender")%></td><td><%=net_fare %></td></tr>
		<%} %>
		
		<tr height="5%"><td align="justify" colspan="2"></td><td align="justify" colspan="2"><b>Total Fare : </b></td><td><%=total_fare%></td></tr>
	</tbody>
	<table align="center" height="10%"><tr><td><input type="submit" name="submit" value="Proceed to Payment"></td></tr></table>
	</form>
</table>
<%session.setAttribute("total_fare",total_fare); 
	session.setAttribute("passengerList",al);
	session.setAttribute("mobile",mobileNo);
%>
</div>
</body>