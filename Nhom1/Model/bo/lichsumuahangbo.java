package bo;

import java.util.ArrayList;

import bean.ghbean;
import bean.lichsumuahangbean;
import dao.lichsumuahangdao;



public class lichsumuahangbo {
	
	lichsumuahangdao ds= new lichsumuahangdao();
	public ArrayList<lichsumuahangbean> getLS(String makh) throws Exception{
		return ds.getLS(makh);
	}
	public ArrayList<lichsumuahangbean> getmahd(String MaHD) throws Exception{
		return ds.getMahd(MaHD);
		
	}
}
