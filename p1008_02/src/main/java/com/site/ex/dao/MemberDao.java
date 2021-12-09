package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import com.site.ex.dto.MemberDto;

public class MemberDao {
	//Context.xml 객체 가져오기
	private Context context=null;
	//커넥션 풀 객체 가져오기-sql구동
	private DataSource ds=null;
	// 커넥션 객체 가져오기-sql연결
	private Connection conn=null;
	// sql구문 객체 가져오기
	private PreparedStatement pstmt=null;
	// sql실행후 데이터 객체 가져오기
	private ResultSet rs=null;
	//insert,update,delete 후 처리결과 리턴 ( 1-성공, 0-실패 )
	private int result=0;
	//sql구문
	private String sql="";
	//데이터 받아오기
	private ArrayList<MemberDto> list=null;
	private MemberDto mDto=null;
	//MemberDto 변수 선언
	private String id,pw,name,email,hobby;
	
	//login 메소드 - 1개의 데이터 가져옴
	public MemberDto selectMemberLogin(String userid,String userpw) {
		//mDto = new MemberDto();
		try {
			conn = getConnection();
			sql="select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			rs = pstmt.executeQuery();
			//데이터가 없을때 mDto의 값은? null
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
	}//selectMemberLogin
	
	
	//Connection 객체 가져오기
	public Connection getConnection() {
		try {
			context = new InitialContext();
			ds = (DataSource) context.lookup("java:comp/env/jdbc/Oracle11g");
			conn = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}//getConnection

}
