package train;
import java.sql.*;


public class AddTrain 
{
	private String tname;
	private int tcode;
	private String source;
	private String dest;
	private String sunday;
	private String monday;
	private String tuesday;
	private String wednesday;
	private String thursday;
	private String friday;
	private String saturday;
	private String via;
	private int distance;
	private String travel_time;
	private String departure_time;
	private String arrival_time;
	private int sleeper_class;
	private int firstAC_class;
	private int secondAC_class;
	public String getTname() {
		return tname;
	}

	public void setTname(String tname) {
		this.tname = tname;
	}

	public int getTcode() {
		return tcode;
	}

	public void setTcode(int tcode) {
		this.tcode = tcode;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source.toLowerCase();
	}

	public String getDest() {
		return dest;
	}

	public void setDest(String dest) {
		this.dest = dest.toLowerCase();
	}

	public String getSunday() {
		return sunday;
	}

	public void setSunday(String sunday) {
		this.sunday = sunday;
	}

	public String getMonday() {
		return monday;
	}

	public void setMonday(String monday) {
		this.monday = monday;
	}

	public String getTuesday() {
		return tuesday;
	}

	public void setTuesday(String tuesday) {
		this.tuesday = tuesday;
	}

	public String getWednesday() {
		return wednesday;
	}

	public void setWednesday(String wednesday) {
		this.wednesday = wednesday;
	}

	public String getThursday() {
		return thursday;
	}

	public void setThursday(String thursday) {
		this.thursday = thursday;
	}

	public String getFriday() {
		return friday;
	}

	public void setFriday(String friday) {
		this.friday = friday;
	}

	public String getSaturday() {
		return saturday;
	}

	public void setSaturday(String saturday) {
		this.saturday = saturday;
	}

	public String getVia() {
		return via;
	}

	public int getDistance() {
		return distance;
	}

	public void setDistance(int distance) {
		this.distance = distance;
	}

	public String getTravel_time() {
		return travel_time;
	}

	public void setTravel_time(String travelTime) {
		travel_time = travelTime;
	}

	public String getDeparture_time() {
		return departure_time;
	}

	public void setDeparture_time(String departureTime) {
		departure_time = departureTime;
	}

	public String getArrival_time() {
		return arrival_time;
	}

	public void setArrival_time(String arrivalTime) {
		arrival_time = arrivalTime;
	}

	public void setVia(String via) {
		this.via = via;
	}
	public int getSleeper_class() {
		return sleeper_class;
	}

	public void setSleeper_class(int sleeperClass) {
		sleeper_class = sleeperClass;
	}

	public int getFirstAC_class() {
		return firstAC_class;
	}

	public void setFirstAC_class(int firstACClass) {
		firstAC_class = firstACClass;
	}

	public int getSecondAC_class() {
		return secondAC_class;
	}

	public void setSecondAC_class(int secondACClass) {
		secondAC_class = secondACClass;
	}

	public String[] getDays()
	{
		String days[]={sunday,monday,tuesday,wednesday,thursday,friday,saturday};
		return days;
	}
	public String[] getVias()
	{
		String v[]={""};
		if(via!=null)
			{ v=via.split(",");}
		return v;
	}
	public String validate() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
			PreparedStatement ps=c.prepareStatement("insert into Train_INFO values(?,?,?,?,?,?,?,?)");
			ps.setInt(1, tcode);
			ps.setString(2, tname);
			ps.setString(3, source); 
			ps.setString(4, dest);
			ps.setInt(5, distance);
			ps.setString(6, travel_time);
			ps.setString(7, departure_time);
			ps.setString(8, arrival_time);
			int i=ps.executeUpdate();
			if(i>0)
			{
				ps=c.prepareStatement("insert into Train_Days values(?,?)");
				String days[]=getDays();
				
				for(String day:days)	
				{
					if(day==null){}
					else
					{
						ps.setInt(1,tcode);
						ps.setString(2,day);
						ps.executeUpdate();
					}
				}
				
				ps=c.prepareStatement("insert into Train_Via values(?,?)");
				String v[]=getVias();
				for(String v1:v)
				{
						ps.setInt(1,tcode);
						ps.setString(2,v1);
						ps.executeUpdate();
				}
				
				ps=c.prepareStatement("insert into Train_coach values(?,?,?,?)");
						ps.setInt(1,tcode);
						ps.setInt(2,sleeper_class);
						ps.setInt(3,firstAC_class);
						ps.setInt(4,secondAC_class);
						ps.executeUpdate();
						
					return "Train Added successfully";
			}
			return "unsuccess";
	}
}