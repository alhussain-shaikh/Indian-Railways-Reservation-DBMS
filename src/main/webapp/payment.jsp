<%@ page errorPage = "ErrorPage.jsp" language="java" import="java.sql.*,java.util.*,java.text.*" %>

<html>
<HEAD>
<!--Applying styles for the page. -->
<SCRIPT language=Javascript>
<!--Verifying the fields that are left blank in the page.-->
function validation()
{
if(!((document.form1.optPaymentType[0].checked)||(document.form1.optPaymentType[1].checked)||(document.form1.optPaymentType[2].checked)||(document.form1.optPaymentType[3].checked)||(document.form1.optPaymentType[4].checked)))
{
alert("Please Select the type of Payment you would like to go for.")
return false;
} 
if(document.form1.optPaymentType[4].checked)
{
if((document.form1.optPaymentType[0].checked)||(document.form1.optPaymentType[1].checked)||(document.form1.optPaymentType[2].checked))
	{
	if((document.form1.txtPaymentno.value=="")||(document.form1.txtDrawnon.value=="")||(document.form1.txtDated.value=="")||(document.form1.Payableat.options[0].selected))
	{
alert('Please fill payment details that is, Check for No/DrawnOn/Dated ')
	return false
	}
     }
if(document.form1.optPaymentType[0].checked)
{
if(document.form1.Payableat.value!="Delhi")
{
document.form1.Payableat.focus()
alert('Demand Drafts to be payable at DELHI only. Please select that option.')
return false
}
     }
if(document.form1.optPaymentType[3].checked)
{
document.form1.Payableat.disabled=false
document.form1.Payableat.options[0].selected
document.form1.Payableat.disabled=true

if(document.form1.Location.options[0].selected)
{
alert('Please select the name of the city where you would like pay the registration feein cash')
document.form1.Location.focus()
return false
}
  }
if(document.form1.optPaymentType.value=="")
{
alert('Please select your payment method')
document.form1.optPaymentType.focus()
return false
}
else
{
return true
}
}
}
<!--Verifying the pincode field in the customer registration form for alphabets.-->
function checkno(t)
{
var s = t.value
if(isNaN(s))
{
alert('The pin code cannot have alphabets. Please type the numbers only.')
t.focus()
t.select()
}
return false
}
<!--Verifying the phone number field in the customer registration form for alphabets.-->
function checkphoneno(t)
{
var s = t.value
for(i=0;i<s.length;i++)
{
if((s.charCodeAt[i]>=65 && s.charCodeAt(i)<=91) || (s.charCodeAt(i)>=96 && s.charCodeAt(i)<=123))
{
alert('The phone number cannot have alphabets.')
t.focus()
t.select()
break
}
}
return false
}
<!--Verifying the payment mode field in the Payment Method form. -->
function checkpayment(t)
{
if(document.form1.optPaymentType[4].checked)
{
 document.form1.txtPaymentno.value=""
 document.form1.txtPaymentno.disabled=true
 document.form1.txtDated.value=""
 document.form1.txtDated.disabled=false
 document.form1.gtl.disabled=false
 document.form1.gtl.value="Investmentz.com"  
 document.form1.gtl.disabled=true
 document.form1.txtDrawnon.value=""
 document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is draft. -->
if(t.value=="draft")
{
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.focus()
document.form1.txtDated.disabled=false
document.form1.gtl.disabled=false
document.form1.gtl.value="Investmentz.com"
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.Payableat.disabled=false
document.form1.Payableat.value="Delhi"
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is cheque or payorder. -->
if ((t.value=="cheque")||(t.value=="payorder"))
{
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.focus()
document.form1.txtDated.disabled=false
document.form1.gtl.disabled=false
document.form1.gtl.value="Investmentz.com" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=false
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is cash. -->
if (t.value=="cash")
{
document.form1.Location.disabled=false
document.form1.Location.value="Loc" 
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.value="" 
document.form1.txtPaymentno.disabled=true
document.form1.txtDated.disabled=false
document.form1.txtDated.value="" 
document.form1.txtDated.disabled=true
document.form1.gtl.disabled=false
document.form1.gtl.value="" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.txtDrawnon.value="" 
document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
}
<!--Enabling the focus on certain fields, if the payment mode is credit card. -->
if (t.value=="card")
{
document.form1.Location.value="Loc"
document.form1.Location.disabled=true
document.form1.txtPaymentno.disabled=false
document.form1.txtPaymentno.value="" 
document.form1.txtPaymentno.disabled=true
document.form1.txtDated.disabled=false
document.form1.txtDated.value="" 
document.form1.txtDated.disabled=true
document.form1.gtl.disabled=false
document.form1.gtl.value="" 
document.form1.gtl.disabled=true
document.form1.txtDrawnon.disabled=false
document.form1.txtDrawnon.value="" 
document.form1.txtDrawnon.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=false
document.form1.card_number.value=""
document.form1.card_number.disabled=false
document.form1.card_type[0].disabled=false
document.form1.card_type[1].disabled=false
document.form1.card_type[2].disabled=false
document.form1.card_type[3].disabled=false
document.form1.sl_month.disabled=false
document.form1.sl_year.disabled=false
document.form1.Payableat.disabled=false
document.form1.Payableat.value="sel"
document.form1.Payableat.disabled=true
}
}
<!--Verfying for the leap year. -->
function isLeapYear(Year) 
{
if(((Year%4)==0 ) && (((Year%100)!=0) || ((Year%400)==0)))
{
return (true);
}
else
{
return(false)
}
}
<!--Verifying the date format entered for the date at which the cheque will be given clearance. -->
function checkDate(objName,myValue)
{
var mNames = "JanFebMarAprMayJunJulAugSepOctNovDec"
var mValues = "312831303130313130313031"
var alertMsg = ""
var forFocus = "document.form1."+objName+".focus()"
var wrongdate = true
var args = checkDate.arguments
var dt=new Date()
var tm=dt.getTime()
objName = args[0]
myValue = args[1]
if(myValue.length<10)
{
alert("Please type the date in the format, dd/mm/yyyy!")
eval(forFocus);
return false
}
if( (myValue.substring(2,3) != "/")||(myValue.substring(5,6) != "/") ) 
{
alert("Please type the date in format dd/mm/yyyy!")
eval(forFocus);
return false
}
myDD = parseInt(myValue.substring(0,2),10)
myMM = parseInt(myValue.substring(3,5),10)
myYYYY = parseInt(myValue.substring(6,10),10)
if(myYYYY<2001) 
{
alert("Year should be greater than 2001")
eval(forFocus)
return false
}
if( (isNaN(myDD)) || (isNaN(myMM)) || (isNaN(myYYYY)) ) 
{
alert("Invalid date entered!")
eval(forFocus)
return false
}
if( (myMM > 12) || (myMM <= 0) )
{
alert("Invalid month entered!")
eval(forFocus)
return false
}
var lastDate = 0
if(myMM==2) 
{ 
if(isLeapYear(myYYYY)) {    
lastDate = 29
}
else 
{ 
lastDate = 28 
}
}
else 
{
lastDate = mValues.substring((myMM-1)*2, (myMM-1)*2+2)
}
if( myDD > lastDate || (myDD <=0) )
{
alert("Invalid Date entered!")
eval(forFocus)
return false
}
var newValue = ""
if(myDD < 10) {myDD = "0"+myDD }
if(myMM<10) {myMM = "0"+myMM }
newValue = myDD+"/"+myMM+"/"+myYYYY
var forValue = "document.form1."+objName+".value = newValue"
eval(forValue)
return true
}
</SCRIPT>
</head>
<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table align=center border=0 cellpadding=0 cellspacing=0 width="98%">
<tbody> 
<tr bgcolor=#FFFFFF align="left"> 
<td height=30 valign=top colspan="2"> 
</td>
</tr>
</tbody> 
</table>
<table align=center border=0 cellpadding=0 cellspacing=0 width="98%" dwcopytype="CopyTableRow">
<tbody> 
<tr> 
<td colspan=2 valign=top> 
      <hr color=#c0003b size=1>
</td>
</tr>
<!-- Top hyperlink row ends. --> </tbody> 
</table>
 <br>
<!--Designing the layout for the Payment Method form. -->
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">Dear Customer <b></b></font></div>
    	</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">

</font></div>
</td>
</tr>
<tr align=middle bgcolor="#FFFFFF"> 
<td colspan=2 height=2>
<div align="left"><font face="Arial, Helvetica, sans-serif" size="2">In         order to generate the ticket(s), you need to pay an amount of Rs <b><font color=red><%=session.getAttribute("total_fare")%></font></b>/. Please Pay it below...</font></div>
</td>
</tr>
</tbody> 
</table>
<br>
<form name="form1" action="paym.jsp" method="post" >
<table align=center border=0 width=700>
<tbody> 
<tr align=middle bgcolor="#c0003b"> 
<td colspan=2 height=2><font face="Arial, Helvetica, sans-serif" size="2"><b><font color="#FFFFFF">Payment Method</font></b> </font>
</td>
</tr>
<tr align=middle valign=top> 
<td colspan=2><font face="Arial, Helvetica, sans-serif" size="2"> 
<!--Designing the radio buttons for the payment mode in the Payment Method form. -->
<input checked="checked" name=optPaymentType onClick="return checkpayment(this)"  type=radio value=card>Credit/Debit Card</font></td>
<tr> 

<tr> 
<td align=right height=2 valign=center><font face="Arial, Helvetica, sans-serif" size="2">To :</font></td>
<td height=2> <font face="Arial, Helvetica, sans-serif" size="2"> 
      <input maxlength=43 name=gtl size=42 
      value="railwayreservation.com ">
      <script language=JavaScript>
document.form1.gtl.disabled=true
</script>
      </font></td>

<tr> 
<td align=right height=2 valign=bottom><font face="Arial, Helvetica, sans-serif"                    size=2> Cardholders Name </font></td>
<td height=2 valign=bottom> 
<input type="text"    name="card_name" size=18><font face=verdana size=1> As it appears on the card</font></td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                                 size=2>Card Number&nbsp;</font></td>
<td height=2 valign=bottom> 
<input  type="text" maxlength=16 name="card_number" size=18>
</td>
</tr>
<tr> 
<td align=right height=2 valign=bottom> <font face="Arial, Helvetica, sans-serif"                               size=2>Card Type</font></td>
<td height=2 valign=bottom> 
<input CHECKED name="card_type" type=radio value=VISA>
<font face="Arial, Verdana" size=2>Visa </font> 
<input name=card_type type=radio value=MC>
      <font face="Arial, Verdana" size=2>Master 
</font></td>
</tr>
<tr> 
<td align=right height=2 valign=top><font                                face="Arial, Helvetica, sans-serif"                 size=2>Expiry Date </font></td>
<td height=2 valign=bottom><font face= "Arial, Helvetica, sans-serif" size="2"> 
      <select name="sl_month">
      <option selected value=1>1</option>
<option value=2>2</option>
      <option value=3>3</option>
      <option value=4>4</option>
<option value=5>5</option>
      <option value=6>6</option>
<option value=7>7</option>
<option value=8>8</option>
<option value=9>9</option>
<option value=10>10</option>
<option value=11>11</option>
<option value=12>12</option>
</select>
      <select name="sl_year">
<option selected      value=2021>2021</option>
<!-- Providing the values for the field, sl_year. -->
      <option value=2022>2022</option>
<option value=2023>2023</option>

<option value=2025>2025</option>
      <option value=2026>2026</option>
</select>
      <br>
<font size="1">&nbsp; MM &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;YY</font> </font></td>
<script language=JavaScript>
<!-- Providing the default values for the Payment Method form. -->
document.form1.Payableat.value="Delhi"
document.form1.Location.disabled=true
document.form1.card_name.value=""
document.form1.card_name.disabled=true
document.form1.card_number.value=""
document.form1.card_number.disabled=true
document.form1.card_type[0].disabled=true
document.form1.card_type[1].disabled=true
document.form1.card_type[2].disabled=true
document.form1.card_type[3].disabled=true
document.form1.sl_month.disabled=true
document.form1.sl_year.disabled=true
</script>
</tr>
<tr> 
<td align=right height=2 valign=bottom colspan="2"><div align="center"><font color=#000099 face=Verdana,Arial size=-1> 
<input type="hidden" name="loginname" value="">
<input type="hidden" name="password" value="">
<input name=cmdSubmit onClick="return validation()" type=submit value="Pay" class=bu>
<input type=reset value=Reset name="reset" class=bu></font></div>
</td>
</tr>
</tbody> 
</table>
<hr color=#c0003b size=1>
</form>
<table border=0 cellpadding=0 cellspacing=0 width="100%">
<tbody>  
</font></p>
</td>
</tr>
</tbody> 
</table>
</body>
</html>
