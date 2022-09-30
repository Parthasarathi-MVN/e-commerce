	<%@ page import="com.entities.*" %>
	
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
</head>
<body>
<h1>This is normal user panel</h1>
</body>
</html>