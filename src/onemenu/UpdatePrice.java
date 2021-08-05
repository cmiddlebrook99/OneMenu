package onemenu;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;

/**
 * Servlet implementation class UpdatePrice
 */
public class UpdatePrice extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePrice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getSession().getAttribute("username") == null){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
		else{
			request.getRequestDispatcher("/UpdatePrice.jsp").forward(request,response);
		}
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(request.getSession().getAttribute("username") == null || request.getSession().getAttribute("userID") == null){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
		
		else {
			// TODO Auto-generated method stub
	    	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String DB_URL = "jdbc:mysql://localhost:3306/OneMenuDB";
	
			// Database credentials
			String USER = "root";
			String PASS = "";
			
			Connection conn = null;
	
			try {
				Class.forName(JDBC_DRIVER);
				// STEP 3: Open a connection
				System.out.println("Connecting to database...");
				conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
				// STEP 4: Execute a query
				
				System.out.println("Creating statement...");
				PreparedStatement stmt = conn.prepareStatement("UPDATE Menu SET price='"+request.getParameter("price") + "'" + "WHERE id=" + request.getParameter("foodID").toString());
				
				
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
	


}
