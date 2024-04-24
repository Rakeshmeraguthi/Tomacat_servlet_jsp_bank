<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
<li><a href="aboutUs.jsp">AboutUs</a>&nbsp;&nbsp;&nbsp;&nbsp;</li></u1>
<link rel="stylesheet" href="styles.css">
<form action="TransferForm.jsp" method="post">
<table>
<h2>Transfer Form</h2>
<tr>
<td>Account Number :</td>
<td><input type="text" name="acno"></td>
</tr>
<tr>
<td>Name :</td>
<td><input type="text" name="name"></td>
</tr>
<tr>
<td>Password :</td>
<td><input type="password" name="psw"></td>
</tr>
<tr>
<td>Target Account no :</td>
<td><input type="text" name="Tacno"></td>
</tr>
<tr>
<td>Amount :</td>
<td><input type="text" name="amt"></td>
</tr>
<tr>
<td><input type="submit" value="submit"></td>
<td><input type="reset" name="clear"></td>
</tr>

</table>
</form>
</center>
</body>
</html>