package com.jsp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/login")
public class Login extends HttpServlet
{
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String pass=req.getParameter("pass");
		
		if (name.equals("admin") && pass.equals("admin")) {
			HttpSession hs=req.getSession();
			
			Admin admin=new Admin();
			admin.setName(name);
			admin.setPassword(pass);
			
			hs.setAttribute("admin", admin);
			
			resp.getWriter().print("<h1>Login Successful</h1>");
			req.getRequestDispatcher("signup.jsp").include(req, resp);
		} else {
			resp.getWriter().print("<h1>Invalid Credentials</h1>");
			req.getRequestDispatcher("Login.jsp").include(req,resp);
		}

	
	}
}
