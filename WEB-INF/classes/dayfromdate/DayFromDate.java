package dayfromdate;

import java.text.SimpleDateFormat;


public class DayFromDate  

{

public static String main(String journeyDate)

 {
    String Date=journeyDate;
    try{
        boolean dateValid=dateValidate(Date);
        if(dateValid==true)
        {
            SimpleDateFormat df = new SimpleDateFormat( "dd-MMM-yy" );  
            java.util.Date date = df.parse(Date);   
            df.applyPattern( "EEE" );  
            String day= df.format( date ); 
            if(day.compareTo("Sat")==0|| day.compareTo("Sun")==0)
            {
                System.out.println(day+": Weekend");
                return day;
            }
            else
            {
                System.out.println(day+": Weekday");
                return day;
            }
        }
        else
        {
            System.out.println("Invalid Date!!!");
            return "invalid date";
        }
    }
    catch(Exception e)
    {
        System.out.println("Invalid Date Formats!!!");
    }
    return "";
 }

static public boolean dateValidate(String d)

 {

    String dateArray[]= d.split("-");
    int day=Integer.parseInt(dateArray[0]);
    String month=dateArray[1];
    int year=Integer.parseInt(dateArray[2]);
    System.out.print(day+"\n"+month+"\n"+year+"\n");
    boolean leapYear=false;

    if((year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0))
    {
         leapYear=true;
    }

    if(year>2099 || year<1900)
        return false;

    if(month!=null)
    {
        if(month.equals("JAN")||month.equals("MAR")||month.equals("MAY")||month.equals("JUL")||month.equals("AUG")||month.equals("OCT")||month.equals("DEC"))
        {
            if(day>31)
                return false;
        }
        else if(month.equals("APR")||month.equals("JUN")||month.equals("SEP")||month.equals("NOV"))
        {
            if(day>30)
                return false;
        }
        else if(leapYear==true && month.equals("FEB"))
        {
            if(day>29)
              return false;
        }
        else if(leapYear==false && month.equals("FEB"))
        {
            if(day>28)
              return false;
        }
        return true;    
    }
    else return false;
 }
}