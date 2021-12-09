package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.site.ex.dao.CommentDao;
import com.site.ex.dto.CommentDto;


@WebServlet("/ExJsonClass")
public class ExJsonClass extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 한글처리
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		
		System.out.println("event_view페이지에서 넘어온 값 : " + request.getParameter("bid"));
		int bid = Integer.parseInt(request.getParameter("bid"));
		CommentDao cDao = new CommentDao();
		ArrayList<CommentDto> list = cDao.selectCboardList(bid);
		//String arr="[{\"cNo\":1,\"bid\":1,\"id\":\"Goldenrod\",\"cPw\":1111,\"cContent\":\"댓글내용입니다2\",\"cDate\":\"5/10/2021\"}]";
		//list에 있는 데이터를 JSON {   } 클래스에 담기
		// { "cno":1,"bid":1,"id":"aaa","cpw":"1111","ccontent":"댓글","cdate":"2021-10-27"}
		JSONArray commentArray = new JSONArray();
		for(int i=0;i<list.size();i++) {
			JSONObject commentInfo = new JSONObject();
			System.out.println(list.get(i).getCno());
			commentInfo.put("cno", list.get(i).getCno());
			commentInfo.put("bid", list.get(i).getBid());
			commentInfo.put("id", list.get(i).getId());
			commentInfo.put("cpw", list.get(i).getCpw());
			commentInfo.put("ccontent", list.get(i).getCcontent());
			String cdate = ""+list.get(i).getCdate();
			commentInfo.put("cdate",cdate );
			//JSON배열에 넣기
			// [{ "cno":1,"bid":1,"id":"aaa","cpw":"1111","ccontent":"댓글","cdate":"2021-10-27"} ]
			commentArray.add(commentInfo);
		}
//		JSONObject commentInfo = new JSONObject();
//		System.out.println(1);
//		commentInfo.put("cno", 1);
//		commentInfo.put("bid", 1);
//		commentInfo.put("id", "aaa");
//		commentInfo.put("cpw", "1111");
//		commentInfo.put("ccontent", "내용");
//		commentInfo.put("cdate", 2021-10-27 11:12:23);
		//JSON배열에 넣기
		// [{ "cno":1,"bid":1,"id":"aaa","cpw":"1111","ccontent":"댓글","cdate":"2021-10-27"} ]
		//commentArray.add(commentInfo);
		//마지막으로 배열을 저장할 Object설정
		JSONObject jObject = new JSONObject();
		jObject.put("commentList",commentArray);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println(jObject.toJSONString());
		
		writer.close();
	}
	
	//---------------------------------
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}

}
