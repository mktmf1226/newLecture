package kr.co.itwill.mediagroup;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


//@Service    DB에 접근하는 모든 코드를 객체생성하여 모아둔다
//@Repository DB에 CRUD 작업에 집중하는 모델클래스로 지정. 스프링컨테이너가 자동으로 객체를 생성해 준다
@Repository
public class MediagroupDAO {

	//DBOpen dbopen=new DBOpen()와 동일한 형태
	//@Autowired 자동으로 만들어진 객체를 연결
	@Autowired
	private JdbcTemplate jt; 
	
	StringBuilder sql=null;
	
	public MediagroupDAO() {
		System.out.println("-----MediagroupDAO() 객체 생성됨");
	}//end

	
	//CRUD 비지니스 로직 구현
	
	public int create(MediagroupDTO dto) {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" INSERT INTO mediagroup(mediagroupno, title) ");
			sql.append(" VALUES( mediagroup_seq.nextval, ? ) ");
			cnt=jt.update(sql.toString(), dto.getTitle());			
		} catch (Exception e) {
			System.out.println("미디어그룹등록실패 : " + e);
		}//end
		return cnt;
	}//create() end
	
	public List<MediagroupDTO> list(){
		List<MediagroupDTO> list = null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT mediagroupno, title ");
			sql.append(" FROM mediagroup ");			
			sql.append(" ORDER BY mediagroupno DESC ");

			RowMapper<MediagroupDTO> rowMapper=new RowMapper<MediagroupDTO>() {
				@Override
				public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediagroupDTO dto=new MediagroupDTO();
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					dto.setTitle(rs.getString("title"));
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("미디어그룹목록실패 : " + e);
		}//end
		return list;
	}//list() end
	
	
	public int totalRowCount() {
		int cnt=0;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT COUNT(*) FROM mediagroup ");
			cnt=jt.queryForObject(sql.toString(), Integer.class);
		} catch (Exception e) {
			System.out.println("전체 행 갯수 : " + e);
		}//end
		return cnt;
	}//totalRowCount() end
	
	
	public List<MediagroupDTO> list2(int start, int end){//페이징
		List<MediagroupDTO> list = null;
		try {
			sql=new StringBuilder();
			sql.append(" SELECT AA.* ");
			sql.append(" FROM ( ");			
			sql.append(" 		SELECT ROWNUM as RNUM, BB.* ");		
			sql.append(" 		FROM ( ");	
			sql.append(" 				SELECT mediagroupno, title ");	
			sql.append(" 				FROM mediagroup ");			
			sql.append(" 				ORDER BY mediagroupno DESC ");			
			sql.append(" 			  ) BB ");			
			sql.append(" 	   ) AA ");			
			sql.append(" WHERE AA.RNUM >=" + start + " AND AA.RNUM<= " + end);

			RowMapper<MediagroupDTO> rowMapper=new RowMapper<MediagroupDTO>() {
				@Override
				public MediagroupDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
					MediagroupDTO dto=new MediagroupDTO();
					dto.setMediagroupno(rs.getInt("mediagroupno"));
					dto.setTitle(rs.getString("title"));
					return dto;
				}//mapRow() end
			};//rowMapper end
			
			list=jt.query(sql.toString(), rowMapper);
			
		} catch (Exception e) {
			System.out.println("미디어그룹페이징실패 : " + e);
		}//end
		return list;
	}//list2() end
	
	
	
}//class end
