package org.iptime.mpage.servlet.user.my;

import com.google.gson.Gson;
import org.iptime.mpage.DAO.AddrDAO;
import org.iptime.mpage.DAO.UserDAO;
import org.iptime.mpage.Utils;
import org.iptime.mpage.model.user.AddrDto;
import org.iptime.mpage.model.user.UserDTO;
import org.iptime.mpage.model.user.UserResult;
import org.iptime.mpage.model.user.UserVo;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/my/pwchange/upd")
public class PwChangeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        String json = Utils.getJson(req);
        Gson gosn = new Gson();
        UserDTO dto = gosn.fromJson(json, UserDTO.class);

        int upk = Utils.getLoginUserPk(req);
        int chang = 0;

        if(upk != 0) {
            dto.setUserpk(upk);
            if (dto.getBeforepw() != null && dto.getBeforepw() != "") {
                UserVo vo = UserDAO.loginUser(dto);
                if(BCrypt.checkpw(dto.getBeforepw(), vo.getPw())){
                    chang = 1;
                } else {
                    chang = 0;
                }
            } else {
                chang = 0;
            }
        } else {
            chang = 0;
        }

        UserResult ur = new UserResult();

        if(chang != 0) {
            UserVo userVo = Utils.getLoginUser(req);
            dto.setUserpk(userVo.getUserpk());
            dto.setEmail(userVo.getEmail());
            String pw = BCrypt.hashpw(dto.getPw(), BCrypt.gensalt());
            dto.setPw(pw);
            ur.setResult(UserDAO.updUser(dto));
        } else {
            ur.setResult(0);
        }

        res.setContentType("text/plain;charset=UTF-8");
        res.setCharacterEncoding("UTF-8");

        PrintWriter out = res.getWriter();
        out.println(gosn.toJson(ur));
    }
}
