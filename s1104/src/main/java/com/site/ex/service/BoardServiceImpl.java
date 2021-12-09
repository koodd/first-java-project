package com.site.ex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.site.ex.mapper.BoardMapper;
import com.site.ex.vo.BoardVo;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardMapper boardMapper;
	
	@Override  //전체 게시판
	public List<BoardVo> list() {
		List<BoardVo> list = boardMapper.selectList();
		return list;
	}

}
