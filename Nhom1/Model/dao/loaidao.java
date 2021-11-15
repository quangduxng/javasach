package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bean.loaibean;
import dao.DungChung;
import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() throws Exception{
    	ArrayList<loaibean> ds= new ArrayList<loaibean>();
    	//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="Select * from Loai";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	ResultSet rs= cmd.executeQuery();
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String maloai=rs.getString("maloai");
    		String tenloai=rs.getString("tenloai");
    		ds.add(new loaibean(maloai, tenloai));
    	}
    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	}
	public static loaibean getTheoMaLoai(String ma) {
		DungChung dc = new DungChung();
		try {
			dc.KetNoi();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "select * from loai where maloai = ?";
		try {
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, ma);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				loaibean tam = new loaibean();
				tam.setMaloai(rs.getString("maloai"));
				tam.setTenloai(rs.getString("tenloai"));

				return tam;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}
	public int Xoa(String maloai) throws Exception {
		DungChung dc = new DungChung();
		try {
			dc.KetNoi();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "delete from loai where maloai = ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		int rs = cmd.executeUpdate();
		return rs;
	}

	public int Them(String maloai, String tenloai) throws Exception {
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "insert into loai values( ? , ? )";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, maloai);
		cmd.setString(2, tenloai);
		int rs = cmd.executeUpdate();
		dc.cn.close();
		return rs;
	}

	public int Sua(String maloai, String tenloai) throws Exception {
		DungChung dc = new DungChung();
		dc.KetNoi();
		String sql = "update  loai set tenloai = ? where maloai = ?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(2, maloai);
		cmd.setString(1, tenloai);
		int rs = cmd.executeUpdate();
		dc.cn.close();
		return rs;
	}
	
}
