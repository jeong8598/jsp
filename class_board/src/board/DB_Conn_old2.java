package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DB_Conn_old2 {
	
	public Connection connection() throws Exception{
		Class.forName("com.mysql.jdbc.Driver");
	    String db="jdbc:mysql://localhost:3306/pkc";
	    String userid="root";
	    String pw="1234";
	    Connection conn=DriverManager.getConnection(db,userid,pw);
		
		return conn;
	}
	
}
