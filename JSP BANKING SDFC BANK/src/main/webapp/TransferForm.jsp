<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="pink">
<center>
          <a href=Home.jsp>Home</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=newAcc.jsp>New Account</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=balance.jsp>Balance</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=deposit.jsp>Deposit</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=withdraw.jsp>Withdraw</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=transfor.jsp>Transfer</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=closeA/c.jsp>Close A/C</a>&nbsp;&nbsp;&nbsp;&nbsp;
		  <a href=aboutUs.jsp>AboutUs</a>&nbsp;&nbsp;&nbsp;&nbsp;<br>
  <h2>Transform Details: </h2>
<%
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("name");
String password=request.getParameter("psw");
long Taccount_no=Long.parseLong(request.getParameter("Tacno"));
double amt=Double.parseDouble(request.getParameter("amt"));

try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
  PreparedStatement ps=con.prepareStatement(" update BankHdfc set balance=balance-? where account_no=? and name=? and password=? ");
  ps.setDouble(1,amt);
  ps.setLong(2,account_no);
  ps.setString(3,name);
  ps.setString(4,password);
  
 
  
  PreparedStatement ps1=con.prepareStatement(" update BankHdfc set balance=balance+? where account_no=? ");
  
  ps1.setDouble(1,amt);
  ps1.setLong(2,Taccount_no);
  int  i=ps.executeUpdate();
  
  int i1=ps1.executeUpdate();
  
  PreparedStatement pss=con.prepareStatement(" select name,balance from BankHdfc where account_no in(?,?)");
  pss.setLong(2,account_no);
  pss.setLong(1,Taccount_no);
  ResultSet rs=pss.executeQuery();
  ResultSetMetaData rss=rs.getMetaData();

  out.println(i+"The account no="+account_no+" balace is decreased"+amt+"<br>");
  out.println(i1+"The Target account no="+Taccount_no+" balace is incresed "+amt+"<br>");
  out.print("<table border='1'>"); 

  int n=rss.getColumnCount();   
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