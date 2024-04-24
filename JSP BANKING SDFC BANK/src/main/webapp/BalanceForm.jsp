<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>


<center>

<% 
long account_no=Long.parseLong(request.getParameter("acno"));
String name=request.getParameter("name");
String password=request.getParameter("psw");
try{
  Class.forName("oracle.jdbc.driver.OracleDriver");
  Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","system","manager");
  PreparedStatement ps=con.prepareStatement("select * from BankHdfc where account_no=? and name=? and password=?");  
  ps.setLong(1,account_no);
  ps.setString(2,name);
  ps.setString(3,password);
  ResultSet rs=ps.executeQuery();

  ResultSetMetaData rss=rs.getMetaData();
  out.println("<br><br>");
 out.println("<h2>Bank Account Details :<h2>");
  out.print("<table border='1'>"); 

  int n=rss.getColumnCount();   
  for(int i=1;i<=n;i++)     

   out.println("<td> <font color=blue size=3> "+"<br>" 
     +rss.getColumnName(i)); 

  out.println("<tr>"); 

  while(rs.next()) 
  { 
   for(int i=1;i<=n;i++) 

   out.println("<td><br> "+rs.getString(i)); 
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