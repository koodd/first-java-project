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
