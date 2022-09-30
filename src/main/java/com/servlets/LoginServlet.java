package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.helper.FactoryProvider;
import com.dao.*;
import com.entities.User;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try 
		{
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			UserDao userDao = new UserDao(FactoryProvider.getFactory());
			User user = userDao.getUserByEmailAndPassword(email, password);
			System.out.println(user);
			
			HttpSession httpSession = request.getSession();
			
			if(user==null)
			{
				
				httpSession.setAttribute("message", "Invalid Details.");
				response.sendRedirect("login.jsp");
				return;
			}
			else 
			{
				System.out.println("<h1>Welcome "+user.getUserName()+"</h1>");
				
				
				//login user
				httpSession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin"))
				{
					response.sendRedirect("admin.jsp");
					
				}
				else if(user.getUserType().equals("normal"))
				{
					response.sendRedirect("index.jsp");
				}
				else {
					System.out.println("We have not identified user type");
				}
				
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		} 
		
		
	}

}
