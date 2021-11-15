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
<%      khachhangbo khb= new khachhangbo(); %>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">  
    <ul class="nav navbar-nav">
      <li class="active"><a href="HTSach.jsp">Trang chủ</a></li>
      <li><a href="giohang.jsp">Giỏ hàng</a></li>
      <li><a href="tt.jsp">Thanh toán</a></li>
      <li><a href="lichsu.jsp">Lịch sử mua hàng</a></li>
    </ul>
        <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-user"></span> Đăng ký</a></li>
                <% khachhangbean kh=(khachhangbean)session.getAttribute("dn");  // tạo kh = biến session dn (đăng nhập) - đã tạo ở 1KiemTraDN.jsp
                if(kh!=null){              
                %>
                 <li><a href="#">Xin chao: <%=kh.getHoten()%> </a></li>
                <%}else{ %>
                        <li><a href="#" data-toggle="modal" data-target="#myModal">
                        <span class="glyphicon glyphicon-log-in"></span> Đăng nhập</a></li>
                        <% if(session.getAttribute("kt")!=null && session.getAttribute("kt").toString().equals("0")){%>
                                <script> alert('Đăng nhập sai! Vui lòng đăng nhập lại');</script>
                                

</script>
                         
                        <%}%> <%//1bug sau khi dn sai, vi da chuyen sang trang 1KiemTraDN va tao bien dn nen khi load trang lai se hien len thong bao nay %>
                <%}%>
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
             <input name="but1" type="submit" value="Đăng nhập" class="btn-primary">
         </form>
        </div>    
      </div>
    </div>
  </div>
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
  <!-- Bang sach -->
  <div class="container">
  <h2>Nhà sách</h2>
 
  <p></p>  
<table>
        <tr>
                <td valign="top">
                        <table class="table table-hover">
                                <%for(loaibean loai: lbo.getloai()) {%>
                    <tr>
                      <td>
                        <a href="HTSach.jsp?ml=<%=loai.getMaloai() %>"> <%//link :ml được request ở dòng 69 sau đó chạy ở dòng 72 %>
                           <%=loai.getTenloai() %> <%//tên loại sách %>
                        </a>
                      </td>
                    </tr>
                                <%} %>
                        </table>  
                </td>
               
                                <!---------------------- Hiển thị sách ----------------->
                <td valign="top" width="600">    
                        <table class="table table-hover">
                                <%
                                int n=ds.size();
                                for(int i=0;i<n;i++) { //duyệt mảng theo size của arraylist
                                        sachbean s=ds.get(i);   // get(i) lấy phần tử thứ i trong list
                                        %>
                                        <tr>
                        <td>
                            <img src=image_sach/<%=s.getAnh() %>><br>
                             <a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>">                                    
                                <img src=buynow.jpg width="18px" height="18px">Mua hàng
                             </a>
                             <br>
                             <%=s.getTensach() %> <br>
                             <%=s.getTacgia()%> <br>
                             <span>Giá bán: </span><%=s.getGia()%> đ<br>  
                        </td>
                                                <%i++;
                                                if(i<n){
                                                        s=ds.get(i);
                                                %>
                                                        <td>
                                                                <img src=image_sach/<%=s.getAnh() %>><br>
                                                                <a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>">
                                                                        <img src=buynow.jpg width="18px" height="18px">Mua hàng
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
                                                                <img src=image_sach/<%=s.getAnh() %>><br>
                                                                <a href="giohang.jsp?ms=<%=s.getMasach()%>&ts=<%=s.getTensach()%>&gia=<%=s.getGia()%>&tg=<%=s.getTacgia()%>">
                                                                        <img src=buynow.jpg width="18px" height="18px">Mua hàng
                                                                </a>
                                                                <br>
                                                                <%=s.getTensach() %> <br>
                                                                <%=s.getTacgia()%> <br>
                                                                <span>Giá bán: </span><%=s.getGia()%> đ<br>
                                                        </td>
                                                <%} %>
                                        </tr>
                                <%} %>
                        </table>
                </td>
                <td valign="top" width="200">  
               <p>Tìm kiếm</p>
                                <%String a1=request.getParameter("txta");
                                if(a1==null){a1="";}
                                %>
                                <form action="HTSach" >
                                        <p>Nhập tên sách: </p>
                                        <input name="key" value="<%if(key!=null){out.print(key);}%>"> <br> <br>
                                    <input name="butt2" value="Đồng ý" type="submit">                                      
                                </form>
                </td>
        </tr>
</table>
</div>
</body>
</html>
