package com.site.ex.service;

import java.util.List;

import com.site.ex.vo.BoardVo;

public interface BoardService {

	//전체 게시판
	List<BoardVo> list();

}
