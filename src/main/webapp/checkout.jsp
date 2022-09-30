<%

User user = (User)session.getAttribute("current-user");
if(user == null)
{
	
	session.setAttribute("message", "You are not logged in. Please login first");
	response.sendRedirect("login.jsp");
	 return;
}



%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="components/common_css_js.jsp" %>

</head>
<body>

<%@include file="components/navbar.jsp" %>



	<div class="container">
	
	
	
	<div class="row mt-5">
	
	<div class="col-md-6">
	
		<div class="card">
	
			<div class="card-body">
			
			<h2>Your selected items</h2>
	
				<div class="cart-body">
	
				</div>
			</div>
	
		</div>
	
	</div>
	
	
	
	
	
	<div class="col-md-6">
	
		<div class="card">
	
			<div class="card-body">
			
			<h3>Your details for order</h3>
			
			<form >
			
				<div class="mb-3">
    				<label for="exampleInputEmail1" class="form-label">Email address</label>
    				<input value="<%= user.getUserEmail() %>" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
    				<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
  				</div>
  				
  				
  				<div class="mb-3">
    				<label for="name" class="form-label">Your Name</label>
    				<input value="<%= user.getUserName() %>" type="text" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your name">
  				</div>
  				
  				<div class="mb-3">
    				<label for="name" class="form-label">Your Phone</label>
    				<input value="<%= user.getUserPhone() %>" type="number" class="form-control" id="name" aria-describedby="emailHelp" placeholder="Enter your contact number">
  				</div>
  				
  				<div class="mb-3">
  					<label for="exampleFormControlTextarea1" class="form-label">Your shipping address</label>
 					 <textarea value="<%= user.getUserAddress() %>" class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="Enter your address"></textarea>
				</div>
			
			
			<div class="container">
			
			<button class="btn btn-outline-success">Order Now</button>
			
			<button class="btn btn-outline-primary">Continue Shopping</button>
			
			</div>
			
			</form>
			</div>
	
		</div>
	
	
	</div>
	
	
	</div>
	
	</div>




<%@include file="components/common_modals.jsp" %>

</body>
</html>