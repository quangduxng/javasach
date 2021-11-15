<%@page import="bean.loaibean"%>
<%@page import="dao.loaidao"%>
<%@page import="bean.sachbean"%>
<%@page import="bean.khachhangbean"%>
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
	<link href="/Nhom1/src/css/styles.css" rel="stylesheet">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!--Custom Font-->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<script src="http://cdn.ckeditor.com/4.6.2/standard-all/ckeditor.js"></script>
</head>
<body>


	

		
	</div>
	<!--/.sidebar-->



	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		<div class="row">
			<ol class="breadcrumb">
				<li><a href="HomeadminForward"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h1 class="display-3">Thêm sách mới</h1>
				<br>
			</div>

		</div>
		<!--/.row-->
		<%
			loaidao loaidao1 = new loaidao();
			ArrayList<loaibean> lsLoai = loaidao1.getloai();
		%>

		<div class="container" style="padding-bottom: 50px">
			<div style="min-height: 78vh">
				<br>
				<h2 style="color:red"><%=request.getAttribute("msg")!=null?request.getAttribute("msg"):""%></h2> 
				<form action="uploadSachController" method="post" enctype="multipart/form-data">

					<label for="masach">Mã sách: </label> <input type="text"
						name="masach" id="masach"> <br> <br> <label
						for="name">Tên sách: </label>
						 <input type="text" name="tensach" id="tensach"> <br> <br> <label for="price">Giá:
					</label> <input type="number" name="gia" id="gia"> <br> <br>
					<label for="loai">Loại sách: </label> <select value="Chinh tri"
						style="display: block !important;" class="form-control"
						name="maloai">
						<%
							for (loaibean l : lsLoai) {
						%>
						<option value="<%=l.getMaloai()%>"><%=l.getTenloai()%></option>
						<%
							}
						%>
					</select> <br> 
					<label for="desc">Tác giả: </label> <input
						type="text" name="tacgia" id="tacgia"> <br> <br> 
						<label for="star">Số lượng: </label> <br> <input type="number" min="1"
						max="2000" name="soluong" id="soluong"> <br> <br> 
						<label	for="image">Ảnh: </label> <br> <input type="file" name="photo"id="photo"> <br> <br> <br> 
						
				
					<button class="btn btn-info" type="submit">Thêm sách</button>

				</form>
				
			</div>
		</div>

	</div>
	


	



</body>
</html>