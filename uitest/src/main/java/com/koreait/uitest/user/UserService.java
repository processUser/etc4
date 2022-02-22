package com.koreait.uitest.user;

import com.koreait.uitest.user.model.UserEntity;
import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

    @Autowired private UserMapper mapper;

    public int join(UserEntity entity) { //uid, upw, nm, gender
        //비밀번호 암호화
        String hashedPw = BCrypt.hashpw(entity.getUpw(), BCrypt.gensalt());
        entity.setUpw(hashedPw);

        return mapper.insUser(entity);
    }
}
