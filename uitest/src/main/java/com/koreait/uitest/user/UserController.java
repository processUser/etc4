package com.koreait.uitest.user;

import com.koreait.uitest.ResultVo;
import com.koreait.uitest.user.model.UserEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping("/user")
@RequiredArgsConstructor
public class UserController {

    private final UserService service;

    @GetMapping("/login")
    public String login(@ModelAttribute("entity") UserEntity entity) {
        return "user/login";
    }

    @ResponseBody
    @PostMapping("/join")
    public ResultVo join(@RequestBody UserEntity entity) {
        System.out.println("/join : " + entity);
        int result = service.join(entity);
        return new ResultVo(result);
    }
}
