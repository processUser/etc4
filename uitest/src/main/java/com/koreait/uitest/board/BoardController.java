package com.koreait.uitest.board;

import com.koreait.uitest.board.model.BoardEntity;
import com.koreait.uitest.board.model.BoardVo;
import com.koreait.uitest.user.model.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class BoardController {

    @Autowired private BoardService service;

    @GetMapping("/list")
    public void list(BoardEntity entity, Model model) {
        model.addAttribute("list", service.selBoardList(entity));
    }

    @GetMapping("/detail")
    public void detail(BoardEntity entity, Model model) {
        model.addAttribute("item", service.selBoard(entity));
    }
}
