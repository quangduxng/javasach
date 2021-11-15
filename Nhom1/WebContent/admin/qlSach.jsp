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
<link href="admin/css/bootstrap.min.css" rel="stylesheet">
<link href="admin/css/font-awesome.min.css" rel="stylesheet">
<link href="admin/css/styles.css" rel="stylesheet">
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
				<li><a href="HomeadminForward"> <em class="fa fa-home"></em>
				</a></li>
				<li class="active">Quản lý</li>
			</ol>
		</div>
		<!--/.row-->

		<div class="row">
			<div class="col-lg-12">
				<h3 class="page-header">Tất cả sách</h3>
			</div>
			<a class="m-0 font-weight-bold text-primary" href="AddBookController">
				<i class="fa fa-plus"></i> <input type="Submit"
				class="btn btn-danger" value="Thêm sách mới">
			</a>
		</div>
		<!--/.row-->

		<div>
			<table border="1" class="table table-hover" id="dataTable"
				width="100%">
				<thead>
					<tr>
						<th>Mã sách</th>
						<th>Tên sách</th>
						<th>Ảnh</th>
						<th>Giá</th>
						<th>Tác giả</th>
						<th>Mã loại</th>
						<th>Thao tác</th>
					</tr>
				</thead>
				<%
					ArrayList<sachbean> lsSach = (ArrayList<sachbean>) request.getAttribute("lsSach");
				for (sachbean s : lsSach) {
				%>
				<tr>
					<td><%=s.getMasach()%></td>
					<td><%=s.getTensach()%></td>
					<td><img height="50px" alt="<%=s.getAnh()%>"
						src="<%=s.getAnh()%>"></td>
					<td><%=s.getGia()%></td>
					<td><%=s.getTacgia()%></td>
					<td><%=s.getMaloai()%></td>
					<td><a href="EditSach?ms=<%=s.getMasach()%>"onsubmit = "return validateForm()">Sửa</a> <a
						href="DeleteSach?ms=<%=s.getMasach()%>"> Xóa</a></td>
				</tr>
				<%
					}
				%>
				<tbody>

				</tbody>

			</table>


		</div>





	</div>
	<!--/.main-->

	<script src="admin/js/jquery-1.11.1.min.js"></script>
	<script src="admin/js/bootstrap.min.js"></script>
	<script src="admin/js/chart.min.js"></script>
	<script src="admin/js/chart-data.js"></script>
	<script src="admin/js/easypiechart.js"></script>
	<script src="admin/js/easypiechart-data.js"></script>
	<script src="admin/js/bootstrap-datepicker.js"></script>
	<script src="admin/js/custom.js"></script>

	<script src="admin/datatables/jquery.dataTables.min.js"></script>
	<script src="admin/datatables/dataTables.bootstrap4.min.js"></script>
	<script>
		$(document).ready(function() {
			$('#dataTable').DataTable();
		});
	</script>



</body>
</html>