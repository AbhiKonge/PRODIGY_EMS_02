<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>  
<%@ include file="DbConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Employee Details</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

<script type="text/javascript">
function del(id){
    if(confirm("⚠ Are you sure you want to delete this employee record?")) {
        window.location.href = "emp_delete.jsp?id=" + id;
    }
    // else: do nothing (cancel delete)
}
	function updt(id){
		alert("Update id="+id);
		window.location.href="emp_update.jsp?id="+id;
	}
</script>

</head>
<body>
<h2 style="text-align: center; font-weight: bold; "> Employee Details</h2>

<!-- Button trigger modal -->
<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#staticBackdrop">
  Add Employee
</button>

<!-- Modal -->
<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="staticBackdropLabel">Employee Detalis</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      
      <form action="emp_details.jsp" method="get">
      <div class="modal-body">
      <div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Admin ID</label>
  			<input type="number" class="form-control" name="adminId" placeholder="Admin ID">
		</div>
        <div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Employee Name</label>
  			<input type="text" class="form-control" name="nm" placeholder="Employee Name">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Employee Address</label>
  			<input type="text" class="form-control" name="adr" placeholder="Employee Address">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Mobile No.</label>
  			<input type="number" class="form-control" name="mob" placeholder="Mobile Number">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Email address</label>
  			<input type="email" class="form-control" name="mail" placeholder="name@example.com">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Date OF Birth</label>
  			<input type="date" class="form-control" name="dob" placeholder="YYYY-MM-DD">
		</div>
		<div class="mb-3">
		<label for="exampleFormControlInput1" class="form-label">Gender</label>
		<select class="form-select" aria-label="Default select example" name="gender">
  			<option selected>Select Gender</option>
  			<option value="Male">Male</option>
  			<option value="Female">Female</option>
  			<option value="Other">Other</option>
		</select>
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Aadhar No.</label>
  			<input type="number" class="form-control" name="adhar" placeholder="adhar no">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Pan no.</label>
  			<input type="text" class="form-control" name="pan" placeholder="pan no">
		</div>
		<div class="mb-3">
  			<label for="exampleFormControlInput1" class="form-label">Post</label>
  			<input type="text" class="form-control" name="post" placeholder="post">
		</div>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Add</button>
      </div>
      </form>
    </div>
  </div>
</div>

<table class="table table-success table-striped table-bordered border-dark">
  <thead class="table-primary">
    <tr>
      <th >ID</th>
   <!--   <th >AdminID</th> -->
      <th>Employee Name</th>
      <th >Address</th>
      <th >Mobile No</th>
      <th >Email</th>
      <th>DOB</th>
      <th>Gender</th>
      <th>Aadhar no</th>
      <th >Pan no</th>
      <th>Post</th>
      <th >Action</th>
    </tr>
  </thead>
  <tbody>
<%
    Statement stmt;
  	PreparedStatement pstmt;
    ResultSet rs;
	try{
		
		//for printing data in web page
		stmt=con.createStatement();
		Integer adminId = (Integer) session.getAttribute("adid");
		//out.println(adminId);
		rs=stmt.executeQuery("Select * from emp_details where admin_id="+adminId);
		while(rs.next()){
			
			//out.println(rs.getString("ename")+" "+rs.getString("emob")+" "+rs.getDate("edob"));
			int id=rs.getInt("eid");
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
			<tr>
    		<td><%= id %></td>
    		<td><a href="emp_underemp.jsp?id=<%= id %>" style="text-decoration: none; color: black;"><%= enm %></a></td>
    		<td><%= eaddr %></td>
    		<td><%= emob %></td>
    		<td><%= email %></td>
    		<td><%= edob %></td>
    		<td><%= egender %></td>
    		<td><%= eadhar %></td>
    		<td><%= epan %></td>
    		<td><%= epost %></td>
    		<td><button type="button" onclick="del(<%= id %>)" class="btn btn-danger">Delete</button>
    		<button type="button" onclick="updt(<%= id %>)" class="btn btn-warning">Update</button></td>
    		
    	</tr>
    	<%
		}
		//insert data
		int adid=Integer.valueOf(request.getParameter("adminId"));
		String enm=request.getParameter("nm");
		String adr=request.getParameter("adr");
		String mob=request.getParameter("mob");
		String mail=request.getParameter("mail");
		Date dob = Date.valueOf(request.getParameter("dob"));
		String gen=request.getParameter("gender");
		String adhar=request.getParameter("adhar");
		String pan=request.getParameter("pan");
		String post=request.getParameter("post");
		
		pstmt=con.prepareStatement("insert into emp_details(admin_id,ename,eaddr,emob,email,edob,egender,eadhar,epan,epost) values(?,?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, adid);
		pstmt.setString(2, enm);
		pstmt.setString(3, adr);
		pstmt.setString(4, mob);
		pstmt.setString(5, mail);
		pstmt.setDate(6, dob);
		pstmt.setString(7, gen);
		pstmt.setString(8, adhar);;
		pstmt.setString(9, pan);
		pstmt.setString(10, post);
		
		int r=pstmt.executeUpdate();
		if(r<1){
			System.err.println("Error");
			response.sendRedirect("emp_details.jsp");
		}else{
			System.out.println("insert Successfully");
			response.sendRedirect("emp_details.jsp");
		}
		
		
	}catch(Exception e){
		System.out.println("Error: "+e);
	}
%>
</tbody>
</table>
</body>
</html>