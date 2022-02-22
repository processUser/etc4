package com.koreait.uitest;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.koreait.uitest.user.model.UserEntity;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders.get;
import static org.springframework.restdocs.mockmvc.RestDocumentationRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

// 통합 테트스
@SpringBootTest
@AutoConfigureMockMvc // 내장톰캣을 사용하여 테스트 환경을 구축, bean 등록해줌.
public class UserControllerTest {

    @Autowired private MockMvc mvc;

    @Autowired private ObjectMapper objectMapper; // jackson 주소값얻을때...

    @Test
    @DisplayName("로그인 화면 테스트")
    public void loginTest() throws Exception {
        mvc.perform(get("/user/login"))
                .andExpect(status().isOk())
                .andExpect(view().name("user/login"))
                .andExpect(content().string(containsString("로그인")));

    }

    @Test
    @DisplayName("회원가입 처리 테스트")
    @Transactional // RolBack 처리
    public void joinTest() throws Exception {
        UserEntity entity = new UserEntity();
        entity.setUid("test");
        entity.setUpw("1212");
        entity.setNm("테스트");
        entity.setGender(1);

        String jsonParam = objectMapper.writeValueAsString(entity);// json 형태로 ....

        mvc.perform(
                post("/user/join")
                        .contentType(MediaType.APPLICATION_JSON)
                        .accept(MediaType.APPLICATION_JSON)
                        .content(jsonParam)
        )
                .andExpect(jsonPath("result").value(1))
                .andDo(print());

    }
}
