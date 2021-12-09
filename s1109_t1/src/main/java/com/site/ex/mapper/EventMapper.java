package com.site.ex.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.site.ex.dto.CommentDto;
import com.site.ex.dto.EventDto;

@Mapper
public interface EventMapper {

	// event게시글에 해당되는 댓글전체 가져오기
	List<CommentDto> selectCommmentList(int bid);

	//댓글추가
	void insertCommentWrite(CommentDto commentDto);

	//댓글1개 가져오기
	CommentDto selectCommentOne(int cno);

	//댓글 개수
	int selectCount(CommentDto commentDto);

	//댓글 삭제
	int deleteComment(int cno);

	//댓글 수정저장
	void updateComment(CommentDto commentDto);

	//eventBoard 전체 게시글 가져오기
	List<EventDto> selectEventBoard();

	//eventBoard 1개 게시글 가져오기
	EventDto selectEventOne(int eventNo);

}
