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
	function  del(pid,eid) {
		if(confirm("⚠ Are you sure you want to delete this employee record?")) {
	        window.location.href = "emp_underemp_del.jsp?id=" + pid + "&eid=" + eid;
	    }
	    // else: do nothing (cancel delete)
	}
	function updt(pid, eid){
		alert("Update id="+pid);
		window.location.href="emp_underemp_update.jsp?id="+pid+ "&eid=" + eid;
	}
</script>
</head>
<body>
<h1 style="text-align: center; font-weight: bold;">Propestect details</h1>

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
      
	  <form action="emp_underemp.jsp" method="get">
	      <div class="modal-body">
	      	<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Upline ID</label>
	  			<input type="text" class="form-control" name="uplineID" placeholder="Upline ID">
			</div>
	        <div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Name</label>
	  			<input type="text" class="form-control" name="pname" placeholder="Employee Name">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Upline Name</label>
	  			<input type="text" class="form-control" name="uplineName" placeholder="Upline Name">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Address</label>
	  			<input type="text" class="form-control" name="paddr" placeholder="Employee Address">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Mobile No.</label>
	  			<input type="number" class="form-control" name="pmob" placeholder="Mobile Number">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Email address</label>
	  			<input type="email" class="form-control" name="pemail" placeholder="name@example.com">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Date OF Birth</label>
	  			<input type="date" class="form-control" name="pdob" placeholder="YYYY-MM-DD">
			</div>
			<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Employee Gender</label>
			<select class="form-select" aria-label="Default select example" name="pgender">
	  			<option selected>-- Select Gender --</option>
	  			<option value="Male">Male</option>
	  			<option value="Female">Female</option>
	  			<option value="Other">Other</option>
			</select>
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Aadhar No.</label>
	  			<input type="number" class="form-control" name="padhar" placeholder="adhar no">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Pan no.</label>
	  			<input type="text" class="form-control" name="ppan" placeholder="pan no">
			</div>
			<div class="mb-3">
	  			<label for="exampleFormControlInput1" class="form-label">Employee Post</label>
	  			<input type="text" class="form-control" name="ppost" placeholder="post">
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
      <th>Upline ID</th>
      <th>Employee Name</th>
      <th>Upline Name</th>
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
	String id=request.getParameter("id");
	//out.println(id);
	
	Statement stmt;
	PreparedStatement pstmt;
	ResultSet rs;
	
	try{
		stmt=con.createStatement();
		rs=stmt.executeQuery("SELECT * FROM prospect where eid="+id);
		
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
		
		//out.println(pid+eid+pname+upline_name);
		
		%>
		<tr>
		<td><%= pid %></td>
		<td><%= eid %></td>
		<td><%= pname %></td>
		<td><%= upline_name %></td>
		<td><%= paddr %></td>
		<td><%= pmob %></td>
		<td><%= pemail %></td>
		<td><%= pdob %></td>
		<td><%= pgender %></td>
		<td><%= padhar %></td>
		<td><%= ppan %></td>
		<td><%= ppost %></td>
		<td><button type="button" onclick="del(<%= pid %>, <%= eid %>)" class="btn btn-danger">Delete</button>
		<button type="button" onclick="updt(<%= pid %>, <%= eid %>)" class="btn btn-warning">Update</button></td>
		</tr>
		<%
		}
		//insert data
		int uplineID=Integer.parseInt(request.getParameter("uplineID"));
		String pname=request.getParameter("pname");
		String uplineName=request.getParameter("uplineName");
		String paddr=request.getParameter("paddr");
		String pmob=request.getParameter("pmob");
		String pemail=request.getParameter("pemail");
		Date pdob = Date.valueOf(request.getParameter("pdob"));
		String pgender =request.getParameter("pgender");
		String padhar=request.getParameter("padhar");
		String ppan=request.getParameter("ppan");
		String ppost=request.getParameter("ppost");
		
		pstmt=con.prepareStatement("insert into prospect(eid, pname, upline_name, paddr, pmob, pemail, pdob, pgender, padhar, ppan, ppost) values(?,?,?,?,?,?,?,?,?,?,?)");
		pstmt.setInt(1, uplineID);
		pstmt.setString(2, pname);
		pstmt.setString(3, uplineName);
		pstmt.setString(4, paddr);
		pstmt.setString(5, pmob);
		pstmt.setString(6, pemail);
		pstmt.setDate(7, pdob);
		pstmt.setString(8, pgender);
		pstmt.setString(9, padhar);
		pstmt.setString(10, ppan);
		pstmt.setString(11, ppost);
		
		int r=pstmt.executeUpdate();
		if(r<1){
			System.out.println("Error in insert");
			response.sendRedirect("emp_underemp.jsp?id="+uplineID);
			
		}else{
			System.out.println("Success in insert");
			response.sendRedirect("emp_underemp.jsp?id="+uplineID);
			
		}
	}catch(Exception e){
		System.out.println("Error:"+e);
		
	}

%>
</tbody>
</table>
</body>
</html>