package bo;

import java.util.ArrayList;

import bean.adminbean;
import bean.khachhangbean;
import bean.sachbean;
import dao.admindao;
import dao.khachhangdao;


public class khachhangbo {
		khachhangdao khdao= new khachhangdao();
		admindao	adao = new admindao();
//		public ArrayList<khachhangbean> getkh(){
//			return khdao.getkh();
//		}
		
		 public khachhangbean ktdn(String makh,String password) throws Exception {
			return khdao.getkh(makh, password);
		}
		
		 public khachhangbean dangky(String hoten, String diachi, String sdt, String email, String tendn, String matkhau) throws Exception {
				return khdao.DangKy(hoten, diachi, sdt, email, tendn, matkhau);
		}
		 public adminbean ktadmin(String un,String pass) throws Exception {
				return adao.getadmin(un, pass);
			}
		
}
	    	
