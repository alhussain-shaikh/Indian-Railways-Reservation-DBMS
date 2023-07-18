<jsp:useBean id="t1" class="train.AddTrain"/>
<jsp:setProperty name="t1" property="*"/>
<center><font color="green"><b><%=t1.validate() %></b></font></center>

<center><a href="index.jsp"><font color="red"><b>Home</b></font></a></center>