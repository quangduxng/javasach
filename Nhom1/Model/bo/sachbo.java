package bo;

import java.util.ArrayList;

import bean.loaibean;
import bean.sachbean;
import dao.loaidao;
import dao.sachdao;

public class sachbo {
	sachdao sdao= new sachdao();
	public ArrayList<sachbean> getsach() throws Exception{
		return sdao.getsach();
	}
	
	 public ArrayList<sachbean> TimLoai(ArrayList<sachbean> ds,String maloai) throws Exception{
    	 ArrayList<sachbean> tam= new ArrayList<sachbean>();
    	 for(sachbean s: ds)
    		 if(s.getMaloai().equals(maloai))
    			   tam.add(s);
    	 return tam;
     }
	
	public ArrayList<sachbean> Tim(ArrayList<sachbean> ds,String key) throws Exception{
   	 ArrayList<sachbean> tam= new ArrayList<sachbean>();
   	 for(sachbean s: ds)
   		 if(s.getTensach().toLowerCase().contains(key.toLowerCase()) ||
   				 s.getTacgia().toLowerCase().contains(key.toLowerCase()))
   			   tam.add(s);
   	 return tam;
    }	
	
	public int DemLoai(ArrayList<sachbean> ds,String maloai) throws Exception{
    	int d=0;
    	 for(sachbean s: ds)
    		 if(s.getMaloai().equals(maloai))
    			d++;
    	 return d;
     }
	public String TimAnh(ArrayList<sachbean> ds,String masach) throws Exception{
    	String m="haha";
    	 for(sachbean s: ds)
    		 if(s.getMasach().equals(masach))
    			m=s.getAnh();
    	 return m;
     }

}
