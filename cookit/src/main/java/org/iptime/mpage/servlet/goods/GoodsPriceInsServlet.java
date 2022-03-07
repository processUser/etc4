package org.iptime.mpage.servlet.goods;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.GoodsDAO;
import org.iptime.mpage.DAO.PaymentDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.goods.GoodsDto;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.PaymentDto;

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
        //System.out.println(dto);

        String selUid = PaymentDAO.selMerchantUid();
        int Uid = Integer.parseInt(selUid.substring(12));
        String uid = String.format("%010d", ++Uid);

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); //8
        Date now = new Date();
        String day = sdf.format(now);
        // 4 + 8 + 10
        String makeUid = "ckit" +day + uid;

        dto.setMerchant_uid(makeUid);
        dto.setUserpk(Utils.getLoginUserPk(req));

        int result = PaymentDAO.insPayment(dto);

        Map<String, Object> map = new HashMap<>();
        map.put("paymentpk", result);
        map.put("uid", makeUid);

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }
}
