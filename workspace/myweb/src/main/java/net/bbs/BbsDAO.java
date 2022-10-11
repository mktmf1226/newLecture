package net.bbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import net.bbs.BbsDTO;
import net.utility.DBClose;
import net.utility.DBOpen;

public class BbsDAO {

	private DBOpen dbopen=null;
	private Connection con=null;
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private StringBuilder sql=null;
	
	//dbopen 객체생성
	public BbsDAO() {
		dbopen=new DBOpen();
	}//end
	
	//행추가 메소드
	public int create(BbsDTO dto) {
		int cnt=0; //성공 또는 실패 여부 변환
		try {
			con=dbopen.getConnection(); //DB연결
			
			sql=new StringBuilder();
			sql.append(" INSERT INTO tb_bbs(bbsno, wname, subject, content, passwd, ip, grpno) ");
			sql.append(" VALUES (bbs_seq.nextval, ?, ?, ?, ?, ?, (select nvl(max(bbsno),0)+1 from tb_bbs)) ");

			pstmt=con.prepareStatement(sql.toString());
			pstmt.setString(1, dto.getWname()); 	// 1 -> 첫번째 물음표, wname칼럼
			pstmt.setString(2, dto.getSubject()); 	// 2 -> 두번째 물음표, subject칼럼
			pstmt.setString(3, dto.getContent()); 	// 3 -> 세번째 물음표, content칼럼
			pstmt.setString(4, dto.getPasswd()); 	// 4 -> 네번째 물음표, passwd칼럼
			pstmt.setString(5, dto.getIp()); 		// 5 -> 다섯번째 물음표, ip칼럼
			
			cnt=pstmt.executeUpdate();
			
		}catch (Exception e) {
			System.out.println("행추가 실패:" + e);
		}finally {
			DBClose.close(con, pstmt);
		}//end
		return cnt;
	}//create() end	
	
	
	
	
	
	
	
	
	
	
	
}//class end
