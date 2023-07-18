<%@page import="java.sql.*"%>
<html>
<body>
<%
	String email=request.getParameter("email");
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
	
	PreparedStatement ps=con.prepareStatement("select email from user_info where email=?");
	ps.setString(1,email);
	ResultSet rs=ps.executeQuery();
	if(rs.next())
	{
		out.print("already registered :(");
	}
	else
		out.print("Hurrey! this one is available for you:)");
 %>
</body>
</html>