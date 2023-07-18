<script type="text/javascript" src="train_validation.js">
</script>
<link href="style.css" rel="stylesheet" type="text/css"/>
<body bgcolor="pink" id="addnew">
<table id="addnew" width="80%"><tr><td align="left"><a href="index.jsp"><font color="blue" size="5">Back!</font></a> </td><td align="right"><a href="index.jsp" align="right"><font color="blue" size="5">Home!</font></a></td></tr></table>
<table height="600" width="800" border="1" style="border-collapse: collapse;" bgcolor="" align="center">
<form name="form1" action="add_train.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2>
					Add New Train
				</h2>
			</td>
		</tr>

		<tr>
			<td valign="middle" align="left">&nbsp; Train Name :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="tname" maxlength="30">
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Train Code &nbsp; :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="tcode">
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp;Source :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="source" />
				
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Destination :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="dest" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Running Days : <br></td><td align="left" valign="middle" height="8%">&nbsp; 
				
			Sunday
				<input type="checkbox" value="Sun" name="sunday"> 
			Monday 
				<input type="checkbox" value="Mon" name="monday">
			Tuesday 
				<input type="checkbox" value="Tue" name="tuesday">
			Wednesday 
				<input type="checkbox" value="Wed" name="wednesday">
			Thursday 
				<input type="checkbox" value="Thu" name="thursday">
			Friday 
				<input type="checkbox" value="Fri" name="friday">
			Saturday
				<input type="checkbox" value="Sat" name="saturday"></td>
				</td>
		</tr>
		<tr>
			<td valign="middle" align="left">&nbsp; Via :</td><td align="left" valign="middle" height="8%">&nbsp; 
				<input type="text" name="via" />
			</td>
		</tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;Distance:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="distance"/><label> km</label></td></tr>
		
<tr><td valign="middle" align="left" height="8%">&nbsp;Travel Time::</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="travel_time"/><label>hr.</label></td></tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;Departure Time:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="departure_time"/></td></tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;Arrival Time:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="arrival_time"/></td></tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;Sleeper Seats:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="sleeper_class"/></td></tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;First AC Seats:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="firstAC_class"/></td></tr>
		<tr><td valign="middle" align="left" height="8%">&nbsp;second AC Seats:</td><td valign="middle" align="left" height="8%">&nbsp; <input type="text" name="secondAC_class"/></td></tr>
		
		<tr>
			<td colspan=2 height="7%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Add Train!"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			</td>
		</tr>
	</tbody>
	</form>
</table>