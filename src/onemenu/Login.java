package onemenu;
import java.io.IOException; 
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Login")
public class Login extends HttpServlet{
	LoginDAO loginDao = new LoginDAO() ;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		String uname = request.getParameter("uname"); 
		String pass = request.getParameter("pass"); 
		if(loginDao.authenticate(uname, pass, request)){
			
			 request.setAttribute("username", uname);
			 request.getSession().setAttribute("username", uname);
			 request.getSession().setAttribute("userID", request.getAttribute("userID"));
			 System.out.println(request.getAttribute("userID"));
			 response.sendRedirect("/foodservlet/Menu"); 
		}
		else{
			request.setAttribute("InvalidLogin", "The username and password you entered did not match our records. Please double-check and try again.");
			request.getRequestDispatcher("/login.jsp").forward(request, response);

		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		doGet(request, response); 
	}
}
