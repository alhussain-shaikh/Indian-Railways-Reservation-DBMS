package user;

import java.sql.*;

public class UserLogin 
{
	private String email;
	private String pass;
	private String type;

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
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
public String validate() throws Exception
{      
	    if(type.equalsIgnoreCase("User"))
	    {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
		Statement st=c.createStatement();
		ResultSet rs=st.executeQuery("select * from USER_INFO where email='"+email+"' and password='"+pass+"'");
		  if(rs.next())
		  {  
			  
			  String un=rs.getString(1);
		     return type+" "+email+" "+un;
		  }
		   else	
		    return "invalid";
	    }
	    else
	    {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
				Statement st=c.createStatement();
				ResultSet rs=st.executeQuery("select * from ADMIN_INFO where admin_id='"+email+"' and password='"+pass+"'");
				  if(rs.next())
				  {  
					  String an=rs.getString(1);
					  String aid=rs.getString(2);
					  return type+" "+aid+" "+an;
				   }
				   else	
				    return "invalid";
			}
		}

}
		



