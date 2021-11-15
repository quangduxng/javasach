<%@page import="bean.khachhangbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/live/_MDB/css/customizer.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<title>ADMIN</title>
	
	
	<!--Custom Font-->
	<link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">
</head>
<body>
	
	
		
		
		
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="HomeadminForward">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý </li>
			</ol>
		</div><!--/.row-->
		
		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header"><%=request.getAttribute("msgtieude") %></h3>
				
			</div>
		</div><!--/.row-->
		
		<div>
		<%ArrayList<khachhangbean> dskh =(ArrayList<khachhangbean>) request.getAttribute("dskh");%>
			<table id="dataTable" border="1" class="table table-hover">
				<thead>
					<tr>
						<th>Mã tài khoản</th>
						<th>Họ tên khách hàng</th>
						<th>Địa chỉ</th>
						<th>Số điện thoại</th>
						<th>Email</th>
						<th>Tên đăng nhập</th>
						<th>Mật khẩu</th>
						<th> </th>
					</tr>
				</thead>
					<%for (khachhangbean kh : dskh){ %>
					<tr>
						<td><%=kh.getMakh() %></td>
						<td><%=kh.getHoten() %></td>
						<td><%=kh.getDiachi() %></td>
						<td><%=kh.getSdt() %></td>
						<td><%=kh.getEmail() %></td>
						<td><%=kh.getTendn() %></td>
						<td><%=kh.getMatkhau() %></td>
						
						<%-- <td><%=kh.isQuyen()==true?"Admin":"Khách hàng" %></td> --%>
						<td><a href="XoaTaiKhoan?makh=<%=kh.getMakh()%>">Xóa</a></td>
					</tr>
					<%} %>
				<tbody>
						
				</tbody>
			
			</table>
			
			
		</div>
		
		
		
		
		
	</div>	<!--/.main-->
	
	
	
	
			
</body>
</html>