<%@page import="java.sql.*" %>
<% int pnr_no=Integer.parseInt(request.getParameter("pnr_no"));
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
    
	//PreparedStatement ps=con.prepareStatement("delete  from ticket_booking_info where pnr_no="+pnr_no);
	PreparedStatement ps=con.prepareStatement("update pnr_status set status='Cancelled' where pnr_number="+pnr_no);
	int i=ps.executeUpdate();
	response.sendRedirect("booked_ticket_history.jsp");
%>
