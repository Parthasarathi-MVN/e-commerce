<%@ page import="com.entities.*" %>
<%@ page import="com.dao.*" %>
<%@ page import="com.helper.*" %>
<%@ page import="java.util.*" %>

<%

	User user = (User)session.getAttribute("current-user");
	if(user == null)
	{
		
		session.setAttribute("message", "You are not logged in. Please login first");
		response.sendRedirect("login.jsp");
		 return;
	}
	else
	{
		if(user.getUserType().equals("normal"))
		{

			session.setAttribute("message", "You are not an admin. Therefore you cannot access this page");
			response.sendRedirect("abc.jsp");
			 return;
		}
	}


%>



				<%
					CategoryDao cDao = new CategoryDao(FactoryProvider.getFactory());
					List<Category> list = cDao.getCategories();
				
					
					//getting count of products and users
					
					Map<String,Long> m = Helper.getCounts(FactoryProvider.getFactory());
				%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Panel</title>
<%@include file="components/common_css_js.jsp" %>


</head>
<body>
<%@include file="components/navbar.jsp" %>

	<div class="container admin">
	
	
	<div class="container-fluid mt-3">
	
	<%@include file="components/message.jsp" %>
	</div>
	
	
		<!-- first row -->
		<div class="row mt-3">
			<div class="col-md-4">
			
			
			<!-- first-box -->
				<div class="card">
					<div class="card-body text-center">
					
					<div class="container">
					<img width="100px" height="100px" src="img/users.png" alt="user_icon">
					
					</div>
					<h1><%= m.get("userCount") %></h1>
						<h1>Users</h1>
					</div>
				</div>
			
			</div>
			
			<div class="col-md-4">
			
			<!-- second-box -->
				<div class="card">
					<div class="card-body text-center">
					
					<div class="container">
					<img width="100px" height="100px" src="img/categories.png" alt="user_icon">
					
					
					</div>
					
					<h1><%=list.size() %></h1>
						<h1>Categories</h1>
					</div>
				</div>
			
			</div>
			
			
			
			<div class="col-md-4">
			
			<!-- third-box -->
				<div class="card">
					<div class="card-body text-center">
					
					
					<div class="container">
					<img width="100px" height="100px" src="img/products.png" alt="user_icon">
					</div>
					
					
					<h1><%= m.get("productCount") %></h1>
						<h1>Products</h1>
					</div>
				</div>
			
			</div>
		
		</div>
		
		<!-- second row -->
		<div class="row mt-3">
		
			<div class="col-md-6">
				
					<div class="card" data-bs-toggle="modal" data-bs-target="#add-category-modal">
					<div class="card-body text-center">
					
					
					<div class="container">
					<img class="mb-3" width="100px" height="100px" src="img/categories.png" alt="user_icon">
					
					</div>
					
					<img width="30px" height="30px" src="img/plus.png" alt="user_icon">
					<p class="mt-2"> Click here to add new category</p>
						<h1>Add Category</h1>
					</div>
				</div>
				
			</div>
		
		
			<div class="col-md-6">
				
					<div class="card"  data-bs-toggle="modal" data-bs-target="#add-product-modal">
					<div class="card-body text-center">
					
					
					<div class="container">
					<img class="mb-3" width="100px" height="100px" src="img/products.png" alt="user_icon">
					</div>
					
					<img width="30px" height="30px" src="img/plus.png" alt="user_icon">
					<p class="mt-2"> Click here to add new product</p>
						<h1>Add Product</h1>
					</div>
				</div>
				
			</div>
		
		
		</div>
	
	</div>
	
	
	
	<!-- Category Modal -->
	

<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg ">
        <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
			<form action="ProductOperationServlet" method="post">
			<input type="hidden" name="operation" value="addcategory">
			
				<div class="form-group">
					<input required type="text" class="form-control" name="catTitle" placeholder="Enter category title">
				
				</div>
				
				<div class="form-group">
				<textarea style="height:200px;"name="catDescription" class="form-control mt-3" placeholder="Enter category description"></textarea>
				</div>
			
				<div class="container text-center">
					<button class="btn btn-outline-success mt-3">Add Category</button>
					  <button type="button" class="btn btn-danger mt-3" data-bs-dismiss="modal">Close</button>
				
				</div>
			
			</form>



      </div>
  
    </div>
  </div>
</div>
	
	<!-- end category modal -->
	
	
	
	
	
	
	
	
	<!-- Product Modal -->
	

<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div class="modal-header custom-bg ">
        <h5 class="modal-title" id="exampleModalLabel">Enter product details</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
       
			<form action="ProductOperationServlet" method="post" enctype="multipart/form-data">
			
			<input type="hidden" name="operation" value="addproduct">
			
				<div class="form-group">
					<input required type="text" class="form-control" name="pName" placeholder="Enter Product name">
				
				</div>
				
				<div class="form-group">
				<textarea style="height:200px;" class="form-control mt-3" placeholder="Enter product description" name="pDesc"></textarea>
				</div>
				
				
				<div class="form-group">
				<input required type="number" class="form-control mt-3" placeholder="Enter price of the product" name="pPrice">
				</div>
				
				<div class="form-group">
				<input required type="number" class="form-control mt-3" placeholder="Enter the discount on the product" name="pDiscount">
				</div>
				
				
				<div class="form-group">
				<input required type="number" class="form-control mt-3" placeholder="Enter the quantity of the product" name="pQuantity">
				</div>
				
				
				
				
				
				
				
				
				<div class="form-group"> 
				<select name="catId" class="form-control" id="">
				
				<%
					for(Category c:list)
					{
				%>
				<option value="<%=c.getCategoryId() %>"> <%=c.getCategoryTitle()%> </option>
				
				<%
					}				
				%>
				
				</select>
				</div>
				
				
				
				
				<div class="form-group">
				<label for="pPic" class="mt-2">Select Picture of product</label>
				<br>
				<input class="mt-2" required type="file" id="pPic" name="pPic">
				
				</div>
				
				
			
				<div class="container text-center">
					<button class="btn btn-outline-success mt-3">Add Product</button>
					  <button type="button" class="btn btn-danger mt-3" data-bs-dismiss="modal">Close</button>
				
				</div>
			
			</form>



      </div>
  
    </div>
  </div>
</div>
	
	<!-- end product modal -->
	
	
	<%@include file="components/common_modals.jsp" %>
	
	
	
	
	
	
	
	
	

</body>
</html>