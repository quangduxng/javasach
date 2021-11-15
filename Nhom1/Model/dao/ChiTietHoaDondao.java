package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.ChiTietHoaDonbean;
import bean.HoaDonbean;

public class ChiTietHoaDondao {
	public ArrayList<ChiTietHoaDonbean> getCTHD(String maHoaDon) throws Exception{
		ArrayList<ChiTietHoaDonbean>  ds= new ArrayList<ChiTietHoaDonbean>();
		//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="select * from ChiTietHoaDon where MaHoaDon=?";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	cmd.setString(1, maHoaDon);
    	ResultSet rs= cmd.executeQuery();
    	
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String MaChiTietHD=rs.getString("MaChiTietHD");
    		String MaSach=rs.getString("MaSach");
    		Long SoLuongMua=rs.getLong("SoLuongMua");
       		String MaHoaDon=rs.getString("MaHoaDon");
       		
    		ds.add(new ChiTietHoaDonbean(MaSach, SoLuongMua, MaHoaDon));
    	}
    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	}
	
}
