package org.iptime.mpage.model.goods;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class PaymentEntity {
    // 결제 정보
    private int paymentpk;
    private String merchant_uid;
    private int userpk;
    private int addresspk;
    private int amount;
    private String rdt;

    // 결제 상품 정보
    private int paygoodspk;
    private int goodspk;

}
