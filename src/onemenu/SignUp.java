package onemenu;
 

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class HelloWorld
 */
public class SignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		LoginDAO loginDao = new LoginDAO() ;

		String firstName, lastName, email, password, confirmPassword  ;
		firstName 		= request.getParameter("firstName");
		lastName 		= request.getParameter("lastName");
		email 			= request.getParameter("email");
		password 		= request.getParameter("password");
		confirmPassword	= request.getParameter("confirmPassword") ;
		
		
		if(loginDao.UserAlreadyExists(email)){
			request.setAttribute("error", "A user with this email already exists.");
	        request.getRequestDispatcher("/SignUp.jsp").forward(request, response);
		}
		else{
			///////////////////////////////
			
			// JDBC driver name and database URL
			String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			//String DB_URL = "jdbc:mysql://52.26.86.130:3306/student";
			String DB_URL = "jdbc:mysql://localhost:3306/OneMenuDB";
	
			// Database credentials
			String USER = "root";
			String PASS = "";
	
			Connection conn = null;
			Statement stmt = null;
			//STEP 2: Register JDBC driver
			try {
				Class.forName("com.mysql.jdbc.Driver");
				//STEP 3: Open a connection
				System.out.println("Connecting to database...");
				conn = (Connection) DriverManager.getConnection(DB_URL,USER,PASS);
				//STEP 4: Execute a query
				System.out.println("Creating statement...");
				stmt = (Statement) conn.createStatement();
				String sql = "INSERT INTO Users (email, password, firstName, lastName) " +
							 "VALUES (\'" + email + "\', \'" + password + "\', \'" + firstName + "\', \'" + lastName + "\');";
				System.out.println(sql);
				stmt.executeUpdate(sql);
				
				
			
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			if(loginDao.authenticate(email, password, request)){
				
				 request.setAttribute("username", email);
				 request.getSession().setAttribute("username", email);
				 request.getSession().setAttribute("userID", request.getAttribute("userID"));
				 response.sendRedirect("/foodservlet/Menu"); 
			} 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
