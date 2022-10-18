package net.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.utility.DBClose;
import net.utility.DBOpen;

public class MemberDAO {//Data Access Object
						//DB 접근 객체
	
	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public MemberDAO() {
		dbopen=new DBOpen();
	}//end

	
	//비지니스 로직 구현
	public String loginProc(MemberDTO dto) {
		String mlevel=null;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT mlevel ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? AND passwd=? ");
			sql.append(" AND mlevel IN('A1', 'B1', 'C1', 'D1') ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPasswd());
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				mlevel=rs.getString("mlevel");
				System.out.println("로그인 성공");
			}else {
				mlevel=null;
				System.out.println("자료없음!");
			}//if end			
		}catch (Exception e) {
			System.out.println("로그인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return mlevel;
	}//loginProc() end
	
	
	public int duplecateID(String id) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(id) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE id=? ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				cnt=rs.getInt("cnt");
			}else {
				cnt=0;
				System.out.println("sql조회 실패 결과 0행");
			}//if end			
		}catch (Exception e) {
			System.out.println("아이디 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//duplecateID() end
	
	
	public int duplecateEmail(String email) {
		int cnt=0;
		try {
			con=dbopen.getConnection();
			
			sql=new StringBuilder();
			sql.append(" SELECT count(email) AS cnt ");
			sql.append(" FROM member ");
			sql.append(" WHERE email=? ");
						
			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, email);
			
			rs=pstmt.executeQuery();//select문 실행
			if(rs.next()) {//커서가 있으면
				cnt=rs.getInt("cnt");
			}else {
				cnt=0;
				System.out.println("sql조회 실패 결과 0행");
			}//if end			
		}catch (Exception e) {
			System.out.println("이메일 중복 확인 실패 : " + e);
		}finally {
			DBClose.close(con, pstmt, rs);
		}//end
		return cnt;
	}//duplecateEmail() end
	
	
	public int create(MemberDTO dto) {
		int cnt=0;
		
		return cnt;
	}//create() end
	
}//class end
