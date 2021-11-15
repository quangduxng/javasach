package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.DungChung;
import bean.loaibean;
import bean.sachbean;

public class sachdao {
	public ArrayList<sachbean> getsach() throws Exception{
		ArrayList<sachbean>  ds= new ArrayList<sachbean>();
		//b1: ket noi
    	DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="Select * from sach";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	ResultSet rs= cmd.executeQuery();
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String masach=rs.getString("masach");
    		String tenloai=rs.getString("tensach");
    		String tacgia=rs.getString("tacgia");
    		long gia=rs.getLong("gia");
    		String anh=rs.getString("anh");
    		String maloai=rs.getString("maloai");
    		ds.add(new sachbean(masach,tenloai,tacgia,gia,anh,maloai));
    	}
    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
    	return ds;
	}
	public static int xoaSach(String masach) {
		DungChung dc = new DungChung();
		try {
			dc.KetNoi();
		} catch (Exception e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String sql = "delete from sach where masach = ?";
		System.out.println(sql + masach);
		System.out.println(masach);
		try {
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setString(1, masach);
			return cmd.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;

	}
}
