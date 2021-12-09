package com.hphfarm.www.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.hphfarm.www.dto.ExpDto;

import com.hphfarm.www.dto.FarmRegDto;
import com.hphfarm.www.dto.MemberDto;
import com.hphfarm.www.dto.NumberDto;

import com.hphfarm.www.mapper.ExpMapper;

// numberDto에 맞게 수정함

@Service
public class ExpServiceImpl implements ExpService {

	@Autowired
	ExpMapper expMapper;

	
	// 체험프로그램 전체 리스트 가져오기	
	@Override
	public Map<String, Object> exp_List(NumberDto numberDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 넘버링 메소드 호출하기
		NumberDto nDto = numbering(numberDto);
		if(nDto.getSearchword()==null)
			System.out.println("체험프로그램의 searchword : " + nDto.getSearchword());
		else
			System.out.println("체험프로그램의 searchword No : "+ nDto.getSearchword());
																// 첫번째 수 , 마지막수,카테고리 , 카테고리 , 찾을단어
		List<NumberDto> list = expMapper.selectExpList(nDto.getStartrow(),nDto.getEndrow(),nDto.getCategory(),nDto.getSearchword());
		map.put("list",list);
		map.put("nDto",nDto);

		
		return map;
	}
	
	// 체험 프로그램 하단 넘버링하기 - 총 게시글 수 
	public NumberDto numbering(NumberDto numberDto) {
		int page=0;
		if(numberDto.getPage()==0) page=1;
		else page= numberDto.getPage();
		
		String category = numberDto.getCategory();
		System.out.println("체험프로그램 의 category : " +category);
		String searchword = numberDto.getSearchword();
		System.out.println("체험프로그램 의 searchword : " +searchword);
		// 1페이지에 나오는 게시글수 >> 체험등록 페이지는 1페이지에 3개의 게시글만 나오면 되므로 3개로 해준다.
		int limit=3;
		// 하단 넘버링 개수
		int numlimit=10;
		// 총 게시글 수
		int listcount = expMapper.selectExpListCount(category,searchword);
		//최대페이지
		int maxpage = (int)Math.ceil((double)listcount/limit);
		// 하단넘버링 처음수
		int startpage= (((int)(Math.ceil((double)page/numlimit)-1)))*numlimit+1;
		// 하단넘버링 마지막수
		int endpage= startpage+numlimit-1;
		// 최대페이지가 마지막 페이지보다 작으면 최대페이지까지만 출력
		if(endpage>maxpage) endpage=maxpage;
		// 가져올 첫번째 수
		int startrow = (page-1)*limit+1;
		// 가져올 마지막 수
		int endrow = startrow+limit-1;
		
		NumberDto nDto = new NumberDto(page, numlimit, limit, listcount, maxpage, startpage, endpage, startrow, endrow, category, searchword);
		
		
		return nDto;
	}
	// (농장주)체험등록 글쓰기 
	@Override
	public int exp_RegWrite(ExpDto expDto) {
		int result = expMapper.insertExp_RegWrite(expDto);
		return result;
	}
	
    // 체험 상세보기 뷰 

	@Override
	public Map<String, Object> boardOne(int e_no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		ExpDto eDto = expMapper.selectBoardOne(e_no);

		map.put("eDto", eDto);

		System.out.println("서비스의 eDto : " + eDto);
		System.out.println("체험 상세보기 서비스의 map : " + map);
		
		return map;
	}


    // 테이블 조인 
/*		
	@Override
	public List<TotalDto> selectExpView() {
		List<TotalDto> list = expMapper.selectExpView();
		return list;
	}
*/	

}
