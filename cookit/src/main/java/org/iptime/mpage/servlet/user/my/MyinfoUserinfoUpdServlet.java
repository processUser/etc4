package org.iptime.mpage.servlet.user.my;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.AddrDAO;
import org.iptime.mpage.DAO.UserDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.user.AddrDto;
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

@WebServlet("/my/userinfo/upd")
public class MyinfoUserinfoUpdServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }
}
