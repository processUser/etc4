package com.koreait.uitest.board;

import com.koreait.uitest.board.model.BoardEntity;
import com.koreait.uitest.board.model.BoardVo;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardMapper {
    List<BoardVo> selBoardList(BoardEntity entity);
    BoardVo selBoard(BoardEntity entity);
}
