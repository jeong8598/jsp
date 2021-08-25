package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import board.dto.BoardDto;

public class DB_Conn {
	//Class.forName("com.mysql.jdbc.Driver");	//기능은 무조건 메서드안에=>생성자로
	String db="jdbc:mysql://localhost:3306/pkc"; 
	String userid="root";
    String pw="1234";
    //Connection conn=DriverManager.getConnection(db,userid,pw);	//기능은 무조건 메서드안에=>생성자로
    Connection conn=null;	//전역변수=>객체가 생성되어야 사용가능
	
    public DB_Conn() throws ClassNotFoundException, SQLException{
    	Class.forName("com.mysql.jdbc.Driver");
    	conn=DriverManager.getConnection(db,userid,pw);
    }
    public void conn_close() throws SQLException
    {
    	conn.close();
    }
	public void insert(BoardDto bdto) throws Exception{

		//쿼리생성
		String sql = "insert into board(title,name,content,pwd,writeday) ";
		sql=sql+"values (?,?,?,?,now())";
		
		//심부름꾼
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		
		pstmt.executeUpdate();
		conn.close();
		
	}
	
	public ArrayList<BoardDto> list() throws ClassNotFoundException, SQLException {    
		//
		String sql = "select * from board order by id desc";
		
		//심부름꾼
		Statement stmt = conn.createStatement();
		//실행
		ResultSet rs = stmt.executeQuery(sql);
		//return rs;
		
		//BoardDto를 여러개 담을 수 있는 ArrayList생성
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		//BoardDto를 하나만들고 하나의 레코드를 전달(rs)
		while(rs.next()) {
			BoardDto bdto = new BoardDto();
			bdto.setId(rs.getInt("id"));
			bdto.setName(rs.getString("name")); 
			bdto.setTitle(rs.getString("title"));
			bdto.setReadnum(rs.getInt("readnum"));
			bdto.setWriteday(rs.getString("writeday"));
			
			list.add(bdto);
		}
		//ArrayLIst객체를 넘김
		return list;
	}
	
	public BoardDto content(String id) throws ClassNotFoundException, SQLException {
		//쿼리생성
		String sql = "select * from board where id="+id;
		
		//심부름꾼 생성
		Statement stmt = conn.createStatement();
		
		//쿼리실행
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		BoardDto bdto = new BoardDto();
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		
		return bdto;
	}
	public BoardDto update(String id) throws ClassNotFoundException, SQLException {

		//쿼리생성
	    String sql = "select * from board where id="+id;
		//심부름꾼
		Statement stmt = conn.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		rs.next();
		
		BoardDto bdto = new BoardDto();
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setContent(rs.getString("content"));
		bdto.setReadnum(rs.getInt("readnum"));
		bdto.setWriteday(rs.getString("writeday"));
		return bdto;
	}
	
    public void update_ok(BoardDto bdto) throws ClassNotFoundException, SQLException { 
    	// 쿼리 생성
    	String sql="update board set name=?, content=?, title=? where id=?";
    	// 심부름꾼 실행 => ResultSet
    	PreparedStatement pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, bdto.getName());
    	pstmt.setString(2, bdto.getContent());
    	pstmt.setString(3, bdto.getTitle());
    	pstmt.setInt(4, bdto.getId());
    	
    	pstmt.executeUpdate();
    	
    }
	public void delete(String id) throws ClassNotFoundException, SQLException {
        //쿼리생성
        String sql = "delete from board where id="+id;
        
        //심부름꾼 생성
        Statement stmt = conn.createStatement();
        
        stmt.executeUpdate(sql);
        
	}
}
