<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 조직도</title>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bread.css" />
<style>
.imgbox {margin: 0 auto; width: 60%;}
</style>
</head>
<body>
<%@ include file = "index_header.jsp" %>
<div class="content">
	<breadcrumb id="bread">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="companyInst.jsp">Company</a></li>
			<li class="sub_menu">조직
				<a href="companyInst.jsp">회사소개</a>
				<a href="company_come.jsp">오시는길</a>
				<a href="history.jsp">연혁</a>
			</li>
		</ul>
	</breadcrumb>
	<div class="imgbox">
		<img src="./img/companyChart.png" alt="회사조직도" />
	</div>
</div>
<%@ include file = "index_footer.jsp" %>