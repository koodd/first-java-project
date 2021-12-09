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
	
	//회원전체 리스트 메소드  
	public ArrayList<MemberDto> selectMemberAll(){
		list = new ArrayList<MemberDto>();
		try {
			conn = getConnection();
			sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) { //rs.next():읽어올 데이터가 있는지 확인
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				hobby = rs.getString("hobby");
				System.out.println("id : "+id);
				list.add(new MemberDto(id, pw, name, email, hobby));
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
	}//selectMemberAll
	  
	  
	// 로그인 성공여부 확인메소드  데이터가 있을때(성공)->1, 데이터가 없을때->0
	public int loginChk(String id,String pw) {
		try {
			conn = getConnection();
			sql = "select * from member where id=? and pw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
			rs = pstmt.executeQuery();
			//데이터 확인
			if(rs.next()) {
				result = 1;
			}else {
				//일치하는 데이터가 없을때
				result = 0;
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
		return result;
	}//loginChk
	  
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
