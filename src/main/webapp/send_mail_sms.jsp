	<%@page import="com.sun.mail.pop3.POP3Store,javax.mail.*,java.util.*,javax.mail.internet.*,java.io.*,javax.activation.*"%>
	<%@page import="java.net.URL"%>
	<%@page errorPage="err.jsp"%>
	<%!
		public String removeSpace(String p)
		{
			p=p.trim();
			int index=p.indexOf(" ");
			String pws="";
			if(index>0)
			{
				String pd1[]=p.split(" ");
				for(String s:pd1)
					pws=pws+s+"%20";
				pws=pws.trim();
				return pws;
			}
			return p;
		}
	 %>
	<%
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
	String pnr_no=(String)session.getAttribute("pnr_no");
	String status=(String)session.getAttribute("status");
	
	String total_passenger="";
	String total_passenger1="";
	for(int j=0; j<pl.size(); j++)
		{
			String passengers=(String)pl.get(j);
			String pd[]=passengers.split(":");
			String pws=removeSpace(pd[0]);  //pws - passenger without space
			total_passenger=total_passenger+pws+",";
			total_passenger1=total_passenger1+pd[0]+",";
			//total_passenger=total_passenger.substring(0,total_passenger.length()-1);
		}
	String content="PNR_NO : "+pnr_no+", "+" Passengers : "+total_passenger1+" "+" Total Fare : "+total_fare+", Status : "+status+", date : "+date;
	String content1="PNR_NO:"+pnr_no+",Passengers:"+total_passenger+"Total%20Fare:"+total_fare+",Status:"+status+",date:"+date;
	%>
	<%
			Properties p=new Properties();
			p.put("mail.smtp.host","smtp.gmail.com");
			p.put("mail.transport.protocol","smtp");
			p.put("mail.smtps.auth","true");
			
			
			Session msession=Session.getInstance(p);
	 
			MimeMessage msg=new MimeMessage(msession);
			
			InternetAddress from=new InternetAddress("alhussainshaikh345@gmail.com");
			InternetAddress to=new InternetAddress(email);
			msg.setFrom(from);
			msg.setRecipient(Message.RecipientType.TO,to);
			msg.setSubject("E-Ticket");
			msg.setSentDate(new Date());
	
			Multipart body=new MimeMultipart();
			MimeBodyPart part1=new MimeBodyPart();
			part1.setText(content);
			body.addBodyPart(part1);
	
			msg.setContent(body);
			
			Transport t=msession.getTransport("smtps");
			t.connect("smtp.gmail.com","alhussainshaikh345@gmail.com","Alhussain@04");
			t.sendMessage(msg,msg.getAllRecipients());
			out.println("<center><font color='black'>A mail has been sent to your Email Id</font></center><br><br>");
	%>
	<%
	        	URL oracle = new URL("http://api.mvaayoo.com/mvaayooapi/MessageCompose?user=koolmohit.zooming@gmail.com:torrent&senderID=TEST%20SMS&receipientno="+mobileNo+"&dcs=0&msgtxt=bhartiyatrain.com%20"+content1+"&state=4");
			//URL oracle = new URL("http://api.mvaayoo.com/mvaayooapi/APIUtil?user=anasoftcool@gmail.com:9935221405&type=0");
		        BufferedReader in = new BufferedReader(new InputStreamReader(oracle.openStream()));
	System.out.println("OOOOOOOOOOOOOOOOOOOOOO");
		        String inputLine;
	        	while ((inputLine = in.readLine()) != null)
		            System.out.println(inputLine);
	        	in.close();
			out.println("<center><font color='brown'>And an SMS has been delivered to your mobile</font></center><br>");
						out.println("<center><font color='brown'>Please Check Your Mobile.</font></center><br><br><br>");
	%>
	<jsp:include page="ticket_generated.jsp"/>