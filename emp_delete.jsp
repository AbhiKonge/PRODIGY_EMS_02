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
<h1>Delete page</h1>

<%
	String id=request.getParameter("id");
	out.println(id);
	
	PreparedStatement pstmt;
	try{
		pstmt=con.prepareStatement("delete from emp_details where eid="+id);
		int r=pstmt.executeUpdate();
		if(r<1){
			System.err.println("Error");
			response.sendRedirect("emp_details.jsp");
		}else{
			System.err.println("Delete Successfully");
			response.sendRedirect("emp_details.jsp");
		}
		
	}catch(Exception e){
		System.out.println("Error:"+e);
	}
	
	
	
	
	
%>
</body>
</html>