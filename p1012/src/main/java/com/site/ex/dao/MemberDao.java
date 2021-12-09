package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.ex.dto.BoardDto;
import com.site.ex.dto.MemberDto;

public class MemberDao {

	private Context context=null;  // context에서 context객체 가져오는 오브젝트
	private DataSource ds=null;    // DataSource연결 오브젝트
	private Connection conn=null;  // db연결 오브젝트
	private PreparedStatement pstmt=null;
	private ResultSet rs=null;
	private int result=0;          // 결과값을 리턴하는 변수
	private String sql="";
	private ArrayList<MemberDto> list=null;
	private MemberDto mDto=null;
	private String id,pw,name,email,hobby;
	
	//전체 회원리스트 가져오기 메소드-select
	public ArrayList<MemberDto> selectMemberList() {
		list = new ArrayList<MemberDto>();
		try {
			conn = getConnection();
			sql="select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				hobby = rs.getString("hobby");
				list.add(new MemberDto(id,pw,name,email,hobby));
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
	}//selectMemberList
	
	
	//member 저장 메소드-insert
	public void insertMember(MemberDto ch_mDto) {
		try {
			conn = getConnection();
			sql="insert into member values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_mDto.getId());
			pstmt.setString(2, ch_mDto.getPw());
			pstmt.setString(3, ch_mDto.getName());
			pstmt.setString(4, ch_mDto.getEmail());
			pstmt.setString(5, ch_mDto.getHobby());
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
	}//insertMember
	
	//login 메소드
	public MemberDto selectLogin(String ch_id, String ch_pw) {
		try {
			conn = getConnection();
			sql="select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ch_id);
			pstmt.setString(2, ch_pw);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				hobby = rs.getString("hobby");
				mDto = new MemberDto(id,pw,name,email,hobby);
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
		return mDto;
	}//selectLogin
	
	
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
