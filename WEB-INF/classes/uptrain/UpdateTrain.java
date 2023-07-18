
package uptrain;
import java.sql.*;



public class UpdateTrain 
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
	private int firstac_class;
	private int secondac_class;
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

	public int getSleeper_class() {
		return sleeper_class;
	}

	public void setSleeper_class(int sleeperClass) {
		sleeper_class = sleeperClass;
	}

	public int getFirstac_class() {
		return firstac_class;
	}

	public void setFirstac_class(int firstacClass) {
		firstac_class = firstacClass;
	}

	public int getSecondac_class() {
		return secondac_class;
	}

	public void setSecondac_class(int secondacClass) {
		secondac_class = secondacClass;
	}

	public void setVia(String via) {
		this.via = via;
	}
	public String[] getDays()
	{
		String days[]={sunday,monday,tuesday,wednesday,thursday,friday,saturday};
		return days;
	}
	public String[] getVias()
	{
		String v[]=via.split(",");
		return v;
	}
	public String validate() throws Exception
	{
		Class.forName("com.mysql.cj.jdbc.Driver");
			
			Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/rails","root","040703");
			PreparedStatement ps=c.prepareStatement("update TRAIN_INFO SET TRAIN_NAME=?,SOURCE=?,DESTINATION =?,DISTANCE=?,TRAVEL_TIME=?,DEPARTURE_TIME=?,ARRIVAL_TIME=? where Train_CODE=?");
			ps.setString(1, tname);
			ps.setString(2, source); 
			ps.setString(3, dest);
			ps.setInt(4, distance);
			ps.setString(5, travel_time);
			ps.setString(6, departure_time);
			ps.setString(7, arrival_time);
			ps.setInt(8, tcode);
			System.out.println(tcode);
			
			int i=ps.executeUpdate();
			if(i>0)
			{
				ps=c.prepareStatement("delete from TRAIN_DAYS where train_code=?");
				ps.setInt(1, tcode);
				ps.executeUpdate();
				ps=c.prepareStatement("insert into TRAIN_DAYS values(?,?)");
				String days[]=getDays();
				
				for(String day:days)	
				{
					if(day==null){}
					else
					{
						ps.setInt(1,tcode);
						ps.setString(2, day);
						ps.executeUpdate();
					}
				}
				ps=c.prepareStatement("delete from TRAIN_VIA where train_code=?");
				ps.setInt(1, tcode);
				ps.executeUpdate();
				ps=c.prepareStatement("insert into TRAIN_VIA values(?,?)");
				String v[]=getVias();
				for(String v1:v)
				{
					   ps.setInt(1, tcode);
						ps.setString(2,v1);
						
						ps.executeUpdate();
				}
				
				ps=c.prepareStatement("update TRAIN_coach SET SLEEPER_CLASS=?,FIRSTAC_CLASS=?,SECONDAC_CLASS=? where train_code=?");

						ps.setInt(1,sleeper_class);
						ps.setInt(2, firstac_class);
						ps.setInt(3, secondac_class);
						ps.setInt(4, tcode);
						int i2=ps.executeUpdate();
						if(i2==0)
						{
							ps=c.prepareStatement("insert into TRAIN_coach values(?,?,?,?)");
							ps.setInt(1, tcode);
							ps.setInt(2,sleeper_class);
							ps.setInt(3, firstac_class);
							ps.setInt(4, secondac_class);
							ps.executeUpdate();
						}
							
						
					return "Train updated successfully";
			}
			return "unsuccess";
	}
}