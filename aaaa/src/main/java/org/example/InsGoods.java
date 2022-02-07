package org.example;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class InsGoods {
    public static int insgoods(Goods goods) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "insert into cookit_goods(gnum, categorypk, gnm, price) values (?, ?, ?, ?)";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, goods.getGnum());
            ps.setInt(2, goods.getCategorypk());
            ps.setString(3, goods.getGnm());
            ps.setInt(4, goods.getPrice());

            return ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }

    public static int insimg(Goods goods) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "insert into cookit_goods_image(goodspk, img, defaultimage ) values (?, ?, ?)";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, goods.getGoodspk());
            ps.setString(2, goods.getImg());
            ps.setInt(3, goods.getDefaultimage());

            return ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }
}
