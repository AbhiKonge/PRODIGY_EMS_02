<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Connection con = null;

try{
	String url= "jdbc:postgresql://localhost:5432/SapDeal_emp";
	String user="postgres";
	String pwt="abhi1617";
	
	Class.forName("org.postgresql.Driver");
	con= DriverManager.getConnection(url,user,pwt);
	System.out.println("Connection OKK");
	//out.println("Connection OKK");
	
}catch(Exception e){
	System.out.println(e);
}

%>
</body>
</html>