package org.iptime.mpage.servlet.user.my;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.AddrDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.user.AddrDto;
import org.iptime.mpage.model.user.UserResult;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/my/addrinfo/upd")
public class MyinfoAddrinfoUpdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);
        Gson gosn = new Gson();
        AddrDto dto = gosn.fromJson(json, AddrDto.class);
        dto.setUserpk(Utils.getLoginUserPk(req));

        UserResult ur = new UserResult();
        ur.setResult(AddrDAO.updAddr(dto));


        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(ur));
    }
}
