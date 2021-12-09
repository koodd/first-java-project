package com.site.ex.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import com.site.ex.dto.MemberDto;

public class MemberDao {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	private String sql;
	private String id, pw, name, email, hobby;
	private MemberDto mDto;
	int result;
	ArrayList<MemberDto> list=null;
	
	// 회원 전체리스트 메소드
	public ArrayList<MemberDto> memberList() {
		// 리턴 데이터
		list = new ArrayList<MemberDto>();

		try {
			conn = getConnection();
			sql = "select * from member";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				hobby = rs.getString("hobby");
				// MemberDto mDto = new MemberDto(id,pw,name,email,hobby);
				list.add(new MemberDto(id, pw, name, email, hobby));
			}
		} catch (Exception e) {	e.printStackTrace();
		} finally {
			try {
				if (rs != null)	rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) { e2.printStackTrace();}
		}
		return list;
	}// memberList
	
	//member1명 정보검색
	public MemberDto selectMember(String chkid) {
		mDto=null;
		
		try {
			conn = getConnection();
			sql = "select * from member where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chkid);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				id = rs.getString("id");
				pw = rs.getString("pw");
				name = rs.getString("name");
				email = rs.getString("email");
				hobby = rs.getString("hobby");
				mDto = new MemberDto(id,pw,name,email,hobby);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return mDto;
	}//selectMember
	
	// 회원가입
	public int insertMember(MemberDto mDto) {
		result = 0;
		try {
			conn = getConnection();
			sql = "insert into member values(?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mDto.getId());
			pstmt.setString(2, mDto.getPw());
			pstmt.setString(3, mDto.getName());
			pstmt.setString(4, mDto.getEmail());
			pstmt.setString(5, mDto.getHobby());
			//insert,update,delete -> executeUpdate, select -> executeQuery
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//insertMember

	//회원정보수정
	public int updateMember(MemberDto chkDto) {
		result=0;
		try {
			conn = getConnection();
			sql = "update member set name=?,email=?,hobby=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chkDto.getName());
			pstmt.setString(2, chkDto.getEmail());
			pstmt.setString(3, chkDto.getHobby());
			pstmt.setString(4, chkDto.getId());
			//insert,update,delete -> executeUpdate, select -> executeQuery
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//updateMember
	
	//비밀번호수정 - updateMember2
	public int updateMember2(MemberDto chkDto) {
		result=0;
		try {
			conn = getConnection();
			sql = "update member set pw=? where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, chkDto.getPw());
			pstmt.setString(2, chkDto.getId());
			//insert,update,delete -> executeUpdate, select -> executeQuery
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return result;
	}//updateMember2
	

	// login메소드 -> id,pw
	public int login(String id, String pw) {
		result = 0; // 1 -> 성공,0 -> 아이디불일치,-1 -> 패스워드 불일치
		sql = "select * from member where id=?";

		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 데이터가 있으면(id가 존재하면)
				// 비밀번호 값 가져오기
				String chkPw = rs.getString("pw");
				if (chkPw.equals(pw)) {
					// pw가 일치하면
					result = 1;
				} else {
					// pw가 불일치하면
					result = -1;
				}
			} else {
				// 데이터가 없으면(id가 존재하지 않으면) - 0번 리턴
				result = 0;
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
		return result;
	}

	// Connection을 리턴하는 메소드
	public Connection getConnection() {
		Context context = null;
		DataSource ds = null;
		Connection conn = null;
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
