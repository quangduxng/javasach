package bean;

public class khachhangbean {
	private String makh;
    private String hoten;
    private String diachi;
    private String sdt;
    private String email;
    private String tendn;
    private String matkhau;
	public String getMakh() {
		return makh;
	}
	public void setMakh(String makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public String getSdt() {
		return sdt;
	}
	public void setSdt(String sdt) {
		this.sdt = sdt;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	
	public khachhangbean(String makh, String hoten, String diachi, String sdt, String email, String tendn,
			String matkhau) {
		super();
		this.makh=makh;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sdt = sdt;
		this.email = email;
		this.tendn = tendn;
		this.matkhau = matkhau;
	}
	public khachhangbean(String hoten, String diachi, String sdt, String email, String tendn,
			String matkhau) {
		super();
		this.hoten = hoten;
		this.diachi = diachi;
		this.sdt = sdt;
		this.email = email;
		this.tendn = tendn;
		this.matkhau = matkhau;
	}
	public khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
    

}
