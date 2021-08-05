package onemenu;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

/**
 * Servlet implementation class HelloWorld
 */
@WebServlet("/Menu")
public class Menu extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public Menu() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	if(request.getSession().getAttribute("username") == null || request.getSession().getAttribute("userID") == null){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
    	else{
	    		
			ArrayList<FoodItem> Menu = new ArrayList<>() ;
	
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
				
				String sql = "select m.id, m.name, m.price,  f.type, r.name from menu m join foodtype f on m.type = f.id join restaurants r on m.restaurant = r.restID ;";
				
				// STEP 5: Extract data from result set
				ResultSet rs = (ResultSet) stmt.executeQuery(sql);
				while (rs.next()) {
					FoodItem f = new FoodItem() ;
					
					
					f.id = rs.getInt("m.id");
					
					f.setName(rs.getString("m.name"));
					
					
					f.setPrice(rs.getString("m.price"));
					
					f.setFoodType(rs.getString("f.type"));
					
					f.setRestaurant(rs.getString("r.name"));
					
					Menu.add(f) ;
					
			
					
				
				}
				
				String sql2 = "select COUNT(*) as totalReviews, AVG(rating) as averageRating from Reviews WHERE foodID=" + "'" +request.getParameter("foodID") + "'";
				rs = (ResultSet) stmt.executeQuery(sql2);
				
				while (rs.next()) {
					request.setAttribute("totalReviews", rs.getInt("totalReviews")); 
					request.setAttribute("averageRating", rs.getDouble("averageRating"));
				}
				
				String sql3 = "select foodID, AVG(rating) as averageRating from Reviews GROUP BY(foodID)";
				ResultSet rs3 = (ResultSet) stmt.executeQuery(sql3);
				
				while (rs3.next()) {
					for(int i = 0 ; i < Menu.size() ; i++ ){
						
						if(Menu.get(i).id == rs3.getInt("foodID")){
							Menu.get(i).setRating(rs3.getDouble("averageRating"));
						}
							
					}
				}
				
					
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
			if(Menu.size() == 0) {
				request.getRequestDispatcher("/error.jsp").forward(request,response);
			}
			else {
				request.setAttribute("Menu", Menu); 
				request.getRequestDispatcher("/response.jsp").forward(request,response);
			}
    	}
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response); 
    }


}

