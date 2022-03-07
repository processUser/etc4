package org.iptime.mpage.model.goods;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
public class PaymentDto {
    private int paymentpk;
    private String merchant_uid;
    private int userpk;
    private int addresspk;
    private int amount;
    private List<String> goodspkList;

    public void setAddresspk(String addresspk) {
        this.addresspk = Integer.parseInt(addresspk);
    }

    public void setAmount(String amount) {
        this.amount = Integer.parseInt(amount);
    }
}
