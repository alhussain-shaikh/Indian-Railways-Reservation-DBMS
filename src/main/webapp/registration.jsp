<script type="text/javascript" src="registration_validation.js">
</script>
<table height="600" width="800" border="1" bgcolor="" align="center">
<form name="form1" action="register.jsp" method="post">
	<tbody align="center">
		<tr align="center">
			<td  colspan=2 height="10%">
				<h2>
					Sign Up Form
				</h2>
			</td>
		</tr>

		<tr>
			<td valign="middle" align="left">&nbsp; Name :<br></td><td align="left" valign="middle" height="8%" rowspan="1"> 
				&nbsp; 
				<input type="text" name="name" maxlength="30">
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Email&nbsp; :</td><td align="left" valign="middle">&nbsp; 
				<input type="text" name="email" onkeyup="emailValidation()" onchange="emailValidation()"><span id="mail"></span><span id="mail2"></span>
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Password :</td><td align="left" valign="middle">&nbsp; 
				<input type="password" name="pass" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Confirm password :</td><td align="left" valign="middle">&nbsp; 
				<input type="password" name="cpass" />
			</td>
		</tr>
		<tr>
			<td valign="middle" align="left" height="8%">&nbsp; Gender : <br></td><td align="left" valign="middle" height="8%">&nbsp; 
				
			Male 
				<input type="radio" value="Male" name="gender" checked="checked"> 
				Female 
				<input type="radio" value="Female" name="gender"></td>
		</tr>
		<tr>
			<td valign="middle" align="left">&nbsp; Contact :</td><td align="left" valign="middle" height="8%">&nbsp; 
				<input type="text" name="contact" />
			</td>
		</tr>
		<tr>
			<td colspan=2 height="7%">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="submit" value="Sign Up!" onClick="return complete()"/> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
			</td>
		</tr>
	</tbody>
	</form>
</table>