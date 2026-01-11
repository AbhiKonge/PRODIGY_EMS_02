<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update employee details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript">
	function  cls() {
		window.location.href="emp_details.jsp";
		
	}
</script>
</head>
<body>
<h1 style="text-align: center; font-weight: bold;">Update page</h1>
<%
	String id=request.getParameter("id");
	//out.println(id);
	
	Statement stmt;
	ResultSet rs;
	try{
		stmt=con.createStatement();
		rs=stmt.executeQuery("select * from emp_details where eid="+id);
		while(rs.next()){
			//out.println(rs.getString("ename")+" "+rs.getString("emob")+" "+rs.getDate("edob"));
			
			int eid=rs.getInt("eid");
			String enm=rs.getString("ename");
			String eaddr=rs.getString("eaddr");
			String emob=rs.getString("emob");
			String email=rs.getString("email");
			Date edob=rs.getDate("edob");
			String egender=rs.getString("egender");
			String eadhar=rs.getString("eadhar");
			String epan=rs.getString("epan");
			String epost=rs.getString("epost");
			%>

			<form action="emp_newupdate.jsp" method="get">
		      <div class="modal-body">
		      	<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Employee ID</label>
		  			<input type="text" readonly="readonly" class="form-control" value="<%= eid %>" name="id" placeholder="Employee ID">
				</div>
		        <div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Employee Name</label>
		  			<input type="text" class="form-control" value="<%= enm %>" name="nm" placeholder="Employee Name">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Employee Address</label>
		  			<input type="text" class="form-control" value="<%= eaddr %>" name="adr" placeholder="Employee Address">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Mobile No.</label>
		  			<input type="number" class="form-control" value="<%= emob %>" name="mob" placeholder="Mobile Number">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Email address</label>
		  			<input type="email" class="form-control" value="<%= email %>" name="mail" placeholder="name@example.com">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Date OF Birth</label>
		  			<input type="date" class="form-control" value="<%= edob %>" name="dob" placeholder="YYYY-MM-DD">
				</div>
				<div class="mb-3">
				    <label class="form-label">Employee Gender</label>
				    <select class="form-select" name="gender">
				        <option value="">-- Select Gender --</option>
				        <option value="Male" <%= "Male".equals(egender) ? "selected" : "" %>>Male</option>
				        <option value="Female" <%= "Female".equals(egender) ? "selected" : "" %>>Female</option>
				        <option value="Other" <%= "Other".equals(egender) ? "selected" : "" %>>Other</option>
				    </select>
				</div>

				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Aadhar No.</label>
		  			<input type="number" class="form-control" value="<%= eadhar %>" name="adhar" placeholder="adhar no">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Pan no.</label>
		  			<input type="text" class="form-control" value="<%= epan %>" name="pan" placeholder="pan no">
				</div>
				<div class="mb-3">
		  			<label for="exampleFormControlInput1" class="form-label">Post</label>
		  			<input type="text" class="form-control" value="<%= epost %>" name="post" placeholder="post">
				</div>
				
		      </div>
		      <div class="modal-footer">
		        <button type="button" onclick="cls()" class="btn btn-secondary btn-lg" data-bs-dismiss="modal">Close</button>
		        <button type="submit" class="btn btn-primary btn-lg">Add</button>
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