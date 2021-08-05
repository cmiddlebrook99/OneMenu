package onemenu;

import java.sql.DriverManager;
import java.sql.SQLException;



import javax.servlet.http.HttpServletRequest;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.ResultSet;
import com.mysql.jdbc.Statement;

public class LoginDAO {
	String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	String DB_URL = "jdbc:mysql://localhost:3306/OneMenuDB";

	// Database credentials
	String USER = "root";
	String PASS = "";
	
	Connection conn = null;
	Statement stmt = null;
	
	public boolean authenticate(String email , String password, HttpServletRequest request){
		// TODO Auto-generated method stub
		try {
			Class.forName(JDBC_DRIVER);
			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = (Statement) conn.createStatement();
			
			String sql = "SELECT * FROM Users WHERE email=" + "'" + email + "'" 
						+ " AND password=" + "'" + password + "'" ;
			
			// STEP 5: Extract data from result set
			ResultSet rs = (ResultSet) stmt.executeQuery(sql);
			while (rs.next()) {				
				request.setAttribute("userID", rs.getString("userID"));
				return true  ; 
				//create table users(userID int not null auto_increment, email varchar(255) , password varchar(255), PRIMARY KEY(userID))
			    
			}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		return false ; 
		
	}

	public boolean UserAlreadyExists(String email){
		
		try {
			Class.forName(JDBC_DRIVER);
			// STEP 3: Open a connection
			System.out.println("Connecting to database...");
			conn = (Connection) DriverManager.getConnection(DB_URL, USER, PASS);
			// STEP 4: Execute a query
			System.out.println("Creating statement...");
			stmt = (Statement) conn.createStatement();
			
			String sql = "SELECT * FROM Users WHERE email=" + "'" + email + "'" ; 
			
			// STEP 5: Extract data from result set
			ResultSet rs = (ResultSet) stmt.executeQuery(sql);
			if (rs.next()) {				
				return true ; 
			    
			}
				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				
			}
		
		return false; 
	}
	
}
