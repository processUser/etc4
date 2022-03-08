package org.iptime.mpage.model.user;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AddrDto{
    private int addresspk;
    private String addrnm;
    private String addr;
    private String detailedaddr;
    private String addrtel;
    private int addrdefault;
    private int userpk;
}
