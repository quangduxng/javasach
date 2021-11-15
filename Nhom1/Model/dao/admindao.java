package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;

public class admindao {
	public adminbean getadmin(String un,String pass) throws Exception {
		DungChung dc= new DungChung();
    	dc.KetNoi();
    	//B2: Lay du lieu ve
    	String sql="select * from DangNhap where TenDangNhap=? and MatKhau=? and Quyen=1";	
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	cmd.setString(1, un);
    	cmd.setString(2, pass);
    	ResultSet rs= cmd.executeQuery();
    	
    	if(rs.next()==false)
    		return null;
    	else {
    		String tendn=rs.getString("TenDangNhap");
    		String matkhau=rs.getString("MatKhau");
    		adminbean ad= new adminbean(tendn,matkhau);
    		return ad;
    	}
	}
}
