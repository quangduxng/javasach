<%@page import="bean.GioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <a class="navbar-brand" href="#">NHÀ SÁCH MINH KHAI</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="HomeForward">TRANG CHỦ</a>
                    </li>
                    <%if (session.getAttribute("sessionTenKH")==null){ %>
	                    <li>
	                        <a href="Dangkyforward">ĐĂNG K&#221;</a>
	                    </li>
	                    <li>
	                        <a href="Dangnhapforward">ĐĂNG NHẬP</a>
	                    </li>
	                    <%} else {%>
	                    <li>
	                        <a href="#"><span style="color:green">Xin chào</span> :<span style="color:yellow"> <strong> <%=session.getAttribute("sessionTenKH") %></strong></span></a>
	                    </li>
	                    <li>
	                        <a href="DangxuatController">Đăng xuất</a>
	                    </li>
	                    <li>
	                        <a href="LichsumuahangForward">Lịch sử mua hàng</a>
	                    </li>
	                    <li>
		                    <a href="Giohangforward" style="color: white; font-weight: bold; text-decoration: none;">
		                    <%ArrayList<GioHangbean> gh= (ArrayList<GioHangbean>)session.getAttribute("dsgiohang"); %>
	                            <img src="images/giohang.gif" />Giỏ Hàng (<%=gh==null?"0":gh.size() %>)</a>
                        </li>
	                    <%} %>
	                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
</body>
</html>