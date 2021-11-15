<%@page import="bean.SinhVienbean"%>
<%@page import="bean.Lopbean"%>
<%@page import="bo.SinhVienbo"%>
<%@page import="bo.Lopbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
   Lopbo lbo= new Lopbo();
   SinhVienbo svbo= new SinhVienbo();
%>
<table width="1000" align="center">
	<tr>
		<td colspan="3">
			Menu
		</td>
	</tr>
	<tr> 
		<td valign="top" width="200">
			 <a>Danh sách lớp </a><hr> 
              <%for(Lopbean lop:lbo.getlop()){%>
               <a href="HienThi.jsp?ml=<%=lop.getMalop() %>"> <%=lop.getTenlop() %>  </a><hr>
              <%} %>
		</td>
		<td valign="top" width="600"> 
               <a>Hiển thị ds sv </a><hr>
               <%String malop=request.getParameter("ml"); 
               	 int dem=0;
               %>
               <%for(SinhVienbean lop:svbo.getSv()){
               		if(lop.getMalop().equals(malop)){
             		  	dem++;
             		  %>           		  
               			<a>Họ Tên: <%=lop.getHoten()%></a>
               			<a>|| MSV:  <%=lop.getMasv()%></a>
               			<a>|| Lớp: <%=lop.getMalop()%></a>
               			<a>|| Điểm TB: <%=lop.getDtb()%> </a><hr>     
              		<%} %>             		
              <%} %>
              <!-- Tim SV -->
              <%
				String tam1=request.getParameter("txta");
				if(tam1==null){tam1="null";}  //Khác null mới làm tiếp các phép String ở sau.
				int dem2=0;
				for( SinhVienbean lop:svbo.getSv() ){					
               		if( lop.getHoten().toLowerCase().contains(tam1.toLowerCase()) ){
               			dem2++;%>
               			<a>Họ Tên: <%=lop.getHoten()%></a>
               			<a>|| MSV:  <%=lop.getMasv()%></a>
               			<a>|| Lớp: <%=lop.getMalop()%></a>
               			<a>|| Điểm TB: <%=lop.getDtb()%> </a><hr>              			
               		<%}          		  
              	}%>
              	<%if(dem==0 && dem2==0){out.print("Không có sinh viên để hiển thị!");} %>
		</td>
		<td valign="top" width="200"> 		
               <a>Tìm kiếm</a><hr>
				<%String a1=request.getParameter("txta");
				if(a1==null){a1="";}
				%>
				<form>
					<p>Nhập tên sv: </p>
				 	<input name="txta" value="<%=a1%>"> <br> <br>
				    <input name="butt2" value="Đồng ý" type="submit">				 	
				</form>	
		</td>
	</tr>
</table>
</body>
</html>