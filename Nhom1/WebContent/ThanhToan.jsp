<%@page import="bean.HoaDonbean"%>
<%@page import="bean.khachhangbean"%>
<%@page import="bo.khachhangbo"%>
<%@page import="bean.loaibean"%>
<%@page import="bean.sachbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.sachbo"%>
<%@page import="bo.loaibo"%>
<%@page import="java.util.Calendar"%>
<%@page import="bean.GioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.GioHangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Sach</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%      response.setCharacterEncoding("utf-8");         //respon về tiếng Việt
        request.setCharacterEncoding("utf-8");          //request về tiếng Việt

%>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">  
    <ul class="nav navbar-nav">
      <li class="active"><a href="HTSach">Trang chủ</a></li>
      <li><a href="giohang">Giỏ hàng(<%=session.getAttribute("dem")==null?0:session.getAttribute("dem") %>)</a></li>
      <li><a href="ThanhToan.jsp">Thanh toán</a></li>
      <li><a href="lichsu.jsp">Lịch sử mua hàng</a></li>
    </ul>
        <ul class="nav navbar-nav navbar-right">
      		<!-- dang ky -->
			<%  // tạo kh = biến session dn (đăng nhập) - đã tạo ở 1KiemTraDN.jsp
    			
			if(session.getAttribute("ktdky")!=null && session.getAttribute("ktdky").toString().equals("0")){ //check null truoc%> 
				<script> alert('đăng ký thành công');</script>
              	<%session.removeAttribute("dky"); %>
              	<%session.removeAttribute("ktdky"); %>
			<%}%>
			<% if(session.getAttribute("ktdky")!=null && session.getAttribute("ktdky").toString().equals("1")){ //check null truoc%>
				<script> alert('Đăng ký không thành công! \nTên đăng nhập đã được sử dụng, hãy chọn tên khác');</script>                      
				<%session.removeAttribute("ktdky"); %>	
				<%session.removeAttribute("dky"); %>
			<%}%>

    			<!-- Dang nhap -->
			<% khachhangbean kh=(khachhangbean)session.getAttribute("dn");  // tạo kh = biến session dn (đăng nhập) - đã tạo ở 1KiemTraDN.jsp
			if(kh!=null){              
			%>
				<li><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal1">
        		<span class="glyphicon glyphicon-log-in"></span> Đăng xuất</a></li>
			<%}else{ %>
				<li><a href="#" data-toggle="modal" data-target="#myModal2">
				<span class="glyphicon glyphicon-log-in"></span> Đăng ký</a></li>
				<li><a href="#" data-toggle="modal" data-target="#myModal">
				<span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
					<% if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){ //check null truoc%>
                		<script> alert('Đăng nhập sai! Vui lòng đăng nhập lại');</script>                      
         				<%session.removeAttribute("kt"); %>	
        			<%}%> <%//1bug sau khi dn sai, vi da chuyen sang trang 1KiemTraDN va tao bien dn nen khi load trang lai se hien len thong bao nay %>
			<%}%>
    </ul>
</div>
</nav>
 
 
 
 <!-- Modal dang nhap-->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="KiemTraDN">
             <label> Tên đăng nhập: </label>
                         <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass" type="password" class="form-control">
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>    
      </div>
    </div>
  </div>  
  
<!-- Modal1 dang xuat -->
  <div class="modal fade" id="myModal1" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Nhấn nút đồng ý để đăng xuất.</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="DangXuat">
             <input name="but12" type="submit" value="Đồng ý" class="btn-primary">
         </form>
        </div>    
      </div>
    </div>
  </div>
<!-- Modal2 dang ky-->
  <div class="modal fade" id="myModal2" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng ký tài khoản</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="DangKy">
             <label> Tên đăng nhập: </label>
             <input name="tendn" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="matkhau" type="password" class="form-control">
             <label> Họ tên: </label>
             <input name="hoten" type="text" class="form-control">
             <label> Địa chỉ: </label>
             <input name="diachi" type="text" class="form-control">
             <label> Số điện thoại: </label>
             <input name="sdt" type="text" class="form-control">
             <label> Email: </label>
             <input name="email" type="text" class="form-control">
             <br>
             <input name="but13" type="submit" value="Đăng ký" class="btn-primary">
         </form>
        </div>    
      </div>
    </div>
  </div>
<%
	ArrayList<HoaDonbean> dshoadon=(ArrayList<HoaDonbean>)session.getAttribute("dsHoaDon");
  %>
  <!-- Bang sach -->
  <div class="container">
  <h2>Nhà sách</h2>
 
  <p></p>  
<table class="table table-bordered">
    <tr class="table table-bordered" >
		<td valign="top" style="width: 1000px">
	        <table class="table table-bordered" style="width: 1000px">
	         	<%if(dshoadon!=null){ %>
	         	<%for(HoaDonbean hd: dshoadon) {%>
			        <tr>
			          <td>
			          	<p><span>Mã hóa đơn: </span><%=hd.getMaHoaDon()%></p>
			            <a class="btn btn-info"  href="lichsumuahang.jsp?mhd=<%=hd.getMaHoaDon()%> " style="width: 1000px"> <%//link :ml được request ở dòng 69 sau đó chạy ở dòng 72 %>
			            <p><span>Ngày mua: </span><%=hd.getNgayMua()%></p>			            
			            <%boolean s=hd.getDaMua(); %>
			            <p><span> </span><%=hd.getDaMua()?"Đã mua": "Chưa mua"%></p>
			            
			           
			          
			            </a>
			          </td>
			        </tr>
			              <%} 
			          }%>
	        </table>  
		</td>
              
</table>
</div>
</body>
</html>
