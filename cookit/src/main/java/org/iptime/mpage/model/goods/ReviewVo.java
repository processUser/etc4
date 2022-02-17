package org.iptime.mpage.model.goods;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVo extends ReviewEntity {
    private double avgscore; //상품 별점 총 평균
    private int countscore; //상품 별점 총 평균
    private String gnm; // 상품 이름

    private int count; // 총 글수
    private int r = 10; // 1번에 표시할 수
    private int page; // 페이지수

    public void setCount(int count) {
        this.count = count;
        page = count / r;
    }
}
