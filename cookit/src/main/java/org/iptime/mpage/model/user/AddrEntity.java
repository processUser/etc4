package org.iptime.mpage.model.user;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class AddrEntity {
    private int addresspk;
    private String addrnm;
    private String addr;
    private String detailedaddr;
    private String addrtel;
    private int addrdefault;
    private int userpk;
}
