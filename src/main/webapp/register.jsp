<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>


<%@include file="components/common_css_js.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">

<div class="row mt-5">
	<div class="col-md-4 offset-md-4">	
		
		<div class="card">
		<%@include file="components/message.jsp" %>
		
		<div class="card-body">
		
		<h3 class="text-center my-3">Sign Up here</h3>
		
	<center>	<img class="icon"  width="50px" height="50px" src="img/sign-up.png"> </center>
		
		<form action="RegisterServlet" method="post">
		
		<div class="form-group">
    <label for="name">User Name</label>
    <input required name="user_name" type="text" class="form-control" id="name" placeholder="Enter your name" aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="email">User Email</label>
    <input required name="user_email" type="email" class="form-control" id="email" placeholder="Enter your e-mail" aria-describedby="emailHelp">
  </div>
  
  
  <div class="form-group">
    <label for="password">Password</label>
    <input required name="user_password" type="password" class="form-control" id="password" placeholder="Enter your e-mail" aria-describedby="emailHelp">
  </div>
  
   <div class="form-group">
    <label for="phone">Phone Number</label>
    <input required name="user_phone" type="number" class="form-control" id="phone" placeholder="Enter your e-mail" aria-describedby="emailHelp">
  </div>
  
   <div class="form-group">
    <label for="password">Address</label>
    <textarea required name="user_address" style="height:150px;"" class="form-control"placeholder="Enter your address"></textarea>
  </div>
  
  <div style="margin-top:15px" class="container text-center">
  <button class="btn btn-outline-success">Register</button>
  <button class="btn btn-outline-warning">Reset</button>
  </div>
		
		</form>
		
		</div>
		
		</div>
		
	</div>
</div>	
</div>
</body>
</html>