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

import org.json.simple.JSONObject;

import com.site.ex.dao.CommentDao;
import com.site.ex.dto.CommentDto;


@WebServlet("/CommentUpdate")
public class CommentUpdate extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//post 한글처리
		request.setCharacterEncoding("utf-8");
		System.out.println("doAction");
		int cno = Integer.parseInt(request.getParameter("cno"));
		String ccontent = request.getParameter("ccontent");
		CommentDao cDao = new CommentDao();
		//입력된 데이터 1개를 다시 가져오기
		CommentDto cDto = cDao.updateCboard(cno,ccontent);
		// { "cno":1,"bid":1,"id":"aaa","cpw":"1111","ccontent":"댓글","cdate":"2021-10-27"}
		JSONObject commentInfo = new JSONObject();
		commentInfo.put("cno", cDto.getCno());
		commentInfo.put("bid", cDto.getBid());
		commentInfo.put("id", cDto.getId());
		commentInfo.put("cpw", cDto.getCpw());
		commentInfo.put("ccontent", cDto.getCcontent());
		String cdate = ""+cDto.getCdate();
		commentInfo.put("cdate",cdate );
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println(commentInfo.toJSONString());
		
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
