package com.site.ex.service;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.site.ex.dao.EventDao;
import com.site.ex.dto.EventDto;

public class EventServiceUpdate implements EventService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDao eventDao = new EventDao();
		String uploadPath="c:/fileUpload";
		//파일크기
		int size=10*1024*1024;
		try {
			//파일업로드
			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
			int eid=Integer.parseInt(multi.getParameter("eid")); //이벤트번호
			System.out.println("update : "+eid);
			String id=multi.getParameter("id"); //아이디
			String estate=multi.getParameter("estate"); //진행예정,진행중,진행종료
			//startdate -> String 2021-10-19 -> date포맷 -> 시간을 추가해서 Timestamp
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = df.parse(multi.getParameter("startdate"));
			Timestamp startdate=new Timestamp(date1.getTime());
			System.out.println("update startdate : "+startdate);
			//enddate
			Date date2 = df.parse(multi.getParameter("enddate"));
			Timestamp enddate=new Timestamp(date2.getTime());
			String etitle=multi.getParameter("etitle");
			String econtent=multi.getParameter("econtent");
			//session_id의 값을 넣어주면 됨.
			String efileName=multi.getParameter("efileName");
			System.out.println("update efileName1 : "+efileName);
			String efileName2=multi.getParameter("efileName2");
			
			//업데이트 파일이 있는지 확인
			if(multi.getFilesystemName("fileName")!=null) {
				efileName = multi.getFilesystemName("fileName");
				System.out.println("update efileName1 : "+efileName);
			}
			if(multi.getFilesystemName("fileName2")!=null) {
				efileName2 = multi.getFilesystemName("fileName");
			}
			
			//입력받은 데이터 객체저장
			EventDto eDto = new EventDto(eid, id, etitle, econtent, enddate, startdate, enddate, estate, efileName, efileName2);
			//db파일저장메소드 호출
			int result = eventDao.updateEvent(eDto);
			//성공이면 1, 실패이면 0
			request.setAttribute("result", result);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
