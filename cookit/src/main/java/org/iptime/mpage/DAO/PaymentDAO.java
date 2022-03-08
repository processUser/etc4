package org.iptime.mpage.DAO;

import org.iptime.mpage.DbUtils;
import org.iptime.mpage.model.goods.PaymentDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

public class PaymentDAO {
    public static int insPayment(PaymentDto dto) {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "INSERT INTO cookit_payment(merchant_uid, userpk, addresspk, amount, pg_provider, pg_tid, imp_uid) " +
                "VALUES(?, ?, ?, ?,'', '','');";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, dto.getMerchant_uid());
            ps.setInt(2, dto.getUserpk());
            ps.setInt(3, dto.getAddresspk());
            ps.setInt(4, dto.getAmount());
            ps.executeUpdate();
            rs = ps.getGeneratedKeys();
            if(rs.next()) {
                return rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.close(con,ps);
        }
        return 0;
    }

    public static int insGoodsList(int pk1, int pk2) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO cookit_payment_goods(paymentpk, goodspk) " +
                "VALUES ( ?, ?);";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, pk1);
            ps.setInt(2, pk2);
            return ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.close(con,ps);
        }
        return 0;
    }

    public static String selMerchantUid(){
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT merchant_uid FROM cookit_payment ORDER BY paymentpk DESC LIMIT 0,1";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if(rs.next()){
                return rs.getString("merchant_uid");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.close(con,ps);
        }
        return null;
    }

    public static int updPayment(PaymentDto dto) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "UPDATE cookit_payment SET imp_uid =?, pg_provider = ?, pg_tid=? WHERE paymentpk = ?;";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, dto.getImp_uid());
            ps.setString(2, dto.getPg_provider());
            ps.setString(3, dto.getPg_tid());
            ps.setInt(4, dto.getPaymentpk());
            return ps.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DbUtils.close(con,ps);
        }
        return 0;
    }
}
