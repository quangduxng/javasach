package bo;
 
import java.util.ArrayList;
 
import bean.ghbean;
import bean.sachbean;
 
public class GioHangbo {
        public ArrayList<ghbean> ds= new ArrayList<ghbean>();
        public void Them(String masach, String tensach, String tacgia,String anh, Long gia, Long slmua) {
            //Kiem tra xem sach nay da co chua, neu co thi tang soluong
            for(ghbean g: ds)
                      if(g.getMasach().equals(masach)) {
                              g.setSlmua(g.getSlmua()+slmua);
                              g.setThanhtien(g.getSlmua()*g.getGia());
                              return;
                      }
            ds.add(new ghbean(masach, tensach, tacgia,anh ,gia, slmua));
    }
        public void xoa(String masach) {
                for(ghbean g: ds)
                          if(g.getMasach().equals(masach)) {
                                  ds.remove(g);
                                  break;
                          }
        }
        public void xoaall() {
            
            
            ds.removeAll(ds);
          
    
}
       
       
        public void SetSL(String masach,Long slmua) {
            //Kiem tra xem sach nay da co chua, neu co thi tang soluong
            for(ghbean g: ds)
                      if(g.getMasach().equals(masach)) {
                              g.setSlmua(slmua);
                              g.setThanhtien(g.getSlmua()*g.getGia());
                              return;
                      }
        }        
       
        public Long TongTien() {
                long s=(long)0;
                for(ghbean g: ds)
                        s+=g.getThanhtien();
                return s;
        }
        
		 public int dem() {
			return ds.size();
		}
       
} 
