package JDBC;

import java.sql.*;
public class Connection {
	public java.sql.Connection con=null;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	
	public Connection() {
		  try{
				 String jdbcUrl = "jdbc:mysql://localhost:3306/JSPBookDB";
			     String dbId = "jw";
			     String dbPass = "ta3844";
			     
				 Class.forName("com.mysql.jdbc.Driver");
				 con = DriverManager.getConnection(jdbcUrl,dbId ,dbPass );
			  }catch(Exception e){ 
				 e.printStackTrace();
			  }	
	}
	
	 public void close() { 
	        try {            
	            if (rs != null) rs.close(); 
	            if (stmt != null) stmt.close();
	            if (psmt != null) psmt.close();
	            if (con != null) con.close(); 

	            System.out.println("JDBC �옄�썝 �빐�젣");
	        }
	        catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	
}
