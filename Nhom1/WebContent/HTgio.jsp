
<%@page import="bean.ghbean"%>
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
  <script src="https://code.jquery.com/jquery-3.5.0.js"></script>



  
</head>
<body>
<%
	response.setCharacterEncoding("utf-8");		//respon về tiếng Việt
	request.setCharacterEncoding("utf-8");		//request về tiếng Việt
%>
<%
	loaibo lbo= new loaibo();
	sachbo sbo= new sachbo();
	String ml= request.getParameter("ml");
	String key= request.getParameter("key");
	ArrayList<sachbean> ds= sbo.getsach(); //tao ds sach
	int x=0;
	if(ml!=null){
		ds= sbo.TimLoai(ds, ml); //sửa danh sách của sách thành các sách có mã loại = ml
		x=sbo.DemLoai(ds, ml);
	}
	else{
		if(key!=null) ds=sbo.Tim(ds, key); //tìm kiếm sách
		
	}
%>
<!-- ---Hien thi so sach--- -->
  		<%
  			ArrayList<sachbean> ds00= sbo.getsach(); //tao ds sach
  		%>
		<%
			GioHangbo gh00;
				if(session.getAttribute("gh")!=null){
			gh00=(GioHangbo) session.getAttribute("gh");
			session.setAttribute("soSach", (int)gh00.dem());
				}
				int soSach1;
				if(session.getAttribute("soSach")!=null){
			soSach1=(int)session.getAttribute("soSach");
				}else{
			soSach1=0;
				}
		%>	
<!-- ---Hien thi so sach--- -->
<%
	khachhangbo khb= new khachhangbo();
%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container-fluid">  
    <ul class="nav navbar-nav">
      <li class="navbar-brand"><a href="HTSach">Trang chủ</a></li>
      <li class="navbar-brand" ><a href="giohang.jsp">Giỏ hàng (<%=soSach1%>)</a></li>
      <li class="navbar-brand"><a href="ThanhToan.jsp">Thanh toán</a></li>
      <li class="navbar-brand"><a href="HTThanhToan">Lịch sử mua hàng</a></li>
      
    </ul>
    	
	<ul class="nav navbar-nav navbar-right">
     	
		<%
     				khachhangbean kh=(khachhangbean)session.getAttribute("dn");	// tạo kh = biến session dn (đăng nhập) - đã tạo ở 1KiemTraDN.jsp
     			     					if(kh!=null){
     			%>
		 <li class="navbar-brand"><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
		 <li class="navbar-brand" ><a href="DangXuat?action=Logout">Đăng Xuất</a></li>
		<%
			}else{
		%>
			<li>
			<a href="#" data-toggle="modal" data-target="#myModal">
			<span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a>
			
			 </li>
		
			<%
						if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){
					%>
				<script>alert('Đăng nhập sai! Vui lòng đăng nhập lại');</script> 
             		 
			<%
              		 				}
              		 			%> <%
 	//1bug sau khi dn sai, vi da chuyen sang trang 1KiemTraDN va tao bien dn nen khi load trang lai se hien len thong bao nay
 %>
		<%
			}
		%>
    </ul>
</div>
</nav>
 <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-sm">
      <div class="modal-content">
        <div class="modal-header">
		 <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Đăng nhập hệ thống</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="1KiemTraDN.jsp">
             <label> Tên đăng nhập: </label>
 			 <input name="txtun" type="text" class="form-control">
             <label> Mật khẩu: </label>
             <input name="txtpass" type="password" class="form-control">
             <input class="btn btn-success btn-block"   name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>     
      </div>
    </div>
  </div>

   <p></p>
  <!-- Bang sach -->
  <div class="container">

  <h2>Nhà sách
   </h2>

<table >
	<tr>
		<td valign="top"> 
			<table class="table table-hover">
				<%
					for(loaibean loai: lbo.getloai()) {
				%>
                    <tr>
                      <td width="100%">
                        <a style="color: black" class="btn btn-light" href="HTSach?ml=<%=loai.getMaloai()%>"> <%
 	//link :ml được request ở dòng 69 sau đó chạy ở dòng 72
 %>
                           <%=loai.getTenloai()%> <%
 	//tên loại sách
 %>
                        </a>
                      </td>
                    </tr>
				<%
					}
				%>
			</table>  
		</td>
		
				<!-- Hiển thị sách -->
		<td valign="top" width="600" >     

		<!-----------------------Gio Hang----------------------->
		<table class="table table-bordered">
		<tr>
			<td align="center">
				Sách
			</td>

			<td align="center">
				Thông tin sách
				
			</td>
			
			
		</tr>		
		<%
					ArrayList<sachbean> ds1= sbo.getsach(); //tao ds sach
				%>
		<%
			GioHangbo gh1;
				long i=0;
				if(session.getAttribute("gh")!=null){
			gh1=(GioHangbo) session.getAttribute("gh");
		%>
			<%
				for(ghbean g1: gh1.ds){
			%>
				<tr>
					<td height="80px">
						<img src= <%=sbo.TimAnh(ds1, g1.getMasach())%> width="100%" height="100%" >
					</td>
					
					<td valign="bottom">
						
					<form method="post" action="EditSach.jsp">
					<%out.print(g1.getTensach());%>
						<br>							
						<%out.print("Giá: "+g1.getGia() +"đ x ");%> 
						<input name="slmua" value="<%=g1.getSlmua() %>" type="number" min="1" style="width:40px"> 
						<input name="MaSach" value="<%=g1.getMasach()%>" type="hidden"> 
						<input class="btn btn-success" name="sub0" value="Cập nhật" type="submit"> 
						<input class="btn btn-danger" name="sub1" value="Xoá" type="submit">										
							
					</form>
					
					
				</tr>	
			<%}%>
			<%i=gh1.TongTien();%>
					<form method="post" action="EditSach.jsp">
														
						 <input class="btn btn-danger" type="submit" name="xoaall" value="Xóa tất Cả">				
					</form>
							
		<%}%>				
		</table>
		<form align="right" method="post" action="LSMH">
					<input class="btn btn-danger" name="XNDatMua" value="Xác nhận đặt mua" type="submit">
				</form>
		
		<div style="width:auto;border-bottom:#d6d6d6 1px solid;"> &nbsp;</div>
		<p>Tổng tiền: <%=i%></p>
			<form action="thanhtoan" method="post"> 
			<a class="btn btn-info"  type="submit" name="ttoan">Thanh Toán</a>
			</form>
		</td>
		
	</tr>
	
</table>
<table></table>
</div>
</body>
</html>