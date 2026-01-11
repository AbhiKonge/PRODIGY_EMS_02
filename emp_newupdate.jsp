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
	String id = request.getParameter("id");
	String enm=request.getParameter("nm");
	String adr=request.getParameter("adr");
	String mob=request.getParameter("mob");
	String mail=request.getParameter("mail");
	Date dob = Date.valueOf(request.getParameter("dob"));
	String gen=request.getParameter("gender");
	String adhar=request.getParameter("adhar");
	String pan=request.getParameter("pan");
	if(pan.length()!=10){
		%>
      	 <script>
           alert("Invalid Pan...");
            window.location.href = "emp_update.jsp?id=<%= id %>";
       </script>
       
      	<% 
      	
	}else{
	String post=request.getParameter("post");
	//out.println(id+enm+adr+mob+mail);
	
	PreparedStatement pstmt;
	
	try{
		pstmt=con.prepareStatement("update emp_details set ename=?,eaddr=?,emob=?,email=?,edob=?,egender=?,eadhar=?,epan=?,epost=? where eid="+id);
		pstmt.setString(1, enm);
		pstmt.setString(2, adr);
		pstmt.setString(3, mob);
		pstmt.setString(4, mail);
		pstmt.setDate(5, dob);
		pstmt.setString(6, gen);
		pstmt.setString(7, adhar);;
		pstmt.setString(8, pan);
		pstmt.setString(9, post);
		
		int r=pstmt.executeUpdate();
		if(r<1){
			System.out.println("Error in updating");
			response.sendRedirect("emp_details.jsp");
		}else{
			System.out.println("Successfully in updating");
			response.sendRedirect("emp_details.jsp");
		}
				
	
		
	}catch(Exception e){
		System.out.println("Eroor:"+e);
		
		response.sendRedirect("emp_update.jsp?id="+id);
		
		
		
	}
	}
%>
</body>
</html>