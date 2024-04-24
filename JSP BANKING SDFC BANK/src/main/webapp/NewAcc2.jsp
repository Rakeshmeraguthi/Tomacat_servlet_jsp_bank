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

	long Acno=Long.parseLong(request.getParameter("acno"));
	String name=request.getParameter("name");
	String Password=request.getParameter("psw");
	String CPassword=request.getParameter("cpsw");
	float amount=Float.parseFloat(request.getParameter("amt"));
	String Address=request.getParameter("add");
    long mno=Long.parseLong(request.getParameter("no"));
     String Password1=null;
    
   
    
    try{
    	Class.forName("oracle.jdbc.driver.OracleDriver");
    	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
    	if(Password==CPassword){
            Password1=Password;
    	PreparedStatement ps=con.prepareStatement("insert into BankHdfc values(?,?,?,?,?,?)");
    	ps.setLong(1,Acno);
    	ps.setString(2,name);
    	ps.setString(3,Password1);
    
    	ps.setDouble(4,amount);
    	ps.setString(5,Address);
    	ps.setLong(6,mno);
    	
    	int i=ps.executeUpdate();
    	
    	out.print(i+"New Account opened");
    	 }
        else{
        	out.print("Invalid Password(paassword And confirm password is not same)");
        }
    	con.close();
}
catch(Exception ex){
	out.print(ex);
}
%>
</center>
</body>
</html>