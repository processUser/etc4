package org.iptime.mpage.servlet.goods;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.AddrDAO;
import org.iptime.mpage.DAO.GoodsDAO;
import org.iptime.mpage.DAO.PaymentDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.goods.GoodsDto;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.PaymentDto;
import org.iptime.mpage.model.user.AddrDto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/price/ins")
public class GoodsPriceInsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        Utils.disForward(req, res, "/goods/price");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);

        Gson gosn = new Gson();
        PaymentDto dto = gosn.fromJson(json, PaymentDto.class);

        dto.getAddrdto().setUserpk(Utils.getLoginUserPk(req));

        if(dto.getAddrdto().getAddrdefault() == 0){
            AddrDAO.updDefault(dto.getAddrdto());
        }
        if (dto.getAddrdto() != null){
            AddrDAO.insAddr(dto.getAddrdto());
        }


        String selUid = PaymentDAO.selMerchantUid();
        String uid;
        if(selUid != null) {
            int Uid = Integer.parseInt(selUid.substring(12));
            uid = String.format("%010d", ++Uid);
        } else {
            uid = String.format("%010d", 1);
        }

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); //8
        Date now = new Date();
        String day = sdf.format(now);
        // 4 + 8 + 10
        String makeUid = "ckit" +day + uid;

        dto.setMerchant_uid(makeUid);
        dto.setUserpk(Utils.getLoginUserPk(req));

        Map<String, Object> map = new HashMap<>();
        map.put("paymentpk", PaymentDAO.insPayment(dto));
        map.put("uid", makeUid);
//        map.put("uid", "makeUid");

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }
}
