package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.ex.dto.CommentDto;

public class CommentDao {

	private Context context = null; // context에서 context객체 가져오는 오브젝트
	private DataSource ds = null; // DataSource연결 오브젝트
	private Connection conn = null; // db연결 오브젝트
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private int result = 0; // 결과값을 리턴하는 변수
	private String sql = "";
	private ArrayList<CommentDto> list = null;
	private CommentDto cDto = null;
	private int cno;
	private int bid;
	private String id;
	private String cpw;
	private String ccontent;
	private Timestamp cdate;

	// 댓글삭제
	public int DeleteCboard(int u_cno) {
		result=0;
		try {
			// connection객체 가져오기
			conn = getConnection();
			
			//삭제
			sql="delete from cboard where cno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_cno);
			result = pstmt.executeUpdate();
			
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//DeleteCboard
	
	// 댓글수정
	public CommentDto updateCboard(int u_cno, String u_ccontent) {
		result=0;
		int resultCno=0;
		CommentDto cDto =null;
		System.out.println("");
		try {
			// connection객체 가져오기
			conn = getConnection();
			
			//수정하기
			sql="update cboard set ccontent=?,cdate=sysdate where cno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, u_ccontent);
			pstmt.setInt(2, u_cno);
			result = pstmt.executeUpdate();
			
			
			//댓글가져오기
			sql="select * from cboard where cno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_cno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cno = rs.getInt("cno");
				bid = rs.getInt("bid");
				id = rs.getString("id");
				cpw = rs.getString("cpw");
				ccontent = rs.getString("ccontent");
				cdate = rs.getTimestamp("cdate");
				// ArrayList에 추가
				cDto = new CommentDto(cno, bid, id, cpw, ccontent, cdate);
				System.out.println("1개가져오기 : "+bid);
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cDto;
	}//updateCboard
	
	
	// 댓글추가
	public CommentDto insertCboardWrite(int u_bid, String u_id, String u_cpw, String u_ccontent) {
		result=0;
		int resultCno=0;
		CommentDto cDto =null;
		try {
			// connection객체 가져오기
			conn = getConnection();
			
			//시퀀스 가져오기
			sql="select c_seq.nextval from dual";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				resultCno = rs.getInt(1);
			}
			System.out.println("시퀀스 번호 : "+resultCno);
			
			//댓글추가하기
			sql="insert into cboard values(?,?,?,?,?,sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resultCno);
			pstmt.setInt(2, u_bid);
			pstmt.setString(3, u_id);
			pstmt.setString(4, u_cpw);
			pstmt.setString(5, u_ccontent);
			result = pstmt.executeUpdate();
			System.out.println("결과 : "+result);
			
			//댓글가져오기
			sql="select * from cboard where cno=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, resultCno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				cno = rs.getInt("cno");
				bid = rs.getInt("bid");
				id = rs.getString("id");
				cpw = rs.getString("cpw");
				ccontent = rs.getString("ccontent");
				cdate = rs.getTimestamp("cdate");
				// ArrayList에 추가
				cDto = new CommentDto(cno, bid, id, cpw, ccontent, cdate);
				System.out.println("1개가져오기 : "+bid);
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cDto;
	}//insertCboardWrite
	
	// 전체 게시글 가져오기
	public ArrayList<CommentDto> selectCboardList(int u_bid) {
		list = new ArrayList<CommentDto>();

		try {
			// connection객체 가져오기
			conn = getConnection();
			sql="select * from cboard where bid=? order by cno desc";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, u_bid);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				cno = rs.getInt("cno");
				bid = rs.getInt("bid");
				id = rs.getString("id");
				cpw = rs.getString("cpw");
				ccontent = rs.getString("ccontent");
				cdate = rs.getTimestamp("cdate");
				// ArrayList에 추가
				list.add(new CommentDto(cno, bid, id, cpw, ccontent, cdate));
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
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}// selectBoardList

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


}//class
