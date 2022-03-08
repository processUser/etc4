package org.iptime.mpage.DAO;

import org.iptime.mpage.DbUtils;
import org.iptime.mpage.model.goods.GoodsVo;
import org.iptime.mpage.model.goods.ReviewVo;
import org.iptime.mpage.model.user.AddrDto;
import org.iptime.mpage.model.user.AddrVo;
import org.iptime.mpage.model.user.UserDTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class AddrDAO { // 주소 DB조회
    public static int insAddr(AddrDto dto) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "INSERT INTO cookit_shipping_address (`addrnm`, `addr`, `detailedaddr`, `addrtel`, `addrdefault`, `userpk`) " +
                " VALUES (?, ?, ?, ?, ?, ?);";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, dto.getAddrnm());
            ps.setString(2, dto.getAddr());
            ps.setString(3, dto.getDetailedaddr());
            ps.setString(4, dto.getAddrtel());
            ps.setInt(5, dto.getAddrdefault());
            ps.setInt(6, dto.getUserpk());

            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }


    //사용자 배송지 전체 조회
    public static List<AddrVo> seladdr(UserDTO dto) {
        List<AddrVo> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM cookit_shipping_address WHERE userpk = ?";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dto.getUserpk());
            rs = ps.executeQuery();

            while (rs.next()) {
                AddrVo vo = new AddrVo();
                vo.setAddresspk(rs.getInt("addresspk"));
                vo.setAddr(rs.getString("addr"));
                vo.setDetailedaddr(rs.getString("detailedaddr"));
                vo.setAddrnm(rs.getString("addrnm"));
                vo.setAddrtel(rs.getString("addrtel"));
                vo.setAddrdefault(rs.getInt("addrdefault"));
                vo.setUserpk(rs.getInt("userpk"));
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

    // 배송지 수정
    public static int updAddr(AddrDto dto) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "UPDATE cookit_shipping_address " +
                " SET addr = ?, detailedaddr = ?, addrtel = ?, addrnm = ?, addrdefault = ? " +
                " WHERE userpk = ? AND addresspk = ?;";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setString(1, dto.getAddr());
            ps.setString(2, dto.getDetailedaddr());
            ps.setString(3, dto.getAddrtel());
            ps.setString(4, dto.getAddrnm());
            ps.setInt(5, dto.getAddrdefault());
            ps.setInt(6, dto.getUserpk());
            ps.setInt(7, dto.getAddresspk());

            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }

    // 기본 배송지 설정
    public static int updDefault(AddrDto dto) {
        Connection con = null;
        PreparedStatement ps = null;
        String sql = "UPDATE cookit_shipping_address SET addrdefault = 1 WHERE userpk = ?";

        try {
            con = DbUtils.getCon();
            ps = con.prepareStatement(sql);
            ps.setInt(1, dto.getUserpk());

            return ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            DbUtils.close(con, ps);
        }
        return 0;
    }
}
