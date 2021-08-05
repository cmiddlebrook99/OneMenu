package onemenu;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class AddFoodItem
 */
public class AddFoodItem extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

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
				PreparedStatement stmt = conn.prepareStatement("INSERT INTO Menu(name, price, restaurant, type) VALUES (?, ?, ?, ? )");
				
	
				stmt.setString(1, request.getParameter("name").toString());
				stmt.setString(2, request.getParameter("price").toString());
				stmt.setString(3, request.getParameter("restaurant").toString());
				stmt.setString(4, request.getParameter("type").toString());
				
				System.out.println(stmt.toString()) ;
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
			ArrayList<Restaurant> RestaurantList = new ArrayList<>() ;
			
	    	// TODO Auto-generated method stub
	    	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
			String DB_URL = "jdbc:mysql://localhost:3306/OneMenuDB";
	
			// Database credentials
			String USER = "root";
			String PASS = "";
			
			Connection conn = null;
			Statement stmt = null;
			
			try {
				Class.forName(JDBC_DRIVER);
				// STEP 3: Open a connection
				System.out.println("Connecting to database...");
				conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
				// STEP 4: Execute a query
				System.out.println("Creating statement...");
				stmt = (Statement) conn.createStatement();
				
				String sql = "SELECT * FROM Restaurants";
				
				// STEP 5: Extract data from result set
				ResultSet rs = (ResultSet) stmt.executeQuery(sql);
				while (rs.next()) {
					Restaurant r = new Restaurant() ;
					
					r.setID(rs.getInt("restID")) ;
					r.setName(rs.getString("name")); 
					
					RestaurantList.add(r) ;
				
				}
				request.setAttribute("RestaurantList", RestaurantList);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}

			try {
				Class.forName(JDBC_DRIVER);
				// STEP 3: Open a connection
				System.out.println("Connecting to database...");
				conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
				// STEP 4: Execute a query
				System.out.println("Creating statement...");
				stmt = (Statement) conn.createStatement();
				
				String sql = "SELECT * FROM foodtype";
				ArrayList<String> FoodTypes = new ArrayList<>() ; 
				
				// STEP 5: Extract data from result set
				
				ResultSet rs = (ResultSet) stmt.executeQuery(sql);
				while (rs.next()) {
					FoodTypes.add(rs.getString("type"))  ;
				}
				
				request.setAttribute("FoodTypes", FoodTypes);

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
			request.getRequestDispatcher("/AddFoodItem.jsp").forward(request,response);

	}

}
}
