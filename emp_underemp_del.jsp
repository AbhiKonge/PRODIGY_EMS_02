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
<h1>Delete Page</h1>

<%
	String id=request.getParameter("id");
	String eid=request.getParameter("eid");
	//out.println(id);
	//out.println(eid);
	
	PreparedStatement pstmt;
	
	try{
		
		pstmt=con.prepareStatement("delete from prospect where pid="+id);
		int r=pstmt.executeUpdate();
		
		if(r<1){
			System.out.println("Error in deleting");
			response.sendRedirect("emp_underemp.jsp?id="+eid);
		}else{
			System.out.println("Success in deleting");
			response.sendRedirect("emp_underemp.jsp?id="+eid);
		}
		
	}catch(Exception e){
		System.out.println("Error in deleting:"+e);
	} 
	
	
%>
</body>
</html>