<%@page import="java.sql.*" %>
<script type="text/javascript" src="train_validation.js">
</script>
<link href="style.css" rel="stylesheet" type="text/css"/>
<body bgcolor="pink" id="addnew">
<table id="addnew" width="80%"><tr><td align="left"><a href="index.jsp"><font color="blue" size="5">Back!</font></a> </td><td align="right"><a href="index.jsp" align="right">Home!</a> </td></tr></table>

<table height="600" width="800"  bgcolor="" style="border-collapse: collapse;" border="1" align="center">
<form name="form1" action="added_train_fare.jsp" method="post" style="text-align:center">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2>
					Add Train Fare
				</h2>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Train Code &nbsp; :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="tcode">
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Coach :</td><td align="left" valign="middle">&nbsp; <select name="coach"><option>Select Class</option><option>Sleeper</option><option>FirstAC</option><option>SecondAC</option></select>
				
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Base Fare :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="base_fare" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Internet Charge : <br></td><td align="left" valign="middle" height="8%">&nbsp; <input type="text" name="internet_charge" /> 
				
			</td>
		</tr>
		<tr>
			<td colspan=2 height="7%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Submit!"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			</td>
		</tr>
	</tbody>
	</form>
</table>