package dao;

import java.util.ArrayList;

import bean.SinhVienbean;

public class SinhViendao {
		public ArrayList<SinhVienbean> getSv(){
	    	 ArrayList<SinhVienbean> ds= new ArrayList<SinhVienbean>();
	    	 ds.add(new SinhVienbean("Sv1", "Nguyễn Nam Hải 1", 7.5, "K42A"));
	    	 ds.add(new SinhVienbean("Sv2", "Nguyễn Nam Hải 2", 7.5, "K42A"));
	    	 ds.add(new SinhVienbean("Sv3", "Nguyễn Nam Hải 3", 7.5, "K42A"));
	    	 ds.add(new SinhVienbean("Sv4", "Nguyễn Nam Hải 4", 7.5, "K42B"));
	    	 ds.add(new SinhVienbean("Sv5", "Nguyễn Nam Hải 5", 7.5, "K42B"));
	    	 ds.add(new SinhVienbean("Sv6", "Nguyễn Nam Hải 6", 7.5, "K42C"));
	    	 ds.add(new SinhVienbean("Sv7", "Nguyễn Nam Hải 7", 7.5, "K42D"));
	    	 ds.add(new SinhVienbean("Sv8", "Nguyễn Nam Hải 8", 7.5, "K42D"));
	    	 return ds;
	     }
}