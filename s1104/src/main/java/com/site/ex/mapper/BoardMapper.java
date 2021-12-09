package com.site.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.ex.vo.BoardVo;

@Mapper
public interface BoardMapper {

	//전체 게시판
	List<BoardVo> selectList();

}
