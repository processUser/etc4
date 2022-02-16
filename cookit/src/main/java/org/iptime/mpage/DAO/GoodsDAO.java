package org.iptime.mpage.DAO;

import org.iptime.mpage.DbUtils;
import org.iptime.mpage.model.goods.GoodsDto;
import org.iptime.mpage.model.goods.GoodsEntity;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.ReviewVo;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GoodsDAO {
    // 상품 전체 조회
    // 상품 카테고리별 전체 조회
    public static List<GoodsVo> selGoodsList (GoodsDto dto) {
        List<GoodsVo> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT A.goodspk, A.gnum, A.categorypk, A.gnm, A.price, A.quantity, A.rdt, " +
                "B.categorynm AS category, D.img AS img , AVG(revscore) AS avgscore, COUNT(revscore) AS countscore " +
                "FROM cookit_goods A " +
                "LEFT JOIN cookit_goods_category B ON A.categorypk = B.categorypk " +
                "LEFT JOIN cookit_review C ON A.goodspk = C.goodspk " +
                "LEFT JOIN cookit_goods_image D ON A.goodspk = D.goodspk ";

        if(dto.getCategorypk() > 0 && dto.getDefaultimage() > 0){
            sql += " WHERE A.categorypk = ? AND D.defaultimage = ? ";
        }else if(dto.getDefaultimage() > 0){
            sql += " WHERE D.defaultimage = ? ";
        }
        sql += " GROUP BY A.goodspk ";


        if(dto.getDesc() == 1) {
            sql += " ORDER BY A.price DESC ";
        } else if(dto.getDesc() == 2) {
            sql += " ORDER BY A.price ";
        } else if(dto.getCountscore() == 1) {
            sql += " ORDER BY countscore DESC ";
        } else {
            sql += " ORDER BY A.goodspk  ";
        }



        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            if(dto.getCategorypk() > 0){
                ps.setInt(1, dto.getCategorypk());
                ps.setInt(2, dto.getDefaultimage());
            }else if(dto.getDefaultimage() > 0){
                ps.setInt(1, dto.getDefaultimage());

            }
            rs = ps.executeQuery();

            while (rs.next()) {
                GoodsVo vo = new GoodsVo();
                ReviewVo rvo = new ReviewVo();
                vo.setGoodspk(rs.getInt("goodspk"));
                vo.setGnum(rs.getString("gnum"));
                vo.setCategorypk(rs.getInt("categorypk"));
                vo.setGnm(rs.getString("gnm"));
                vo.setPrice(rs.getInt("price"));
                vo.setQuantity(rs.getInt("quantity"));
                vo.setRdt(rs.getString("rdt"));
                vo.setCategory(rs.getString("category"));
                rvo.setAvgscore(rs.getDouble("avgscore"));
                rvo.setCountscore(rs.getInt("countscore"));
                vo.setReviewvo(rvo);
                vo.setImg(rs.getString("img"));
                System.out.println(vo.getGnm());
                list.add(vo);
            }
            return list;

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps, rs);
        }

        return null;
    }
}
