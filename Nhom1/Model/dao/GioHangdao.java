package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.GioHangbean;

public class GioHangdao {
	
	public String InserBill(GioHangbean bean)
	{
		Connection cn = null;
		try {
			DungChung dc= new DungChung();
	    	dc.KetNoi();
			long millis=System.currentTimeMillis();
			java.sql.Date date=new java.sql.Date(millis);
			String sql = "INSERT INTO hoadon(makh, NgayMua, damua) VALUES(?,?,?)";
			PreparedStatement pst = dc.cn.prepareStatement(sql);
			pst.setInt(1, bean.getMakh());
			pst.setDate(2, (java.sql.Date) bean.getNgayMua());
			pst.setInt(3, bean.getDaMua());
			if(pst.executeUpdate() > 0)
			{
				return "SUCCESS";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				cn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "Oops.. Something went wrong there..!";
	}
	
	public String InserBillDetails(GioHangbean bean)
	{
		Connection cn = null;
		try {

			DungChung dc= new DungChung();
	    	dc.KetNoi();
			//Lay ma
			int MaHoaDon = 0;
			String query = "SELECT * FROM hoadon";
			PreparedStatement ps = dc.cn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				MaHoaDon = rs.getInt(1);
			}
			//
			String sql = "INSERT INTO ChiTietHoaDon(MaSach,SoLuongMua,MaHoaDon) VALUES(?,?,?)";
			PreparedStatement pst = dc.cn.prepareStatement(sql);
			pst.setString(1, bean.getMasach());
			pst.setLong(2, bean.getSlmua());
			pst.setInt(3, MaHoaDon);
			if(pst.executeUpdate() > 0)
			{
				return "SUCCESS";
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				cn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return "Oops.. Something went wrong there..!";
	}
	
	public ArrayList<GioHangbean> History(String ma)
	{
		ArrayList<GioHangbean> ds= new ArrayList<GioHangbean>();
		Connection cn = null;
		try {
			DungChung dc= new DungChung();
	    	dc.KetNoi();
			String sql = "select hoadon.makh, ChiTietHoaDon.MaSach, sach.tensach, sach.anh,ChiTietHoaDon.SoLuongMua , ChiTietHoaDon.MaHoaDon, hoadon.NgayMua \r\n"
					+ "from ChiTietHoaDon \r\n"
					+ "join sach  on ChiTietHoaDon.MaSach = sach.masach \r\n"
					+ "join hoadon on hoadon.MaHoaDon = ChiTietHoaDon.MaHoaDon\r\n"
					+ "where hoadon.makh = "+ ma;
			PreparedStatement pst = dc.cn.prepareStatement(sql);
			ResultSet rs = pst.executeQuery();
			while(rs.next())
			{
				GioHangbean bean = new GioHangbean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4),rs.getLong(5), rs.getInt(6), rs.getDate(7));
				ds.add(bean);
			}
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				cn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
		
	}
	
	 
}
