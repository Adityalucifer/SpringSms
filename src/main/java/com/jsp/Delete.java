package com.jsp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.StudentDao;
import com.dto.Student;
@WebServlet("/delete")
public class Delete extends HttpServlet

{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	
	{
		int id=Integer.parseInt(req.getParameter("id"));
		StudentDao d=new StudentDao();
		Student st=d.findStudentByid(id);
		if(st!=null)
		{
			d.delteStudent(st);
			resp.getWriter().print("<h1>"+id+"ID Student deleted...</h1>");
			req.getRequestDispatcher("Student.jsp").include(req, resp);
		}
	}

}
