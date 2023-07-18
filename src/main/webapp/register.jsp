<jsp:useBean id="t1" class="user.UserReg"/>
<jsp:setProperty name="t1" property="*"/>


<div style="text-align:center;margin-top:25%">
<font color="red">
<script type="text/javascript">
function Redirect()
{
    window.location="index.jsp";
}
document.write("<h2><%=t1.validate() %></h2><br><Br>");
document.write("<h3>Redirecting you to home page....</h3>");
setTimeout('Redirect()', 3000);
</script>
</font>
</div>