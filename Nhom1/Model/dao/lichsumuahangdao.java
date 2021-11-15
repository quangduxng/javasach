package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import bean.lichsumuahangbean;

public class lichsumuahangdao {
	public ArrayList<lichsumuahangbean> getLS(String makh) throws Exception{
		ArrayList<lichsumuahangbean>  ds= new ArrayList<lichsumuahangbean>();
		//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="select ChiTietHoaDon.MaSach, ChiTietHoaDon.SoLuongMua,hoadon.NgayMua from ChiTietHoaDon inner join hoadon\r\n"
    			+ "on ChiTietHoaDon.MaHoaDon=hoadon.MaHoaDon \r\n"
    			+ "where ChiTietHoaDon.MaHoaDon=(select max(MaHoaDon) as max from hoadon where makh=? and damua=N'true')";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	cmd.setString(1, makh);
    	ResultSet rs= cmd.executeQuery();
    	
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String MaSach=rs.getString("MaSach");
    		Long SoLuongMua=rs.getLong("SoLuongMua");
       		String NgayMua=rs.getString("NgayMua");
       		
    		ds.add(new lichsumuahangbean(MaSach, SoLuongMua, NgayMua));
    	}

    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	}
	public ArrayList<lichsumuahangbean> getMahd(String MaHD) throws Exception{
		ArrayList<lichsumuahangbean>  ds= new ArrayList<lichsumuahangbean>();
		//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="select * from ChiTietHoaDon\r\n"
    			+ "where MaHoaDon=?";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	cmd.setString(1, MaHD);
    	ResultSet rs= cmd.executeQuery();
    	
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String MaSach=rs.getString("MaSach");
    		Long SoLuongMua=rs.getLong("SoLuongMua");   		
    		ds.add(new lichsumuahangbean(MaSach, SoLuongMua));
    	}

    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	}
}
