<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="lightblue">
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
double wamt=Double.parseDouble(request.getParameter("wamt"));

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
  PreparedStatement ps=con.prepareStatement(" update BankHdfc SET balance=(balance-?) WHERE account_no=? AND name=? AND password=?");
  ps.setDouble(1,wamt);	    
  ps.setLong(2,account_no);
  ps.setString(3,name);
  ps.setString(4,password);
 
  
  int  i=ps.executeUpdate();
 PreparedStatement ps1=con.prepareStatement("select name,balance from BankHdfc where account_no=? ");
  ps1.setLong(1,account_no);
  ResultSet rs=ps1.executeQuery();
  ResultSetMetaData rss=rs.getMetaData();
  out.println("<br>");
  out.println(i+"Your Balace has decreased "+wamt);
  
  int n=rss.getColumnCount();
  out.println("<h2>Withdraw Details : </h2>");
  out.print("<table border='1'>"); 

  for(int j=1;j<=n;j++)     

   out.println("<td> <font color=blue size=3> "+"<br>" 
     +rss.getColumnName(j)); 

  out.println("<tr>"); 

  while(rs.next()) 
  { 
   for(int j=1;j<=n;j++) 

   out.println("<td><br> "+rs.getString(j)); 
   out.println("<tr>"); 
  }
  out.println("</table></body></html>");


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