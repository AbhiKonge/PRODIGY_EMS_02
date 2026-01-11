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
	String id=request.getParameter("ProspectID");
    String eid=request.getParameter("uplineID");
	//out.println(id);
	//out.println(eid);
	String pname=request.getParameter("pname");
	String uplineName=request.getParameter("uplineName");
	String paddr=request.getParameter("paddr");
	String pmob=request.getParameter("pmob");
	String pemail=request.getParameter("pemail");
	Date pdob = Date.valueOf(request.getParameter("pdob"));
	String pgender =request.getParameter("pgender");
	String padhar=request.getParameter("padhar");
	String ppan=request.getParameter("ppan");
	if(ppan.length()!=10){
		%>
      	 <script>
           alert("Invalid Pan...");
            window.location.href = "emp_underemp_update.jsp?id=<%= id %>";
       	</script>
      	<% 
      	
	}else{
		String ppost=request.getParameter("ppost");
		
		PreparedStatement pstmt;
		
		try{
			pstmt=con.prepareStatement("update prospect set pname=?, upline_name=?, paddr=?, pmob=?, pemail=?,  pdob=?, pgender=?, padhar=?, ppan=?, ppost=? where pid="+id);

			pstmt.setString(1,pname);
			pstmt.setString(2,uplineName);
			pstmt.setString(3,paddr);
			pstmt.setString(4,pmob);
			pstmt.setString(5,pemail);
			pstmt.setDate(6, pdob);
			pstmt.setString(7, pgender);
			pstmt.setString(8, padhar);
			pstmt.setString(9, ppan);
			pstmt.setString(10, ppost);
			
			int r=pstmt.executeUpdate();
			if(r<1){
				System.out.println("Error in updating");
				response.sendRedirect("emp_underemp.jsp?id="+eid);
			}else{
				System.out.println("Successfully in updating");
				response.sendRedirect("emp_underemp.jsp?id="+eid);
			}
				
			
		}catch(Exception e){
			System.out.println("Error:"+e);
			
		}
	}
	

	
%>
</body>
</html>