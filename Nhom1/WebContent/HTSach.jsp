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
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">  
    <ul class="nav navbar-nav">
      <li class="active"><a href="HTSach">Trang chủ</a></li>
      <li><a href="giohang">Giỏ hàng(<%=session.getAttribute("dem")==null?0:session.getAttribute("dem") %>)</a></li>
      <li><a href="HTThanhToan">Thanh toán</a></li>
      <li><a href="HTThanhToan">Lịch sử mua hàng</a></li>
      <!-- <li><a href="HomeadminForward">ADmin</a></li> -->
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
			<li><a href="#" data-toggle="modal" data-target="#myModal4">
				<span class="glyphicon glyphicon-log-in"></span> Đăng nhập ADMIN</a></li>
				
			<!-- <input type="submit" value="ĐĂNG NHẬP ADMIN"> -->
    			<!-- Dang nhap -->
			<% khachhangbean kh=(khachhangbean)session.getAttribute("dn");  // tạo kh = biến session dn (đăng nhập) - đã tạo ở 1KiemTraDN.jsp
			if(kh!=null){              
			%>	
				<li><a href="#">Xin chao: <%=kh.getHoten()%></a></li>
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
 
 
 
 <!-- Modal dang nhap user-->
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
             <input  name="but1" type="submit" value="Đăng nhập" class="btn btn-success">
         </form>
        </div>    
      </div>
    </div>
  </div>  
  
  
 <!--   modal dang nhap admin -->
  
  <div class="modal fade" id="myModal4" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống admin</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="KTDNadmin">
             <label> Tên đăng nhập: </label>
                         <input name="txtun1" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass1" type="password" class="form-control">
             <input  name="but1" type="submit" value="Đăng nhập" class="btn btn-success">
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
             <input name="but12" type="submit" value="Đồng ý" class="btn btn-success">
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
             <label class="text-info"> Tên đăng nhập: </label>
             <input class="form-control" placeholder="Tên đăng nhập" name="tendn" type="text" class="form-control">
             <label class="text-info"> Mật khẩu: </label>
             <input class="form-control" placeholder="Mật khẩu" name="matkhau" type="password" class="form-control">
             <label class="text-info"> Họ tên: </label>
             <input class="form-control" placeholder="Họ tên" name="hoten" type="text" class="form-control">
             <label class="text-info"> Địa chỉ: </label>
             <input class="form-control" placeholder="Địa chỉ" name="diachi" type="text" class="form-control">
             <label class="text-info"> Số điện thoại: </label>
             <input class="form-control" placeholder="Số điện thoại" name="sdt" type="text" class="form-control">
             <label class="text-info"> Email: </label>
             <input class="form-control" placeholder="Email" name="email" type="text" class="form-control">
             <br>
             <input name="but13" type="submit" value="Đăng ký" class="btn btn-success">
         </form>
        </div>    
      </div>
    </div>
  </div>
<%
	ArrayList<loaibean> dsloai =(ArrayList<loaibean>)session.getAttribute("dsloai");
	ArrayList<sachbean> ds =(ArrayList<sachbean>)session.getAttribute("dssach");   
  %>
  <!-- Bang sach -->
  <div class="container">
  <h2>Nhà sách</h2>
 
  <p></p>  
<table class="table table-bordered">
	<tr align="center">
		<td>
			<h3>Loại sách</h3>
		</td>
		<td>
			<h3>Sách</h3>
		</td>
		<td>
			<h3>Tìm kiếm sách</h3>
		</td>
	</tr>
    <tr class="table table-bordered" >
		<td valign="top" style="width: 200px">
	        <table class="table table-hover" >
	         	<%if(dsloai!=null){ %>
	         	<%for(loaibean loai: dsloai) {%>
	        <tr>
	          <td>
	            <a class="btn btn-light"  href="HTSach?ml=<%=loai.getMaloai() %> " style="width: 200px"> <%//link :ml được request ở dòng 69 sau đó chạy ở dòng 72 %>
	               <%=loai.getTenloai() %> <%//tên loại sách %>
	            </a>
	          </td>
	        </tr>
	              <%} 
	          }%>
	        </table>  
		</td>
              
                               <!---------------------- Hiển thị sách ----------------->
		<td valign="top">    
	       <table class="table table-hover" >
	            <%
	            if(ds!=null){
	               int n=ds.size();
	               for(int i=0;i<n;i++) { //duyệt mảng theo size của arraylist
	                       sachbean s=ds.get(i);   // get(i) lấy phần tử thứ i trong list
	                       %>
	                       <tr>
					        <td>
					            <img src=<%=s.getAnh() %>><br>
					             <a href="giohang?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&a=<%=s.getAnh()%>">                                    
					                <img src=image_sach/buynow.jpg>
					             </a>
					             <br>
					             <%=s.getTensach() %> <br>
					             <%=s.getTacgia()%> <br>
					             <span>Giá bán: </span><%=s.getGia()%> đ<br>  
					        </td>
	                               <%i++;
	                               if(i<n){
	                               	s=ds.get(i);%>
	                                      <td>
	                                             <img src=<%=s.getAnh() %>><br>
	                                             <a href="giohang?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&a=<%=s.getAnh()%>">
	                                                     <img src=image_sach/buynow.jpg>
	                                             </a>
	                                             <br>
	                                             <%=s.getTensach() %> <br>
	                                             <%=s.getTacgia()%> <br>
	                                             <span>Giá bán: </span><%=s.getGia()%> đ<br>
	                                      </td>
	                               <%} %>
	                               <%i++;
	                               if(i<n){
	                               	s=ds.get(i);
	                               %>
	                                      <td>
	                                              <img src=<%=s.getAnh() %>><br>
	                                              <a href="giohang?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>&a=<%=s.getAnh()%>">
	                                                      <img src=image_sach/buynow.jpg >
	                                              </a>
	                                              <br>
	                                              <%=s.getTensach() %> <br>
	                                              <%=s.getTacgia()%> <br>
	                                              <span>Giá bán: </span><%=s.getGia()%> đ<br>
	                                      </td>
	                               <%} %>
	                       </tr>
	               <%}
	             }%>
	              
	       </table>
		</td>
		<td valign="top" width="200">  
			<%String a1=request.getParameter("txta");
			if(a1==null){a1="";}
			%>
			<form align="right" >
			    <p align="left">Nhập tên sách: </p>
			    <input name="key" value=""> <br> <br>
			    <input  class="btn btn-primary" name="butt2" value="Tìm kiếm" type="submit">                                      
			</form>
		</td>
		
	</tr>
</table>
<!-- ---------------------------Check đăng nhập------------------------------- -->
	<%if(session.getAttribute("khxn")!=null && session.getAttribute("khxn").toString().equals("1")) {%>                              
		<%session.removeAttribute("khxn"); %>
		<script> alert('Bạn cần đăng nhập trước khi sử dụng tính năng này!');</script>
	<%} %>
</div>
</body>
</html>
