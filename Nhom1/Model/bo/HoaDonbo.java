package bo;

import java.util.ArrayList;

import bean.HoaDonbean;
import bean.sachbean;
import dao.ChiTietHoaDondao;
import dao.HoaDondao;

public class HoaDonbo {
	HoaDondao hddao= new HoaDondao();
	ChiTietHoaDondao ctdao= new ChiTietHoaDondao();
	 public ArrayList<HoaDonbean> GetHd(String makh) throws Exception {
		return hddao.gethd(makh);
	}
	 
	 public void ThemHd(String makh) throws Exception {
			hddao.ThemHD(makh, true);	
		} 
}
