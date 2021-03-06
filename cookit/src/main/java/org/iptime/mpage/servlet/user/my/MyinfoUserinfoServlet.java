package org.iptime.mpage.servlet.user.my;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.AddrDAO;
import org.iptime.mpage.DAO.ReviewDAO;
import org.iptime.mpage.DAO.UserDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.goods.ReviewVo;
import org.iptime.mpage.model.user.AddrVo;
import org.iptime.mpage.model.user.UserDTO;
import org.iptime.mpage.model.user.UserVo;

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

@WebServlet("/my/userinfo")
public class MyinfoUserinfoServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {


        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        res.setContentType("text/html; charset=utf-8");
        // 서블릿을 통해 생성되는 HTML 파일의 인코딩을 UTF-8로 설정
        res.setCharacterEncoding("utf-8");

        Utils.disForward(req, res, "user/myinfo_layout/userinfo");

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);
        Gson gosn = new Gson();
        UserDTO dto = gosn.fromJson(json, UserDTO.class);
        dto.setUserpk(Utils.getLoginUserPk(req));

        UserVo vo = UserDAO.selUser(dto);
        List<AddrVo> list = AddrDAO.seladdr(dto);

        Map<String, Object> map = new HashMap<>();
        map.put("userinfo", vo);
        map.put("addrinfo", list);

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(map));
    }
}
