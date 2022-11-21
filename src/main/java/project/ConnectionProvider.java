package project;
import java.sql.*;
public class ConnectionProvider {
	
	public static  Connection getCon() {
			
			Connection con;
			try {
				
		    	Class.forName("com.mysql.cj.jdbc.Driver");
		    	String url = "jdbc:mysql://localhost/onlineshop";
		    	String user = "root";
		    	String pw = "pass";
		    	con = DriverManager.getConnection(url, user, pw);
		    	return con;
		    }
		    catch(ClassNotFoundException e) {
		    	e.printStackTrace();
		    	return null;
		    }
		    catch(SQLException e) {
		    	e.printStackTrace();
		    	return null;
		    }
		}
	}
