package org.iptime.mpage.servlet.user.my;

import org.iptime.mpage.Utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/my/delete")
public class MyinfoDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        // HTML이 UTF-8 형식이라는 것을 브라우저에게 전달
        res.setContentType("text/html; charset=utf-8");
        // 서블릿을 통해 생성되는 HTML 파일의 인코딩을 UTF-8로 설정
        res.setCharacterEncoding("utf-8");

        Utils.disForward(req, res, "user/myinfo_layout/delete");


    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
