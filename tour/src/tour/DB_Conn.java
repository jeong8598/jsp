 package tour;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import tour.dto.fileDTO;

public class DB_Conn {
	String db = "jdbc:mysql://localhost:3306/mydb";
	String userid = "root";
	String pw = "1234";
	String sql = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	public DB_Conn() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(db, userid, pw);
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int writeReview(fileDTO fdto) {
		sql = "insert into tfile(fileName,fileRealName) values(?,?)"; 
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, fdto.getFileName());
			pstmt.setString(2, fdto.getFileRealName());
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return -1;
	}
}
