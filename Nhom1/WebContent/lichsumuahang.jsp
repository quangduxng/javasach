<%@page import="bean.loaibean"%>

<%@page import="bean.GioHangbean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.GioHangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%

request.setCharacterEncoding("utf-8");
request.setCharacterEncoding("utf-8");
ArrayList<GioHangbean> dsloai = (ArrayList<GioHangbean>) request.getAttribute("history"); 

%>  

    <!-- Page Content -->
<div class="container">
	<div class="row">
		 
		<div class="col-md-9">
			
			<!-- Giỏ -->
			<div>
				<h2 style="text-align: center">Lịch Sử Mua Hàng</h2>
				<table align="center" border="1">
					<tbody>
						<tr style="text-align: center; font-weight: bold">
							<td>Mã sách</td>
							<td>Tên sách</td>
							<td>Ảnh bìa</td>
							<td>Số lượng</td>
							<td>Ngay Mua</td>
							<td>Mã Hóa Đơn</td>
							<td width="50px"></td>
							<td width="50px"></td>
							<td width="50px"></td>
						</tr>
						
						
							<% 
								
						for(GioHangbean giohang: dsloai){%>
						<form action="giohang?ms=<%=giohang.getMasach()%>"
							method="post">
							<tr style="text-align: center; font-weight: bold">
								<td><%=giohang.getMasach()%></td>
								<td><%=giohang.getTensach()%></td>
								<td><img src="<%=giohang.getAnh()%>"></td>

								<%-- <td><input type="number" name="txtsoluong" min="1" value="<%=giohang.getSlmua() %>" style="background-color: yellow"></td>
							<input type="hidden" value="<%= i %>" name="vitri">
							<td><input type="submit" value="Cập Nhật"></td> --%>
								<td><input name="txtsl" type="number" min="1"
									value="<%=giohang.getSlmua()%>">
									<button name="btnSua" class="btn-link" type="submit"
										value="Sua">Sửa</button></td>
								
								<td><%=giohang.getNgayMua()%></td>
								


							</tr>
						</form>
						<%
						}
						%>
						
					</tbody>
				</table>
			</div>

		</div>
	</div>
</div>
