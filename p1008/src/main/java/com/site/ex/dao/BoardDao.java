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

	//게시판 전체리스트 메소드
	public ArrayList<BoardDto> selectBoardAll(){
		list = new ArrayList<BoardDto>();
		System.out.println("selectBoardAll Dao호출");
		
		try {
			conn = getConnection();
			sql="select * from board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			//resultset에서 데이터 1개씩 가져오기
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
				//ArrayList에 BoardDto객체 담기
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
	}//selectBoardAll
	
	
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
	}//getConnection
	
	
	

}
