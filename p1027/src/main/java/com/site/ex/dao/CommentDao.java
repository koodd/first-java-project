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

	// 전체 게시글 가져오기
	public ArrayList<CommentDto> selectCboardList(int user_bid) {
		list = new ArrayList<CommentDto>();

		try {
			// connection객체 가져오기
			conn = getConnection();
			sql="select * from cboard where bid=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, user_bid);
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
