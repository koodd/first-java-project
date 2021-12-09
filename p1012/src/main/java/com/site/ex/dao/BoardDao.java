package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.ex.dto.BoardDto;

public class BoardDao {

	private Context context=null;  // context에서 context객체 가져오는 오브젝트
	private DataSource ds=null;    // DataSource연결 오브젝트
	private Connection conn=null;  // db연결 오브젝트
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private int result=0;          // 결과값을 리턴하는 변수
	private String sql="";
	private ArrayList<BoardDto> list=null;
	private BoardDto bDto=null;
	private int bid,bhit,bgroup,bstep,bindent;
	private String bname,btitle,bcontent,bupload;
	private Timestamp bdate;
	
	
	//게시글 삭제 - delete
	public void deleteBoard(int ch_bid) {
		try {
			conn = getConnection();
			sql="delete from board where bid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ch_bid);
			pstmt.executeUpdate();
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
	}//deleteBoard
	
	//게시글 수정-update
	public void updateBoardModify(int ch_bid, String ch_btitle, String ch_bcontent) {
		try {
			conn = getConnection();
			sql="update board set btitle=?,bcontent=?,bdate=sysdate where bid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_btitle);
			pstmt.setString(2, ch_bcontent);
			pstmt.setInt(3, ch_bid);
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
	}//updateBoardModify
	
	
	//답변글 부모글 bstep보다 큰것은 bstep 1씩증가
	public void updateBoardStepUp(int ch_bgroup,int ch_bstep) {
		try {
			conn = getConnection();
			sql="update board set bstep=bstep+1 "
					+ "where bgroup=? and bstep>?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ch_bgroup);
			pstmt.setInt(2, ch_bstep);
			pstmt.executeUpdate();
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
	}//updateBoardStepUp
	
	
	//답변글 저장-insert
	public void insertBoardReply(int ch_bid, String ch_bname, String ch_btitle, String ch_bcontent, int ch_bgroup, int ch_bstep,
			int ch_bindent) {
		try {
			conn = getConnection();
			sql="insert into board values(b_seq.nextval,"
					+ "?,?,?,sysdate,0,?,?,?,'1.jpg')";
			//      + "?,?,?,sysdate,0,b_seq.currval,0,0,'1.jpg')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_bname);
			pstmt.setString(2, ch_btitle);
			pstmt.setString(3, ch_bcontent);
			pstmt.setInt(4, ch_bgroup);
			pstmt.setInt(5, ch_bstep+1); //bstep=bstep+1
			pstmt.setInt(6, ch_bindent+1); //bindent=bindent+1
			pstmt.executeUpdate();
			
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
	}//insertBoardReply
	
	
	//게시글 저장-insert
	public void insertBoardWrite(String ch_bname, String ch_btitle, String ch_bcontent) {

		System.out.println("dao : "+ch_bname);
		try {
			conn = getConnection();
			sql="insert into board values(b_seq.nextval,"
					+ "?,?,?,sysdate,0,b_seq.currval,0,0,'1.jpg')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_bname);
			pstmt.setString(2, ch_btitle);
			pstmt.setString(3, ch_bcontent);
			pstmt.executeUpdate();
			
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
	}//insertBoardWrite
	
	
	// bid 게시글 조회수 1증가
	public void updateBhit(int ch_bid) {
		try {
			conn = getConnection();
			sql="update board set bhit=bhit+1 where bid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ch_bid);
			pstmt.executeUpdate();
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
	}//updateBhit
	
	// 1개 게시글 가져오기
	public BoardDto selectBoardView(int ch_bid,int checkView) {
		try {
			conn = getConnection();
			switch (checkView) {
			case 1: //view 1번, 다음글 2번, 이전글 3번
				sql="select * from board where bid=?";
				break;
			case 2: //다음글
				sql="select * from (select rownum rnum,b.* from\r\n"
						+ "(select * from board order by bgroup desc,bstep asc) b)\r\n"
						+ "where rnum=\r\n"
						+ "(select rnum from (select rownum rnum,b.* from\r\n"
						+ "(select * from board order by bgroup desc,bstep asc) b)\r\n"
						+ "where bid=?)-1";
				break;
			case 3: //이전글
				sql="select * from (select rownum rnum,b.* from\r\n"
						+ "(select * from board order by bgroup desc,bstep asc) b)\r\n"
						+ "where rnum=\r\n"
						+ "(select rnum from (select rownum rnum,b.* from\r\n"
						+ "(select * from board order by bgroup desc,bstep asc) b)\r\n"
						+ "where bid=?)+1";
				break;
			}//switch
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ch_bid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bid = rs.getInt("bid");
				bname = rs.getString("bname");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				bdate = rs.getTimestamp("bdate");
				bhit = rs.getInt("bhit");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bupload = rs.getString("bupload");
				bDto = new BoardDto(bid,bname,btitle,bcontent,bdate,bhit,bgroup,bstep,bindent,bupload);
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
		return bDto;
	}//selectBoardView
	
	//게시글 전체 개수 메소드-select
	public int selectBoardCount(String category, String searchWord) {
		int listCount=0;
		try {
			//connection객체 가져오기
			conn = getConnection();
			
			switch (category) {
			case "":
				sql = "select count(*) from board";
				pstmt = conn.prepareStatement(sql);
				break;
			case "all":
				sql = "select count(*) from board where btitle like ? or bcontent like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				pstmt.setString(2, "%"+searchWord+"%");
				break;
			case "title":
				sql = "select count(*) from board where btitle like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				break;
			case "content":
				sql = "select count(*) from board where bcontent like ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");
				break;
			}
			// board의 모든 정보를 가져옴.
			rs = pstmt.executeQuery();
			if(rs.next()) {
				listCount = rs.getInt(1);
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
		return listCount;
	}//selectBoardCount
	
	//전체 게시글 가져오기
	public ArrayList<BoardDto> selectBoardList(int startrow, int endrow, String category, String searchWord){
		list = new ArrayList<BoardDto>();
		
		try {
			//connection객체 가져오기
			conn = getConnection();
			System.out.println("Dao category : "+category);
			//category가 "",all,title,content
			switch (category) {
			case "": //게시판메뉴,하단넘버링으로 넘어왔을때
				sql = "select * from"
						+ "(select rownum as rnum,b.* from (select * from board order by bgroup desc,bstep asc) b)"
						+ "where rnum>=? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, startrow);
				pstmt.setInt(2, endrow);
				break;
			case "all":
				sql = "select * from"
						+ "(select rownum as rnum,b.* from (select * from board where btitle like ? or bcontent like ? order by bgroup desc,bstep asc) b)"
						+ "where rnum>=? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");  //'%사진%'
				pstmt.setString(2, "%"+searchWord+"%");  //'%사진%'
				pstmt.setInt(3, startrow);
				pstmt.setInt(4, endrow);
			    break;
			case "title":
				sql = "select * from"
						+ "(select rownum as rnum,b.* from (select * from board where btitle like ? order by bgroup desc,bstep asc) b)"
						+ "where rnum>=? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");  //'%사진%'
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				break;
			case "content":
				sql = "select * from"
						+ "(select rownum as rnum,b.* from (select * from board where bcontent like ? order by bgroup desc,bstep asc) b)"
						+ "where rnum>=? and rnum<=?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%"+searchWord+"%");  //'%사진%'
				pstmt.setInt(2, startrow);
				pstmt.setInt(3, endrow);
				break;
			}
			
			// board의 모든 정보를 가져옴.
			rs = pstmt.executeQuery();
			while(rs.next()) {
				bid = rs.getInt("bid");
				bname = rs.getString("bname");
				btitle = rs.getString("btitle");
				bcontent = rs.getString("bcontent");
				bdate = rs.getTimestamp("bdate");
				bhit = rs.getInt("bhit");
				bgroup = rs.getInt("bgroup");
				bstep = rs.getInt("bstep");
				bindent = rs.getInt("bindent");
				bupload = rs.getString("bupload");
				//ArrayList에 추가
				list.add(new BoardDto(bid,bname,btitle,bcontent,bdate,bhit,bgroup,bstep,bindent,bupload));
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
