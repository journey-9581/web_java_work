package test.users.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import test.users.dto.UsersDto;
import test.util.DbcpBean;

public class UsersDao {
	//static 필드
	private static UsersDao dao;
	//생성자
	private UsersDao() {
		
		}
	//Dao의 참조값을 리턴해주는 static 메소드
	public static UsersDao getInstance() {
		if(dao==null) {
			dao=new UsersDao();
		}
		return dao;
	}
	//인자로 전달된 정보가 유효한 정보인지 여부를 리턴하는 메소드
		public boolean isValid(UsersDto dto) {
			//아이디 비밀번호가 유효한 정보인지 여부를 담을 지역변수 만들고 초기값 부여
			boolean isValid=false;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = new DbcpBean().getConn();
				//select문 작성
				String sql = "SELECT id FROM users"
						+ " WHERE id=? AND pwd=?";
				pstmt = conn.prepareStatement(sql);
				//?에 바인딩 할게 있으면 여기서 바인딩한다
				pstmt.setString(1, dto.getId());
				pstmt.setString(2, dto.getPwd());
				//select문 수행하고 ResultSet 받아오기
				rs = pstmt.executeQuery();
				//while문 혹은 if문에서 ResultSet으로부터 data 추출
				if (rs.next()) {//만일 select 된 row가 있다면
					//유효한 정보임으로 isValid에 true를 대입한다
					isValid=true;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			//아이디가 유효한지 여부를 리턴해준다
			return isValid;
		}
		
	//회원 정보를 저장하는 메소드
	public boolean insert(UsersDto dto) {
		Connection conn=null;
		PreparedStatement pstmt=null;
		int flag=0;
		try {
			conn=new DbcpBean().getConn();
			//실행할 insert, update, delete문 구성
			String sql="INSERT INTO users"
					+ " (id, pwd, email, regdate)"
					+ " VALUES(?, ?, ?, SYSDATE)";
			pstmt=conn.prepareStatement(sql);
			//?에 바인딩 할 내용이 있으면 바인딩한다
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPwd());
			pstmt.setString(3, dto.getEmail());
			flag=pstmt.executeUpdate(); //sql문 실행하고 변화된 row 갯수 리턴 받기
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(flag>0) {
			return true;
		}else {
			return false;
		}
	}
}
