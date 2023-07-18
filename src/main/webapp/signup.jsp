<html id="signup">
<link href="style.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="registration_validation.js">
</script>
<script type="text/javascript" src="mobile_validation.js">
</script>
<script type="text/javascript" src="signup_validation.js">
</script>
<script type="text/javascript" src="characters_validation.js">
</script>
<div>
<table width="80%"><tr><td align="left"><a href="index.jsp" align="right"><font color="yellow" size="5">Back!</font></a> </td><td align="right"><a href="index.jsp" align="right"><font color="yellow" size="5">Home!</font></a> </td></tr></table>
<table height="600" width="800" border="0" bgcolor="white" align="center">
<form name="form1" action="register.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2 style="font-size:300%"><font color="red">Sign Up Form</font>
				</h2>
			</td>
		</tr>

		<tr>
			<td valign="middle" align="left">&nbsp;<font color="red" size="5" face="Geneva, Arial">&nbsp; Name :</font><br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="name" maxlength="30" onchange="nameValidation()">
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%"> <font color="red" size="5" face="Geneva, Arial">&nbsp; Email&nbsp; :</font></td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="email"  onchange="emailValidation()"><span id="mail"></span><span id="mail2"></span>
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%"> <font color="red" size="5" face="Geneva, Arial">&nbsp; Password :</font></td><td align="left" valign="middle">&nbsp; 
				<input type="password" name="pass" id="pass1"/>
				
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%"><font color="red" size="5" face="Geneva, Arial">&nbsp; Confirm password :</font></td><td align="left" valign="middle">&nbsp; 
				<input type="password" id="pass2" name="cpass" onchange="checkPass()"/><span id="confirmMessage"></span>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%"><font color="red" size="5" face="Geneva, Arial">&nbsp; Gender :</font> <br></td><td align="left" valign="middle" height="8%">&nbsp; 
				
			<font color="red" size="5" face="Geneva, Arial">	
			Male 
			</font>
				<input type="radio" value="Male" name="gender" checked="checked"> 
				<font color="red" size="5" face="Geneva, Arial">
				Female
				</font>
				<input type="radio" value="Female" name="gender"></td>
		</tr>
		<tr>
			<td valign="middle" align="left"><font color="red" size="5" face="Geneva, Arial">&nbsp; Contact :</font></td><td align="left" valign="middle" height="8%">&nbsp; 
				<input type="text" name="contact" maxlength="10" onChange="mobileValidation()" onblur=""/>
			</td>
		</tr>
		<tr>
			<td colspan=2 height="7%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Sign Up!" style="font-size:100%" onClick="return complete()"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			</td>
		</tr>
	</tbody>
	</form>
</table>
</div>
</html>