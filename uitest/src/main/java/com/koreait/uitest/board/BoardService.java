package com.koreait.uitest.board;

import com.koreait.uitest.board.model.BoardEntity;
import com.koreait.uitest.board.model.BoardVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Objects;

@Service
public class BoardService {

    @Autowired private BoardMapper mapper;

    public List<BoardVo> selBoardList(BoardEntity entity) {
        entity.setIcategory(1);
        return mapper.selBoardList(entity);
    }

    public BoardVo selBoard(BoardEntity entity) {
        return mapper.selBoard(entity);
    }
}
