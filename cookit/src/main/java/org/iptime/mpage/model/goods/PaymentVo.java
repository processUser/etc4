package org.iptime.mpage.model.goods;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.List;

@Setter
@Getter
@ToString
public class PaymentVo extends PaymentEntity {

    private List<String> goodspkList;

}
