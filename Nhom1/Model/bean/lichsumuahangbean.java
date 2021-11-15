package bean;

public class lichsumuahangbean {
	private String MaSach;
	private Long SoluongMua;
	private String NgayMua;
	public String getMaSach() {
		return MaSach;
	}
	public void setMaSach(String maSach) {
		MaSach = maSach;
	}
	public Long getSoluongMua() {
		return SoluongMua;
	}
	public void setSoluongMua(Long soluongMua) {
		SoluongMua = soluongMua;
	}
	public String getNgayMua() {
		return NgayMua;
	}
	public void setNgayMua(String ngayMua) {
		NgayMua = ngayMua;
	}
	public lichsumuahangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public lichsumuahangbean(String maSach, Long soluongMua, String ngayMua) {
		super();
		MaSach = maSach;
		SoluongMua = soluongMua;
		NgayMua = ngayMua;
	}
	public lichsumuahangbean(String maSach, Long soluongMua) {
		super();
		MaSach = maSach;
		SoluongMua = soluongMua;		
	}
	
	
}
