package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import com.site.ex.dto.EventDto;

public class EventDao {

	private Context context=null;  // context에서 context객체 가져오는 오브젝트
	private DataSource ds=null;    // DataSource연결 오브젝트
	private Connection conn=null;  // db연결 오브젝트
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private int result=0;          // 결과값을 리턴하는 변수
	private String sql="";
	private ArrayList<EventDto> list=null;
	private EventDto eDto=null;
	private int eid;
	private String id,etitle,econtent,estate,efilename,efilename2;
	private Timestamp edate,startdate,enddate;

	//이벤트 1개 eDto 가져오기 메소드 - 1.해당글 2.다음글 3.이전글
	public EventDto selectEventView(int ch_eid, int checkView) {
		try {
			conn = getConnection();
			switch (checkView) {
			case 1: //1.해당이벤트게시글 2.다음글 3.이전글 
				// event의 모든 정보를 가져옴.
				sql="select * from event where eid=?";
				break;
			case 2:
				// 다음글
				sql="select * from event where eid = (\r\n"
						+ "(select min(eid) FROM event where estate not in('진행예정') and eid > ?))";
				break;
			case 3:
				// 이전글
				sql="select * from event where eid=(\r\n"
						+ "(select max(eid) from event  where estate not in('진행예정') and eid<?))";
				break;
			}
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ch_eid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eid = rs.getInt("eid");
				id = rs.getString("id");
				etitle = rs.getString("etitle");
				econtent = rs.getString("econtent");
				edate = rs.getTimestamp("edate");
				startdate = rs.getTimestamp("startdate");
				enddate = rs.getTimestamp("enddate");
				estate = rs.getString("estate");
				efilename = rs.getString("efilename");
				efilename2 = rs.getString("efilename2");
				eDto = new EventDto(eid, id, etitle, econtent, edate, startdate, enddate, estate, efilename, efilename2);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return eDto;
	}//selectEventView
	
	
	//이벤트 리스트 가져오기 메소드 - select
	public ArrayList<EventDto> selectEventList() {
		list = new ArrayList<EventDto>();
		try {
			conn = getConnection();
			// board의 모든 정보를 가져옴.
			sql="select * from event";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eid = rs.getInt("eid");
				id = rs.getString("id");
				etitle = rs.getString("etitle");
				econtent = rs.getString("econtent");
				edate = rs.getTimestamp("edate");
				startdate = rs.getTimestamp("startdate");
				enddate = rs.getTimestamp("enddate");
				estate = rs.getString("estate");
				efilename = rs.getString("efilename");
				efilename2 = rs.getString("efilename2");
				list.add(new EventDto(eid, id, etitle, econtent, edate, startdate, enddate, estate, efilename, efilename2));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}//selectEventList
	
	//이벤트 업데이트 메소드 - update
	public int updateEvent(EventDto ch_eDto) {
		try {
			//connection객체 가져오기
			conn = getConnection();
			// board의 모든 정보를 가져옴.
			sql="update event set etitle=?,econtent=?,edate=sysdate,\r\n"
					+ "startdate=?,enddate=?,estate=?,\r\n"
					+ "efilename=?,efilename2=? where eid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_eDto.getEtitle());
			System.out.println("dao etitle : "+ch_eDto.getEtitle());
			pstmt.setString(2, ch_eDto.getEcontent());
			pstmt.setTimestamp(3, ch_eDto.getStartdate());
			pstmt.setTimestamp(4, ch_eDto.getEnddate());
			pstmt.setString(5, ch_eDto.getEstate());
			pstmt.setString(6, ch_eDto.getEfilename());
			pstmt.setString(7, ch_eDto.getEfilename2());
			pstmt.setInt(8, ch_eDto.getEid());
			// 성공 1, 실패 0으로 리턴됨.
			result = pstmt.executeUpdate();
			System.out.println("result : "+result);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}
	
	
	//이벤트 쓰기 메소드
	public int insertEventWrite(EventDto ch_eDto) {
		try {
			//connection객체 가져오기
			conn = getConnection();
			// board의 모든 정보를 가져옴.
			sql="insert into event values(\r\n"
					+ "event_seq.nextval,?,?,?,sysdate,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_eDto.getId());
			pstmt.setString(2, ch_eDto.getEtitle());
			pstmt.setString(3, ch_eDto.getEcontent());
			pstmt.setTimestamp(4, ch_eDto.getStartdate());
			pstmt.setTimestamp(5, ch_eDto.getEnddate());
			pstmt.setString(6, ch_eDto.getEstate());
			pstmt.setString(7, ch_eDto.getEfilename());
			pstmt.setString(8, ch_eDto.getEfilename2());
			// 성공 1, 실패 0으로 리턴됨.
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return result;
	}//insertEventWrite
	
	//전체 게시글 가져오기
	public ArrayList<EventDto> selectBoardList(){
		list = new ArrayList<EventDto>();
		
		try {
			//connection객체 가져오기
			conn = getConnection();
			// board의 모든 정보를 가져옴.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				eid = rs.getInt("eid");
				id = rs.getString("id");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}//selectBoardList
	
	//-------------------------------------------
	// 커넥션 객체 1개 가져오기
	public Connection getConnection() {
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}// getConnection


	


	

	


	
}
