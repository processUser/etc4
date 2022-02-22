package com.koreait.uitest.user.model;

import lombok.*;

@Getter
@Setter
@ToString
public class UserEntity {
    private int iuser;
    private String uid;
    private String upw;
    private String nm;
    private int gender;
    private String profileimg;
    private String rdt;
    private String mdt;
}
