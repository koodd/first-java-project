package com.site.ex;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet("/JClass")
public class JClass extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");

        PrintWriter out = response.getWriter();

        //배열을 저장할 totalObject
        JSONObject totalObject = new JSONObject();

        //memberInfo JSON 객체를 저장할 배열
        JSONArray memberArray = new JSONArray();
        JSONObject memberInfo = new JSONObject();

        //{"cNo":1, "bid":1, "id":"Goldenrod", "cPw":"1111", "cContent":"댓글내용입니다", "cDate":"2021-10-27"}
        memberInfo.put("cNo", 1);
        memberInfo.put("bid", 1);
        memberInfo.put("id", "Goldenrod");
        memberInfo.put("cPw", "1111");
        memberInfo.put("cContent", "댓글내용입니다");
        memberInfo.put("cDate", "2021-10-27");

        //[{"cNo":1, "bid":1, "id":"Goldenrod", "cPw":"1111", "cContent":"댓글내용입니다", "cDate":"2021-10-27"}]
        memberArray.add(memberInfo);

        //"members":[{"cNo":1, "bid":1, "id":"Goldenrod", "cPw":"1111", "cContent":"댓글내용입니다", "cDate":"2021-10-27"}]
        totalObject.put("members", memberArray);

        String jsonInfo = totalObject.toJSONString();

        out.print(jsonInfo);
    }
	
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request,response);
	}
	

}
