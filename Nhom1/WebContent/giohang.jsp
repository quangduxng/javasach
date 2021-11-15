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
<meta charset="ISO-8859-1">
<title>Gio Hang</title>
</head>
<body>
<% 
String masach=request.getParameter("ms");
String tensach=request.getParameter("ts");
String tacgia=request.getParameter("tg");
String giatam=request.getParameter("gia");
String anh=request.getParameter("a");
//Neu nguoi dung mua lan dau tien
GioHangbo gh=null;
if(session.getAttribute("gh")==null){
	gh= new GioHangbo();
	session.setAttribute("gh", gh);
}
if(masach!=null){
//b1: gan session vao bien
 gh=(GioHangbo) session.getAttribute("gh");
gh.Them(masach, tensach, tacgia,anh, Long.parseLong(giatam), (long)1);//b2
 session.setAttribute("gh", gh);
}
//Hien thi gio
response.sendRedirect("HTgio.jsp");
 %>
</body>
</html>
