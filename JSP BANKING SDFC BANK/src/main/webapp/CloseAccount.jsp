<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="skyblue">

<center>
       <h1 >HDFC BANK</h1>

<h2>Extraordinary Services</h2>
<u1><li><a href="Home.jsp">Home</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="newAcc.jsp">New Account</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
  <li><a href="balance.jsp">Balance</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="deposit.jsp">Deposit</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="withdraw.jsp">Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="transfor.jsp">Transfer</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="closeAc.jsp">Close A/C</a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
<li><a href="aboutUs.jsp">AboutUs</a>&nbsp;&nbsp;&nbsp;&nbsp;</li></u1><br><br>
<link rel="stylesheet" href="styles.css">

<% 
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("name");
String password=request.getParameter("psw");
try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
  PreparedStatement ps=con.prepareStatement(" delete from BankHdfc where account_no=? and name=? and password=?");  
  ps.setLong(1,account_no);
  ps.setString(2,name);
  ps.setString(3,password);
  int i=ps.executeUpdate();

  
  
  
out.print(i+", Welcome "+name+" your account no  "+account_no+"  has Closed....");

out.println("<h3>All the best<h3>");
con.close();
}

catch(Exception ex)
{
  out.print(ex);
}
%>
</center>

</body>
</html>