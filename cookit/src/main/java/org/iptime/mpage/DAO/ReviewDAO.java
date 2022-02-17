package org.iptime.mpage.DAO;

import org.iptime.mpage.DbUtils;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.ReviewVo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
    //리뷰 전체
    public static List<ReviewVo> selReviewlist(ReviewVo param) {
        List<ReviewVo> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT " +
                " A.reviewpk, A.goodspk, B.gnm, A.userpk, C.nm, " +
                " A.revscore, " +
                " A.revctnt, A.revimg, A.rdt " +
                " FROM cookit_review A " +
                " LEFT JOIN cookit_goods B " +
                " ON A.goodspk = B.goodspk " +
                " LEFT JOIN cookit_user C " +
                " ON A.userpk = C.userpk " +
                " ORDER BY A.rdt DESC " +
                " LIMIT ?, 10; ";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, param.getPage());
            rs = ps.executeQuery();

            while (rs.next()){
                ReviewVo vo = new ReviewVo();
                vo.setReviewpk(rs.getInt("reviewpk"));
                vo.setGoodspk(rs.getInt("goodspk"));
                vo.setGnm(rs.getString("gnm"));
                vo.setRevscore(rs.getInt("revscore"));
                vo.setRevctnt(rs.getString("revctnt"));
                vo.setRevimg(rs.getString("revimg"));
                vo.setRdt(rs.getString("rdt"));
                list.add(vo);
            }
            return list;
        }catch (Exception e) {

        }finally {
            DbUtils.close(con,ps,rs);
        }
        return null;
    }

    //Best 리뷰 10개
    public static List<ReviewVo> selBestReview() {
        List<ReviewVo> list = new ArrayList<>();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT A.reviewpk, A.goodspk, B.gnm, ROUND(AVG(A.revscore), 1) AS avgscore , A.revctnt, A.revimg, A.rdt " +
                " FROM cookit_review A " +
                " LEFT JOIN cookit_goods B " +
                " ON A.goodspk = B.goodspk " +
                " WHERE revscore >= 4.0 " +
                " GROUP BY A.goodspk " +
                " ORDER BY revscore DESC " +
                " LIMIT 0, 10;";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()){
                ReviewVo vo = new ReviewVo();
                vo.setReviewpk(rs.getInt("reviewpk"));
                vo.setGoodspk(rs.getInt("goodspk"));
                vo.setGnm(rs.getString("gnm"));
                vo.setAvgscore(rs.getDouble("avgscore"));
                vo.setRevctnt(rs.getString("revctnt"));
                vo.setRevimg(rs.getString("revimg"));
                vo.setRdt(rs.getString("rdt"));
                list.add(vo);
            }
            return list;
        }catch (Exception e) {

        }finally {
            DbUtils.close(con,ps,rs);
        }
        return null;
    }
    //리뷰 총 갯수
    public static int countReview() {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT COUNT(reviewpk) FROM cookit_review;";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();

            if(rs.next()){
               return rs.getInt("COUNT(reviewpk)");
            }

        }catch (Exception e) {

        }finally {
            DbUtils.close(con,ps,rs);
        }
        return 0;
    }
    //리뷰 상품별 전체 평균
    public static void selAvg(ReviewVo vo) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        String sql = "SELECT AVG(revscore) AS avgscore, COUNT(revscore) AS countscore  FROM cookit_review WHERE goodspk = ?";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, vo.getGoodspk());
            rs = ps.executeQuery();

            if(rs.next()){
                vo.setAvgscore(rs.getDouble("avgscore"));
                vo.setCountscore(rs.getInt("countscore"));
            }

        }catch (Exception e) {

        }finally {
            DbUtils.close(con,ps,rs);
        }
    }
}
