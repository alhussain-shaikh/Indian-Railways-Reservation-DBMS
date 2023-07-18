 package admin;

import java.sql.*;


public class AdminInfo  
{
	private String email;
	private String pass;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	

public String validate() throws Exception
{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c=DriverManager.getConnection("jdbc:mysql://localhost:/rails?useSSL=false","root","040703");
		Statement st=c.createStatement();
		ResultSet rs=st.executeQuery("select * from USER_INFO where email='"+email+"' and password='"+pass+"'");
		  if(rs.next())
		     return "Welcome";
		   else
		    return "invalid email or password";
			  //+name+" "+email+" "+date+" "+month+" "+year+" "+pass+" " "+gender+" "+contact; 
		}
		
	
}

