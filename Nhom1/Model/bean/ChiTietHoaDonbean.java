package bean;

public class ChiTietHoaDonbean {
	private String MaChiTietHD;
    private String MaSach;
    private Long SoluongMua;
    private String MaHoaDon;
	public String getMaChiTietHD() {
		return MaChiTietHD;
	}
	public void setMaChiTietHD(String maChiTietHD) {
		MaChiTietHD = maChiTietHD;
	}
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
	public String getMaHoaDon() {
		return MaHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		MaHoaDon = maHoaDon;
	}
	public ChiTietHoaDonbean(String maChiTietHD, String maSach, Long soluongMua, String maHoaDon) {
		super();
		MaChiTietHD = maChiTietHD;
		MaSach = maSach;
		SoluongMua = soluongMua;
		MaHoaDon = maHoaDon;
	}
	public ChiTietHoaDonbean(String maSach, Long soluongMua, String maHoaDon) {
		super();
		MaSach = maSach;
		SoluongMua = soluongMua;
		MaHoaDon = maHoaDon;
	}
	public ChiTietHoaDonbean() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}
