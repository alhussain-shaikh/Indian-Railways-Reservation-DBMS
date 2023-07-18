<%@ page errorPage = "err.jsp" language="java" import="java.sql.*" %>
<%
String name="", password="", paytype="", payno="", paydate="", payat="", loc="", cardhname="",cardno="", cardtype="", cmon="", cyr="", edate="";

//Retrieving the values of text fields in the String variables.
paytype=request.getParameter("optPaymentType");
cardhname=request.getParameter("card_name");
cardno=request.getParameter("card_number");
cardtype=request.getParameter("card_type");
cmon=request.getParameter("sl_month");
cyr=request.getParameter("sl_year");
int tcode=(Integer)session.getAttribute("tcode");
String source=(String)session.getAttribute("source");
String dest=(String)session.getAttribute("dest");
String date=(String)session.getAttribute("date");
int tf=(Integer)session.getAttribute("total_fare");
String total_fare=""+tf;
String email=(String)session.getAttribute("email");
System.out.println(email);
String mobileNo=(String)session.getAttribute("mobile");
java.util.ArrayList pl=(java.util.ArrayList)session.getAttribute("passengerList");
String class_type=(String)session.getAttribute("class_type");
//out.println(name+password);
//Establishing connection with the database.
Connection conn=null;
PreparedStatement stmt;
ResultSet rs=null;
int y=0;
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
//Retrieving the value of the selected payment mode and inserting it into the CBalance table of the savv database.
if(paytype.equals("card"))
{
long l=(long)(Math.random()*10000000000l);
String transact_id=""+l;

long l1=(long)(Math.random()*100000);
String pnr_no=""+l1;
session.setAttribute("pnr_no",pnr_no);

stmt=conn.prepareStatement("insert into payment (user_mail_id,Mode_OF_PAYM,Card_type,Card_no, Card_holder_name, transaction_id, paid_amount) values (?,?,?,?,?,?,?)");
stmt.setString(1,email);
stmt.setString(2,paytype);
stmt.setString(3,cardtype);
stmt.setString(4,cardno);
stmt.setString(5,cardhname);
stmt.setString(6,transact_id);
stmt.setString(7,total_fare);
y=stmt.executeUpdate();
PreparedStatement ps1=conn.prepareStatement("insert into train_booking_info values(?,?,?,?,?,?,?,?,?)");
ps1.setString(1,pnr_no);
ps1.setInt(2,tcode);
ps1.setString(3,source);
ps1.setString(4,dest);
ps1.setString(5,date);
ps1.setString(6,transact_id);
ps1.setString(7,total_fare);
ps1.setString(8,email);
ps1.setString(9,mobileNo);
int i=ps1.executeUpdate();
if(i>0)
{	
	int i1=0;
	PreparedStatement ps2=conn.prepareStatement("insert into passenger_details values (?,?,?,?)");
	for(int j=0; j<pl.size(); j++)
	{
		String passengers=(String)pl.get(j);
		String pd[]=passengers.split(":");
		ps2.setString(1,pnr_no);
		ps2.setString(2,pd[0]);
		ps2.setString(3,pd[1]);
		ps2.setString(4,pd[2]);
		i1=ps2.executeUpdate();	
	}
	if(i1>0)
	{
		int available_seats=0;
		PreparedStatement ps3=conn.prepareStatement("select available_seats from train_fare where train_code=? and class=?");
		ps3.setInt(1,tcode);
		ps3.setString(2,class_type);
		System.out.println(class_type);
		ResultSet rs3=ps3.executeQuery();
		if(rs3.next())
		{
			 available_seats=rs3.getInt(1)-pl.size();
		}
		PreparedStatement ps4=conn.prepareStatement("update train_fare set available_seats=? where train_code=? and class=?");
		ps4.setInt(1,available_seats);
		ps4.setInt(2,tcode);
		ps4.setString(3,class_type);
		int i2=ps4.executeUpdate();
		if(i2>0)
		{
			PreparedStatement ps5=conn.prepareStatement("insert into pnr_status values(?,?)");
			ps5.setString(1,pnr_no);
			if(available_seats<=0)
			{
				ps5.setString(2,"WL/"+(available_seats+((available_seats*-2)+1)));
				session.setAttribute("status","WL/"+(available_seats+((available_seats*-2)+1)));	
			}	
			else if(available_seats>0)
			{
				ps5.setString(2,"Confirm");
				session.setAttribute("status","Confirm");
			}
			int i3=ps5.executeUpdate();
		}
	}
}	
}// card if close here
%><center><font color="green" size=5><b>Thank You! Your Payment was Successful</b></font></center>
<%
}catch(SQLException ee)
{
%><center><font color="green" size=5><b>Payment was not Successful</b></font></center>
<%
out.println(ee);}

if(y>0)
{
%>
 <jsp:include page="ticket_generated.jsp" />
<%
}
%>