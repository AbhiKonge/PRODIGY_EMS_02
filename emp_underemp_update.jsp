<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript">
	function cls() {
		window.location.href="emp_underemp.jsp";
	}
</script>
</head>
<body>
<h1 style="text-align: center; font-weight: bold;">Update page</h1>

<%
	String id=request.getParameter("id");
	
	
	Statement stmt;
	ResultSet rs;
	
	try{
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from prospect where pid="+id);
		
		while(rs.next()){
			
			int pid=rs.getInt("pid");
			int eid=rs.getInt("eid");
			String pname=rs.getString("pname");
			String upline_name=rs.getString("upline_name");
			String paddr= rs.getString("paddr");
			String pmob=rs.getString("pmob");
			String pemail=rs.getString("pemail");
			Date pdob=rs.getDate("pdob");
			String pgender=rs.getString("pgender");
			String padhar=rs.getString("padhar");
			String ppan=rs.getString("ppan");
			String ppost=rs.getString("ppost");
			
	
%>

 <form action="emp_underemp_newupdate.jsp" method="get">
	      <div class="modal-body">
	      	<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Prospect ID</label>
	  			<input type="number" readonly="readonly" class="form-control" value="<%= pid %>" name="ProspectID" placeholder="Prospect ID">
			</div>
	      	<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Upline ID</label>
	  			<input type="number" class="form-control" value="<%= eid %>" name="uplineID" placeholder="Upline ID">
			</div>
	        <div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Name</label>
	  			<input type="text" class="form-control" value="<%= pname %>" name="pname" placeholder="Employee Name">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Upline Name</label>
	  			<input type="text" class="form-control" value="<%= upline_name %>" name="uplineName" placeholder="Upline Name">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Address</label>
	  			<input type="text" class="form-control" value="<%= paddr %>" name="paddr" placeholder="Employee Address">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Mobile No.</label>
	  			<input type="number" class="form-control" value="<%= pmob %>" name="pmob" placeholder="Mobile Number">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Email address</label>
	  			<input type="email" class="form-control" value="<%= pemail %>" name="pemail" placeholder="name@example.com">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Date OF Birth</label>
	  			<input type="date" class="form-control" value="<%= pdob %>" name="pdob" placeholder="name@example.com">
			</div>
			<div class="mb-3">
			    <label class="form-label">Employee Gender</label>
			    <select class="form-select" name="pgender">
			        <option value="">-- Select Gender --</option>
			        <option value="Male" <%= "Male".equals(pgender) ? "selected" : "" %>>Male</option>
			        <option value="Female" <%= "Female".equals(pgender) ? "selected" : "" %>>Female</option>
			        <option value="Other" <%= "Other".equals(pgender) ? "selected" : "" %>>Other</option>
			    </select>
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Adhar No.</label>
	  			<input type="number" class="form-control" value="<%= padhar %>" name="padhar" placeholder="Employee Address">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Pan No.</label>
	  			<input type="text" class="form-control" value="<%= ppan %>" name="ppan" placeholder="Mobile Number">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Post</label>
	  			<input type="text" class="form-control" value="<%= ppost %>" name="ppost" placeholder="name@example.com">
			</div>
			
	     
	      <div class="modal-footer">
	        <button type="button" onclick="cls()" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="submit" class="btn btn-primary">Add</button>
	      </div>
	   </form>
<%
		}
			
	}catch(Exception e){
		System.out.println("Error:"+e);
	}
%>
</body>
</html>