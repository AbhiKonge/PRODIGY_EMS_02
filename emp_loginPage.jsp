
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String user_name=request.getParameter("username");
	String password=request.getParameter("password");
	
	Statement stmt;
	ResultSet rs;
	
	stmt=con.createStatement();
	rs=stmt.executeQuery("select username, password, admin_id from users where username='"+user_name+"' and password='"+password+"'");
	int count=0;
	while(rs.next()){
		String unm=rs.getString("username");
		int adid=rs.getInt("admin_id");
		session.setAttribute("unm", user_name);
		session.setAttribute("adid", adid);
		response.sendRedirect("emp_details.jsp");
		count++;
	}
	if(count==0){
		%>
      	 <script>
           alert("Invalid User...");
           window.location.href = "emp_login.html";
       </script>
      	<% 
	}
%>
</body>
</html>