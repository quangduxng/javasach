<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ADMIN</title>




<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://mdbootstrap.com/live/_MDB/css/customizer.min.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
</head>
<body>
	
		
	</div>
	<!--/.sidebar-->
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="HomeadminForward">
					<em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý </li>
			</ol>
		</div><!--/.row-->
		
		
		
		<div>
	<% if (request.getAttribute("ktnhap")!=null) 
		out.print("<script>alert('trung ma')</script>");
		loaibean loai = (loaibean)request.getAttribute("chon");
		%>
	<div class="container">
		<br>
		<form >
		<% if(loai != null){ %>
			<label>Mã loại</label>
			<input type="text" name="txtmaloai" value="<%=loai.getMaloai()%>"> <br>
			<label>Tên loại</label>
			<input type="text" name="txttenloai" value="<%=loai.getTenloai()%>"> <br>
			<input type="submit" name="btnthem" value="Them" class="btn btn-success"/>
			<input type="submit" name="btnsua" value="Sua" class="btn btn-primary"/>
			<%}else{ %>
			<label>Mã loại</label>
			<input type="text" name="txtmaloai" value=""> <br>
			<label>Tên loại</label>
			<input type="text" name="txttenloai" value=""> <br>
			<input type="submit" name="btnthem" value="Them" class="btn btn-success"/>
			<input type="submit"  name="btnsua" value="Sua" class="btn btn-primary"/>
			<%} %>
		</form>
		<br>
		<table class="table table-hover table-border">
		<%ArrayList<loaibean> ds = (ArrayList<loaibean>) request.getAttribute("dsloai"); 
		for(loaibean l:ds){%>
			<tr>
				<td>
					<%=l.getMaloai() %>
				</td>
				<td>
					<%=l.getTenloai() %>
				</td>
				<td>
					<a href="QuanlyloaiController?mlchon=<%=l.getMaloai() %>"> <button class="btn btn-success">Chọn</button></a>
					<a href="QuanlyloaiController?mlxoa=<%=l.getMaloai() %>"><button class="btn btn-success">Xóa</button></a>
				</td>
			</tr>
		<%} %>
		</table>
	</div>
	</div>		
	</div>	<!--/.main-->
</body>
</html>