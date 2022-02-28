package org.iptime.mpage;

import org.iptime.mpage.command.MainCommand;
import org.iptime.mpage.command.UCommand;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


//public class Controller extends HttpServlet {
//    @Override
//    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        System.out.println("--- do ---");
//        action(req, res);
//    }
//
//    @Override
//    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//        System.out.println("--- post ---");
//        action(req, res);
//    }
//
//    private void action(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
//
//        System.out.println("URL :"+req.getRequestURL());
//        System.out.println("URI :"+req.getRequestURI());
//        System.out.println("contecxtPath :"+req.getContextPath());
//        System.out.println("command :"+req.getRequestURI());
//        System.out.println("getServletPath :"+ req.getServletPath());
//
//        UCommand com = null;
//        String viewPage = null;
//
//        if(req.getRequestURI().equals("/aaa.do")){
//            System.out.println("/index.jsp");
//            com = new MainCommand();
//            com.execute(req, res);
//            System.out.println("contecxtPath :"+req.getContextPath());
//            viewPage = "/WEB-INF/view/goods/aaa.jsp";
//        }
//        PrintWriter out = res.getWriter();
//
//        out.println("<html>");
//        out.println("<head>");
//        out.println("<title>HelloServelt1</title>");
//        out.println("</head>");
//        out.println("<body>");
//        out.println("<h1>HelloServlet1입니다.</h1>");
//        out.println("<h1>요청 경로는 " + req.getRequestURI() + "</h1>");
//        out.println("<h1>맵핑 경로는 " + req.getServletPath() + "</h1>");
//        out.println("</body>");
//        out.println("</html>");
//        out.close();

//        req.getRequestDispatcher(viewPage).forward(req, res);
//
//    }
//}
