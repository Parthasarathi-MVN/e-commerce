package com.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.CategoryDao;
import com.dao.ProductDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;
import javax.servlet.http.Part;

@WebServlet("/ProductOperationServlet")
@MultipartConfig
public class ProductOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		//fetching category data
		try {
			
			
			String op = request.getParameter("operation");
			
			if(op.trim().equals("addcategory"))
			{
				String title = request.getParameter("catTitle");
				String description = request.getParameter("catDescription");
				
				Category category = new Category();
				category.setCategoryTitle(title);
				category.setCategoryDescription(description);
				
				
				CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
				int catId = categoryDao.saveCategory(category);
				System.out.println("category saved");
				
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Category added successfully "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
				
				
				
			}
			
			else if(op.trim().equals("addproduct"))
			{
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDesc");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");
				
				
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
			
				//to get Cateogry object from the CategoryId
				
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				Category category = cdao.getCategoryById(catId);
				
				
				p.setCategory(category);
				
				
				
				
				ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				
				String p11 = request.getRealPath("img");
				
				System.out.println(p11);
				//saving picture to local
			
				String path = request.getRealPath("img")+File.separator+"products"+File.separator+part.getSubmittedFileName();
				System.out.println(path);
					
				 //uploading photo
				
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				
				byte data[] = new byte[is.available()];
				is.read(data);
				
				fos.write(data);
				fos.close();
				
			
				
				System.out.println("Product saved successfully");
				HttpSession httpSession = request.getSession();
				httpSession.setAttribute("message", "Product added successfully "+catId);
				response.sendRedirect("admin.jsp");
				return;
				
				
				
				
			}
		
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		
	}

}
