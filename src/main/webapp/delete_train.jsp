<%@page import="java.sql.*" %>
<% int tcode=Integer.parseInt(request.getParameter("tcode"));
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	PreparedStatement ps=con.prepareStatement("delete  from train_info where train_code="+tcode);
	int i=ps.executeUpdate();
	response.sendRedirect("train_info.jsp");
%>
