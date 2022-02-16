package org.iptime.mpage.model.goods;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class GoodsDto { // db 조회 할때 사용
    private int goodspk;
    private int categorypk;
    private int defaultimage;
    private int desc;
    private int countscore;
}
