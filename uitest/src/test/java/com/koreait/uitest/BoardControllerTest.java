package com.koreait.uitest;

import com.koreait.uitest.board.BoardController;
import com.koreait.uitest.board.BoardService;
import com.koreait.uitest.board.model.BoardVo;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;

//import static org.mockito.Mockito.*;
import static org.hamcrest.Matchers.contains;
//import static org.mockito.ArgumentMatchers.any;
import static org.hamcrest.Matchers.containsString;
import static org.mockito.Mockito.when;
import static org.mockito.Mockito.any;
import static org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@WebMvcTest(BoardController.class)
public class BoardControllerTest {

    @Autowired
    private MockMvc mvc;

    @MockBean private BoardService service;

    @Test
    @DisplayName("게시판 리스트 테스트")
    public void listTest() throws Exception{
        BoardVo data = new BoardVo();
        data.setIboard(100);

        when(service.selBoardList(any())).thenReturn(Collections.singletonList(data));

        mvc.perform(get("/board/list"))
                .andExpect(model().attributeExists("list"))
                .andExpect(model().attribute("list", contains(data)));
    }

    @Test
    @DisplayName("게시판 디테일 테스트")
    public void detailTest() throws Exception{
        BoardVo data = new BoardVo();
        data.setIboard(1);
        data.setTitle("제목");

        when(service.selBoard(any())).thenReturn(data);

//        mvc.perform(get("/board/detail?iboard=1"))
        mvc.perform(get("/board/detail").param("iboard","1"))
                .andExpect(view().name("board/detail"))
                .andExpect(model().attributeExists("item"))
                .andExpect(model().attribute("item", data))
                .andExpect(content().string(containsString("디테일")));
    }
}
