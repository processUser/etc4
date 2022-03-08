package org.iptime.mpage.servlet.goods;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.PaymentDAO;
import org.iptime.mpage.Utils;
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

@WebServlet("/price")
public class GoodsPriceServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        Utils.disForward(req, res, "/goods/price");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);
        Gson gosn = new Gson();
        PaymentDto dto = gosn.fromJson(json, PaymentDto.class);
        System.out.println(dto);

        List<String> list = dto.getGoodspkList();
        int result = 0;
        for (String str: list) {
            result = PaymentDAO.insGoodsList(dto.getPaymentpk(), Integer.parseInt(str));
        }

        if(result == 1) {
            result = PaymentDAO.updPayment(dto);
        }

        Map<String, Object> map = new HashMap<>();
        map.put("success", result);

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }
}
