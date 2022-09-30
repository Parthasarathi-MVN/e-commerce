<%@page import="com.dao.CategoryDao"%>
<%@page import="java.util.List"%>

<%@page import="com.dao.ProductDao"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.helper.Helper"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>E-Commerce:Home</title>
<link rel="stylesheet" href="css/style.css">

  <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
  
  
<%@include file="components/common_css_js.jsp" %>


</head>
<body>
<%@include file="components/navbar.jsp" %>


<div class="container-fluid">
	<div class="row mt-3 mx-2">
	
	
	<%
	
		String cat = request.getParameter("category");
		ProductDao dao = new ProductDao(FactoryProvider.getFactory());
		
		List<Product> list = null;
		
	
		
		if(cat == null || cat.trim().equals("all"))
		{
			list = dao.getAllProducts();
		}
		
		else
		{
			int cid = Integer.parseInt(cat.trim());
			list = dao.getAllProductsById(cid);
		}
		
		
		
		CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
		List<Category> clist = cdao.getCategories();
		
	
	%>
	
	
	<!-- show categories -->
	<div class="col-md-2">
	
	<div class="list-group mt-4">
  		<a href="index.jsp?category=all" class="list-group-item list-group-item-action active" aria-current="true">
   			 All categories
  		</a>
  		
  		
  
  

	
	<%
	
		for(Category c:clist)
		{
			%>
			
			<a  href="index.jsp?category=<%= c.getCategoryId() %>" class="list-group-item list-group-item-action"><%= c.getCategoryTitle() %></a>
			
	<%		 
		}
	%>
	
		</div>
	
	</div>
	
	<!-- show products -->
	
	<div class="col-md-10">
	
		
		<div class="row mt-4">
		
			<div class="col-md-12">
			
				<div class="card-columns" data-aos="fade-up">
				
				
				<%
						for(Product p:list)
						{
				
				
				%>
				
					<!-- product card -->
					<div class="card product-card">
					
					<div class="text-center"><img src="img/products/<%=p.getpPhoto() %>" class="card-img-top m-2 products-img" alt="..."></div>
					
						<div class="card-body">
						
							<h5 class="card-title"> <%=p.getpName()%> </h5>
							<p class="card-text"><%= Helper.get10Words(p.getpDesc()) %></p>
						
						</div>
						
						<div class="card-footer">
						
							<button class="btn custom-bg" onClick="add_to_cart(<%= p.getpId() %>, '<%= p.getpName() %>', <%= p.getPriceAfterApplyingDiscount()%>)">Add to cart</button>
							<button disabled class="btn btn-outline-warning"> &#8377; <%= p.getPriceAfterApplyingDiscount() %><span style="font-size:15px!important;margin-left:5px;" class="text-secondary discount-label">  &#8377; <%= p.getpPrice() %></span>  <span ><%=p.getpDiscount() %>%</span>  </button>
						
						
						</div>
					
					
					</div>
					
				
				<%}
						
				if(list.size() == 0)
				{
					out.println("No products are available in this category at this moment");
				}
				
				
				%>
				</div>
				
			
			</div>
		
		
		</div>
		
	</div>
	
	
	
	</div> 
 </div>









<%@include file="components/common_modals.jsp" %>



 <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>


</body>
</html>