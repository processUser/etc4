package org.iptime.mpage.servlet.review;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.ReviewDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.goods.GoodsDto;
import org.iptime.mpage.model.goods.ReviewVo;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet("/reviewlist")
public class ReviewListServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        List<ReviewVo> list =  ReviewDAO.selBestReview();

        Gson gosn = new Gson();
        Map<String, Object> map = new HashMap<>();
        map.put("list", list);

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);
        Gson gosn = new Gson();
        ReviewVo vo = gosn.fromJson(json, ReviewVo.class);

        List<ReviewVo> list = ReviewDAO.selReviewlist(vo);

        Map<String, Object> map = new HashMap<>();
        map.put("list", list);
        map.put("page", (ReviewDAO.countReview())/10);

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }
}
