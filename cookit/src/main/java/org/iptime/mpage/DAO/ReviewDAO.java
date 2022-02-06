package org.iptime.mpage.DAO;

import org.iptime.mpage.DbUtils;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.ReviewVo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class ReviewDAO {
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
