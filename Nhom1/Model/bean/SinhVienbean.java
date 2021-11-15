package bean;

public class SinhVienbean {
	private String masv;
	private String hoten;
	private Double dtb;
	private String malop;
	public String getMasv() {
		return masv;
	}
	public void setMasv(String masv) {
		this.masv = masv;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public Double getDtb() {
		return dtb;
	}
	public void setDtb(Double dtb) {
		this.dtb = dtb;
	}
	public String getMalop() {
		return malop;
	}
	public void setMalop(String malop) {
		this.malop = malop;
	}
	public SinhVienbean(String masv, String hoten, Double dtb, String malop) {
		super();
		this.masv = masv;
		this.hoten = hoten;
		this.dtb = dtb;
		this.malop = malop;
	}
	public SinhVienbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String KetQua() {
		return (dtb>=5?"Dat":"Rot");
				
	}
	
	
}
