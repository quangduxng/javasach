package bean;

public class adminbean {
	private String tendn;
    private String matkhau;
	public String getTendn() {
		return tendn;
	}
	public void setTendn(String tendn) {
		this.tendn = tendn;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}
	public adminbean(String tendn, String matkhau) {
		super();
		this.tendn = tendn;
		this.matkhau = matkhau;
	}
	public adminbean() {
		super();
		// TODO Auto-generated constructor stub
	}
    
}
