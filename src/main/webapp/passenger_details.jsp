<script type="text/javascript" src="registration_validation.js">
</script>
<script type="text/javascript" src="characters_validation_on_passenger_details.js">

<script type="text/javascript" src="age_validation.js">
</script>
<script type="text/javascript" src="mobile_validation_on_passenger_details.js">
</script>

<% 
	int tcode=Integer.parseInt(request.getParameter("tcode"));
	int net_fare=Integer.parseInt(request.getParameter("net_fare"));
	
	session.setAttribute("tcode",tcode);
	session.setAttribute("net_fare",net_fare);
%>
<link href="style.css" rel="stylesheet" type="text/css"/>
<body bgcolor="sky blue" >
<div>
<table width="80%"><tr><td align="right" id="passanger"><div><a href="index.jsp" align="right">Home!</a></div> </td></tr></table>
<table height="400" width="600" border="1"  align="center" style="border-collapse: collapse;">
<form name="form1" action="payment_details.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=4 height="10%" id="passanger">
				<h2>
					Passenger Details
				</h2>
			</td>
		</tr>
		<tr><th>S.NO.</th><th>Name</th><th>Age</th><th>Gender</th>
		<tr><td id="passenger1">1</td><td><input type="text" name="passenger1" maxlength="30" onchange="nameValidation('passenger1')"></td><td><input type="text" name="p1age"></td><td><select name="p1gender"><option>select</option><option>Male</option><option>Female</option></td>
		<tr><td id="passenger2">2</td><td><input type="text" name="passenger2" maxlength="30" onchange="nameValidation('passenger2')"></td><td><input type="text" name="p2age"></td><td><select name="p2gender"><option>select</option><option>Male</option><option>Female</option></td>
		<tr><td id="passenger3">3</td><td><input type="text" name="passenger3" maxlength="30" onchange="nameValidation('passenger3')"></td><td><input type="text" name="p3age"></td><td><select name="p3gender"><option>select</option><option>Male</option><option>Female</option></td>
		<tr><td id="passenger4">4</td><td><input type="text" name="passenger4" maxlength="30" onchange="nameValidation('passenger4')"></td><td><input type="text" name="p4age"></td><td><select name="p4gender"><option>select</option><option>Male</option><option>Female</option></td>
		<tr><td id="passenger5">5</td><td><input type="text" name="passenger5" maxlength="30" onchange="nameValidation('passenger5')"></td><td><input type="text" name="p5age"></td><td><select name="p5gender"><option>select</option><option>Male</option><option>Female</option></td>
		<tr><td id="passenger6">6</td><td><input type="text" name="passenger6" maxlength="30" onchange="nameValidation('passenger6')"></td><td><input type="text" name="p6age"></td><td><select name="p6gender"><option>select</option><option>Male</option><option>Female</option></td>
		</tr>
		<tr><td align="justify" colspan="2">Mobile Number:<input type="text" name="mobile"></td><td align="justify" colspan="2"><input type="submit" name="submit" value="submit"></td></tr>
	</tbody>
	<table align="center"></table>
	</form>
</table>
</div>
</body>