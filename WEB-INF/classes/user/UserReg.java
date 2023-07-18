package user;
import java.sql.*;

public class UserReg 
{
	private String name;
	private String email;
	private String date;
	private String month;
	private String year;
	private String pass;
	private String cpass;
	private String gender;
	private String contact;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getCpass() {
		return cpass;
	}
	public void setCpass(String cpass) {
		this.cpass = cpass;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getContact() {
		return contact;
	}
	public void setContact(String contact) {
		this.contact = contact;
	}
	public String getDOB()
	{
		return date+"-"+month+"-"+year;
	}
	public String checkPass()
	{
		if(pass.equals(cpass))
			return "success";
		else
			return "mismatch";
	}
	public String checkContact()
	{
		
		return "";
	}
	public String validate() throws Exception
	{
		if(checkPass().equals("success"))
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
			PreparedStatement ps=c.prepareStatement("insert into USER_INFO values(?,?,?,?,?)");
			ps.setString(1, name);
			ps.setString(2, email);
			//ps.setString(3, getDOB());
			ps.setString(3, pass);
			ps.setString(4, gender);
			ps.setString(5, contact);
			int i=ps.executeUpdate();
			if(i>0)
			{
				return "You Are Successully Registered! Login with email ID ";  //+name+" "+email+" "+date+" "+month+" "+year+" "+pass+" "+cpass+" "+gender+" "+contact; 
			}
			else
				return "Something went wrong";
		}
		else
				return "password field must be same as confirm password field";
	}
}