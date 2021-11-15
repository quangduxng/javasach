package bo;

import java.util.ArrayList;

import bean.ChiTietHoaDonbean;
import dao.ChiTietHoaDondao;

public class ChiTietHoaDonbo {
	ChiTietHoaDondao ctd= new ChiTietHoaDondao();
	public ArrayList<ChiTietHoaDonbean> getCT(String maHoaDon) throws Exception{
		return ctd.getCTHD(maHoaDon);
	}
	
}
