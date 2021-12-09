package com.site.ex.service;

import java.io.IOException;
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

public class EventServiceWrite implements EventService {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		EventDao eventDao = new EventDao();
		//String uploadPath=request.getRealPath("upload"); <-jsp
		//파일저장위치
		//String uploadPath=request.getSession().getServletContext().getRealPath("upload");
		String uploadPath="c:/fileUpload";
		//파일크기
		int size=10*1024*1024;
		try {
			//파일업로드
			MultipartRequest multi = new MultipartRequest(request,uploadPath,size,"utf-8",new DefaultFileRenamePolicy());
			String estate=multi.getParameter("estate"); //2021-10-19 00:00:00
			//startdate -> String 2021-10-19 -> date포맷 -> 시간을 추가해서 Timestamp
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			Date date1 = df.parse(multi.getParameter("startdate"));
			Timestamp startdate=new Timestamp(date1.getTime());
			System.out.println("format : "+date1);
			//enddate
			Date date2 = df.parse(multi.getParameter("enddate"));
			System.out.println("format : "+date2);
			Timestamp enddate=new Timestamp(date2.getTime());
			
			String etitle=multi.getParameter("etitle");
			String econtent=multi.getParameter("econtent");
			//session_id의 값을 넣어주면 됨.
			String id="aaa";
			String efileName="";
			String efileName2="";
			//업로드된 파일이름 가져오기 
			Enumeration files = multi.getFileNames();
			int i=0;
			//파일업로드가 없을때 efileName=""
			while(files.hasMoreElements()) {
				if(i==0) {
					//file->fileName2
					String f1 = (String) files.nextElement();
					//fileName2에 들어가 있는 file실제이름을 가져옴
					efileName2 = multi.getFilesystemName(f1);
				}else {
					String f1 = (String) files.nextElement();
					efileName = multi.getFilesystemName(f1);
				}
				i++;
			}
			
			//입력받은 데이터 객체저장
			EventDto eDto = new EventDto(id, etitle, econtent, startdate,enddate, estate, efileName, efileName2);
			//db파일저장메소드 호출
			int result = eventDao.insertEventWrite(eDto);
			//성공이면 1, 실패이면 0
			request.setAttribute("result", result);
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//execute

}
