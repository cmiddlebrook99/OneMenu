package onemenu;

import java.io.IOException;
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

@WebServlet("/ReviewsForFoodItem")
public class ReviewsForFoodItem extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ReviewsForFoodItem() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	if(request.getSession().getAttribute("username") == null || request.getSession().getAttribute("userID") == null ){
			response.sendRedirect("/foodservlet/login.jsp");
    	}
    	else {
			ArrayList<Review> ReviewList = new ArrayList<>() ;
	
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
				
				String sql = "select m.name as foodName, m.restaurant, rest.name as restName, u.firstName, u.lastName, r.* from Reviews r join Users u on r.userID = u.userID join Menu m on r.foodID = m.id  join Restaurants rest on rest.restID = m.restaurant "
						+ "	  WHERE foodID=" + "'" +request.getParameter("foodID") + "' order by(reviewDate) desc";
				//put filtering stuff right here
				
				System.out.println(sql);
				// STEP 5: Extract data from result set
				ResultSet rs = (ResultSet) stmt.executeQuery(sql);
				while (rs.next()) {
					request.setAttribute("foodName", rs.getString("foodName"));
					request.setAttribute("restName", rs.getString("restName")); 
					Review r = new Review() ;
					
					r.setReviewID(rs.getInt("reviewID"));
					r.setAuthor(rs.getString("firstName") + " " + rs.getString("lastName").charAt(0) + ".");
					
					r.setStarRating(rs.getDouble("rating"));
					
					r.setFullDescription(rs.getString("review"));
					r.setDate(rs.getDate("reviewDate"));
					if(rs.getString("userID").toString().equals(request.getSession().getAttribute("userID").toString())){
						r.belongsToCurrentUser = true ;
					}
					ReviewList.add(r) ;
					
					
					System.out.println(r.getDate());
				}
				
				String sql2 = "select COUNT(*) as totalReviews, AVG(rating) as averageRating from Reviews WHERE foodID=" + "'" +request.getParameter("foodID") + "'";
				rs = (ResultSet) stmt.executeQuery(sql2);
				
				while (rs.next()) {
					request.setAttribute("totalReviews", rs.getInt("totalReviews")); 
					request.setAttribute("averageRating", Math.round(rs.getDouble("averageRating") * 100.0) / 100.0);
				}
					
				} catch (ClassNotFoundException | SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					
				}
			if(ReviewList.size() == 0) {
				System.out.println("here");
	
				request.getRequestDispatcher("/error.jsp").forward(request,response);
			}
			else {
				request.setAttribute("ReviewList", ReviewList); 
				request.getRequestDispatcher("/Reviews.jsp").forward(request,response);
			}
    	}
		
	}
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doGet(request, response); 
    }


}
