package dbcon;
import java.sql.Connection;
import java.sql.DriverManager;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
public class DBConnection implements ServletContextListener{
	public void contextInitialized(ServletContextEvent e)
	{
		try
		{	
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
			ServletContext context=e.getServletContext();
			context.setAttribute("con",c);
			
		}
		catch(Exception ee)
		{
			ee.printStackTrace();
			ee.getMessage();
		}
	}
	public void contextDestroyed(ServletContextEvent e)
	{}

}
