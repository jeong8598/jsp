package paging;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import paging.dto.BoardDTO;

public class DB_Conn {
	
	//Class.forName("com.mysql.jdbc.Driver"); // 기능은 무조건 메소드내에서 실행
	String db = "jdbc:mysql://localhost:3306/mydb";
	String userid = "root";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	Statement stmt = null;
	ResultSet rs = null;
	ArrayList<BoardDTO> list = null;
	BoardDTO bdto = null;
	
	public DB_Conn() throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		conn = DriverManager.getConnection(db,userid,pw);
	}
	public void conn_close() throws SQLException {
		conn.close();
	}
	//글 저장
	public void insert(BoardDTO bdto) throws Exception {
		//쿼리생성
		String sql = "insert into board(title,name,content,pwd,writeday)";
		sql += " values(?,?,?,?,now())";
		//심부름꾼
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getTitle());
		pstmt.setString(2, bdto.getName());
		pstmt.setString(3, bdto.getContent());
		pstmt.setString(4, bdto.getPwd());
		
		pstmt.executeUpdate();
	}
	//전체 레코드 수
	public int all_record() throws SQLException{
		String sql = "select * from board";
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.last();
		return rs.getRow();
	}
	//게시물 리스트
	public ArrayList<BoardDTO> list(int pager) throws SQLException{
		//page 관련
		int index = 0;
		index = (pager-1)*10;
		//쿼리생성
		String sql = "select * from board order by id desc limit "+ index +",10";
		//심부름꾼 생성
		stmt = conn.createStatement();
		//쿼리실행
		rs=stmt.executeQuery(sql);
		//BoardDTO 여러개 담을 수 있는  ArrayList생성
		list = new ArrayList<BoardDTO>();
		//ArrayList객체를 넘김
		//BoardDTO 하나를 생성하여 하나의 레코드를 전달 (rs)
		while(rs.next()){
			bdto = new BoardDTO();
			bdto.setId(rs.getInt("id"));
			bdto.setTitle(rs.getString("title"));
			bdto.setName(rs.getString("name"));
			bdto.setPwd(rs.getString("pwd"));
			bdto.setContent(rs.getString("content"));
			bdto.setWriteday(rs.getString("writeday"));
			bdto.setReadnum(rs.getInt("readnum"));
			
			list.add(bdto);
		}
		return list;
	}
	//게시글보기
	public BoardDTO get_content(String id) throws SQLException {
		udt_readnum(id);
		
		String sql = "select * from board where id=" + id;
		stmt = conn.createStatement();
		rs = stmt.executeQuery(sql);
		rs.next();
		
		bdto = new BoardDTO();
		
		bdto.setId(rs.getInt("id"));
		bdto.setTitle(rs.getString("title"));
		bdto.setName(rs.getString("name"));
		bdto.setPwd(rs.getString("pwd"));
		bdto.setContent(rs.getString("content"));
		bdto.setWriteday(rs.getString("writeday"));
		bdto.setReadnum(rs.getInt("readnum"));
		
		conn_close();
		return bdto;
	}
	//조회수 증가
	public void udt_readnum(String id) throws SQLException{
		String sql = "update board set readnum=readnum+1 where id="+id;
		
		stmt = conn.createStatement();
		stmt.executeUpdate(sql);
	}
	//글 수정
	public void update_ok(BoardDTO bdto) throws SQLException {
		String sql = "update board set name=?, content=?, title=? where id=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, bdto.getName());
		pstmt.setString(2, bdto.getContent());
		pstmt.setString(3, bdto.getTitle());
		pstmt.setInt(4, bdto.getId());
		
		pstmt.executeUpdate();
		
		conn_close();
	}
	//글 삭제
	public void delete_ok(String id) throws SQLException {
		String sql = "delete from board where id="+id;
		stmt = conn.createStatement();
		
		stmt.executeUpdate(sql);
		conn.close();
	}
	//비밀번호 확인
	public int chk_pwd(String id,String pwd) throws SQLException {
		String sql = "select count(*) cnt from board where id=? and pwd=?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		
		rs = pstmt.executeQuery();
		rs.next();
		int cnt = rs.getInt("cnt");
		
		return cnt;
	}
}