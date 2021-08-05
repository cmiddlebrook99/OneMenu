package onemenu;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

@WebServlet("/AddReview")
public class AddReview extends HttpServlet{
	
	
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("username") == null || request.getSession().getAttribute("userID") == null){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
		else if(request.getParameter("starRating").toString().isEmpty()){
			
			request.setAttribute("ratingNotFound", "A star rating is required.");
	        request.getRequestDispatcher("/AddReview.jsp").forward(request, response);

		}
		
		else {
			// TODO Auto-generated method stub
	    	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String DB_URL = "jdbc:mysql://localhost:3306/OneMenuDB";
	
			// Database credentials
			String USER = "root";
			String PASS = "";
			
			Connection conn = null;
	        HttpSession session = request.getSession();
	
			try {
				Class.forName(JDBC_DRIVER);
				// STEP 3: Open a connection
				System.out.println("Connecting to database...");
				conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
				// STEP 4: Execute a query
				System.out.println("Creating statement...");
				PreparedStatement stmt = conn.prepareStatement("INSERT INTO Reviews(userID, foodID, rating, review, reviewDate) VALUES (?, ?, ?, ? ,?)");
				
	
				stmt.setString(1, session.getAttribute("userID").toString());
				stmt.setString(2, request.getParameter("foodID").toString());
				stmt.setString(3, request.getParameter("starRating").toString());
				stmt.setString(4, request.getParameter("comment").toString());
				
			
				java.sql.Time dateDB = new java.sql.Time(System.currentTimeMillis());
				stmt.setTime(5, dateDB);
				
				System.out.println(stmt.toString());
				stmt.executeUpdate();
			}
			
			catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
			}
			
			
			 response.sendRedirect("/foodservlet/Menu"); 
		}
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("username") == null){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
		else{
			request.getRequestDispatcher("/AddReview.jsp").forward(request,response);
		}
	}

}
