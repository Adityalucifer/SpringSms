package com.jsp;
import java.io.IOException; 
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.dao.StudentDao;
import com.dto.Student;
@WebServlet("/signup")
public class Student_signup extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req,HttpServletResponse resp)throws ServletException,IOException
	{
		String name =req.getParameter("name");
		String email=req.getParameter("email");
		String password=req.getParameter("pass");
		String gender=req.getParameter("gen");
		int age=Integer.parseInt(req.getParameter("age"));
		Long phone=Long.parseLong(req.getParameter("phone"));
		String dob=req.getParameter("dob");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
		Date d=null;
		try {
			d=sdf.parse(dob);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Student s=new Student();
		s.setName(name);
		s.setEmail(email);
		s.setGender(gender);
		s.setPassword(password);
		s.setDob(d);;
		s.setAge(age);
		s.setName(name);
		s.setPhone(phone);
		StudentDao st=new StudentDao();
		st.saveStudent(s);
		 resp.getWriter().print("<h1>Signup succesfull...<h1>");
		 req.getRequestDispatcher("Student.jsp").include(req, resp);

		 
		 
		 
	
		 
	}
}
