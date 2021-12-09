package com.hphfarm.www.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.hphfarm.www.dto.FarmDto;
import com.hphfarm.www.dto.FarmReviewDto;
import com.hphfarm.www.dto.FviewDto;
import com.hphfarm.www.dto.NumberDto;
import com.hphfarm.www.mapper.FarmMapper;

@Service
public class FarmServiceImpl implements FarmService {

	@Autowired
	FarmMapper farmMapper;
	
	// 농장 예약 페이지
	@Override
	public FarmDto fReserview(int fr_no) {
		FarmDto fDto = farmMapper.selectReserInfo(fr_no);

		return fDto;
	}
	
	// 해당 농장 리뷰 가져오기
	@Override
	public List<FarmReviewDto> farmreviewList(int fr_no) {
		List<FarmReviewDto> rlist = farmMapper.selectFReviewList(fr_no);

		return rlist;
	}
	
	// 농장 리뷰
	@Override
	public Map<String, Object> writeReview(FarmReviewDto rvDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 리뷰 저장
		farmMapper.insertFarmReview(rvDto);
		// 리뷰 1개 가져오기
		FarmReviewDto rDto = farmMapper.selectFReviewOne(rvDto.getFr_no());

		return map;
	}

	
	// 농장 상세보기
	@Override
	public Map<String, Object> farmview(int fr_no) {
		Map<String, Object> map = new HashMap<String, Object>();

		FarmDto fDto = farmMapper.selectFarmView(fr_no);
		map.put("fDto", fDto);

		return map;
	}

	// 농장 목록 가져오기
	@Override
	public Map<String, Object> farmlist(NumberDto nDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 페이징 메소드 호출
		NumberDto pDto = paging(nDto,6);	
		//게시글 가져오기
		List<FarmDto> list = farmMapper.selectList(pDto.getStartrow(), pDto.getEndrow(), pDto.getSearchword(), pDto.getCategory(), pDto.getRegion());
		
		map.put("list",list);
		map.put("pDto", pDto);
		
		return map;
	}
	
	// 페이징 데이터 넣기
		public NumberDto paging(NumberDto pageDto, int lim) {
			
			int page = pageDto.getPage();
			if(page==0) page=1; 
			
			String category = pageDto.getCategory();
			String searchword = pageDto.getSearchword();
			String region = pageDto.getRegion();
			
			int limit = lim; // 한 페이지에 보여질 게시글 수
			int numLimit = 10; // 하단 넘버링 개수
			//총 게시글
			int listCount = farmMapper.listCount(searchword, category, region);
			int maxPage = (int)Math.ceil((double)listCount/limit);	//최대페이지
			int startPage = ((int)(Math.ceil((double)page/numLimit)-1))*numLimit+1; // 하단 넘버링 처음 수
			int endPage = startPage+numLimit-1;	// 하단 넘버링 마지막 수
			// 최대페이지가 마지막 페이지보다 작으면 최대페이지까지만 출력
			if(endPage>maxPage) {
				endPage = maxPage;
			}
			int startrow = (page-1)*limit+1;	//가져올 첫번째 수
			int endrow = startrow+limit-1;	//가져올 마지막 수
			
			NumberDto pDto=new NumberDto(page, limit, numLimit, listCount, maxPage, startPage, endPage, startrow, endrow, category, searchword, region);
			return pDto;
		}

	// 농장 등록
	@Override
	public int farmRegi(FarmDto fDto) {
		int result = farmMapper.farmregi(fDto);
		return result;
	}

	//농장 등록 시 파일 업로드
	@Override
	public FarmDto farmRegiFile(FarmDto fDto, MultipartFile certi_file, MultipartFile thumb_file, MultipartFile subfile,
			MultipartFile subfile2, MultipartFile subfile3, MultipartFile subfile4) {
		
		String newFileName="";
		
		if(certi_file.getSize()!=0) {
			String originFileName = certi_file.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_certi(newFileName);
			try {
				certi_file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_certi("blank.png");
		}
		
		if(thumb_file.getSize()!=0) {
			String originFileName = thumb_file.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_thumb(newFileName);
			try {
				thumb_file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_thumb("blank.png");
		}
		
		if(subfile.getSize()!=0) {
			String originFileName = subfile.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_view(newFileName);
			try {
				subfile.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_view("blank.png");
		}
		
		if(subfile2.getSize()!=0) {
			String originFileName = subfile2.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_view2(newFileName);
			try {
				subfile2.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_view2("blank.png");
		}
		
		if(subfile3.getSize()!=0) {
			String originFileName = subfile3.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_view3(newFileName);
			try {
				subfile3.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_view3("blank.png");
		}
		
		if(subfile4.getSize()!=0) {
			String originFileName = subfile4.getOriginalFilename();
			long time = System.currentTimeMillis();
			newFileName = String.format("%d_%s", time,originFileName); 
			String fileSaveUrl="C:/fileSave/";
			File f = new File(fileSaveUrl+newFileName);
			fDto.setFr_view4(newFileName);
			try {
				subfile4.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			fDto.setFr_view4("blank.png");
		}
		
		return fDto;
	}

	// 관리자 농장 목록 가져오기
	@Override
	public Map<String, Object> man_farm_list(NumberDto nDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 페이징 메소드 호출
		NumberDto pDto = paging(nDto,20);	
			//게시글 가져오기
		List<FarmDto> list = farmMapper.selectList(pDto.getStartrow(), pDto.getEndrow(), pDto.getSearchword(), pDto.getCategory(), pDto.getRegion());
			
		map.put("list",list);
		map.put("pDto", pDto);
			
		return map;
	}

	// 관리자 농장 등록&수정 신청 목록 가져오기
	@Override
	public Map<String, Object> man_farm_regi_list(NumberDto nDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 페이징 메소드 호출
		NumberDto pDto = paging(nDto,1);	
			//게시글 가져오기
		List<FarmDto> list = farmMapper.man_farm_regi_list(pDto.getStartrow(), pDto.getEndrow(), pDto.getSearchword());
			
		map.put("list",list);
		map.put("pDto", pDto);
			
		return map;
	}

	// 관리자 농장 등록&수정 신청 상세보기
	@Override
	public FarmDto man_farm_regi_view(int frno) {
		FarmDto fDto = farmMapper.man_farm_fegi_view(frno);
		return fDto;
	}

	// 관리자 농장 등록&수정 신청 반려
	@Override
	public int regi_delete(int frno) {
		int result = farmMapper.regi_delete(frno);
		return result;
	}

	// 관리자 농장 등록&수정 신청 수락
	@Override
	public int regi_success(FarmDto fDto) {
		int result = farmMapper.regi_success(fDto);
		return result;
	}

	// 관리자 농장 예약 내역
	@Override
	public Map<String, Object> man_freser_list(NumberDto nDto) {
		Map<String, Object> map = new HashMap<String, Object>();
		// 페이징 메소드 호출
		NumberDto pDto = paging(nDto,20);	
		//게시글 가져오기
		List<FarmDto> list = farmMapper.fReserList(pDto.getStartrow(), pDto.getEndrow(), pDto.getSearchword());
		
		map.put("list",list);
		map.put("pDto", pDto);
		return map;
	}
}
