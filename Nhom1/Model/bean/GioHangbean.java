 package bean;

import java.sql.Date;

public class GioHangbean {
    private String masach;
    private int makh;
    private String tensach;
    private String tacgia;
    private String anh;
	private Long gia;
    private Long slmua;
    private Long thanhtien;
    private Date NgayMua;
    private int DaMua;
    
    
    	
		public int getDaMua() {
		return DaMua;
	}
	public void setDaMua(int daMua) {
		DaMua = daMua;
	}
		public String getMasach() {
                return masach;
        }
        public void setMasach(String masach) {
                this.masach = masach;
        }
        
        public int getMakh() {
			return makh;
		}
		public void setMakh(int makh) {
			this.makh = makh;
		}
		public String getTensach() {
                return tensach;
        }
        public void setTensach(String tensach) {
                this.tensach = tensach;
        }
        public String getTacgia() {
                return tacgia;
        }
        public void setTacgia(String tacgia) {
                this.tacgia = tacgia;
        }
        public String getAnh() {
    		return anh;
    	}
    	public void setAnh(String anh) {
    		this.anh = anh;
    	}
        public Long getGia() {
                return gia;
        }
        public void setGia(Long gia) {
                this.gia = gia;
        }
        public Long getSlmua() {
                return slmua;
        }
        public void setSlmua(Long slmua) {
                this.slmua = slmua;
        }
        public Long getThanhtien() {
                return thanhtien;
        }
        public void setThanhtien(Long thanhtien) {
                this.thanhtien = thanhtien;
        }
        
   
        public Date getNgayMua() {
			return NgayMua;
		}
		public void setNgayMua(Date ngayMua) {
			NgayMua = ngayMua;
		}
		public GioHangbean(String masach,int makh, String tensach, String tacgia,String anh, Long gia, Long slmua,Date NgayMua,int DaMua) {
                super();
                this.masach = masach;
                this.makh=makh;
                this.tensach = tensach;
                this.tacgia = tacgia;
                this.anh=anh;
                this.gia = gia;
                this.slmua = slmua;
                this.thanhtien=slmua*gia;
                this.NgayMua=NgayMua;
                this.DaMua=DaMua;
        }
		
        public GioHangbean(String masach, String tensach, String tacgia, String anh, Long gia, Long slmua,
				Long thanhtien) {
			super();
			this.masach = masach;
			
			this.tensach = tensach;
			this.tacgia = tacgia;
			this.anh = anh;
			this.gia = gia;
			this.slmua = slmua;
			this.thanhtien = thanhtien;
		}
        // hoadon.makh, ChiTietHoaDon.MaSach, sach.tensach, sach.anh,ChiTietHoaDon.SoLuongMua , ChiTietHoaDon.MaHoaDon, hoadon.NgayMua
        
		public GioHangbean() {
                super();
                // TODO Auto-generated constructor stub
        }
		public GioHangbean(int makh, String tensach, String tacgia, String anh, Long slmua, int daMua, Date ngayMua) {
			super();
			this.makh = makh;
			this.tensach = tensach;
			this.tacgia = tacgia;
			this.anh = anh;
			this.slmua = slmua;
			NgayMua = ngayMua;
			DaMua = daMua;
		}
		public GioHangbean(String tensach, String tacgia, String anh, Long gia, Long slmua, Long thanhtien,
				Date ngayMua) {
			super();
			this.tensach = tensach;
			this.tacgia = tacgia;
			this.anh = anh;
			this.gia = gia;
			this.slmua = slmua;
			this.thanhtien = thanhtien;
			NgayMua = ngayMua;
		}
		
		
       
}