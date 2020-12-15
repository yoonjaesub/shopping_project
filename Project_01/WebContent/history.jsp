<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 회사연혁</title>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bread.css" />
<style>
.history {margin: 0 auto; width: 60%; height: 500px;}
.history ul {width: 100%;}
.history ul li {width: 100%;}
.history ul li span {border: 1px solid #f77; margin: 30px; width: 100px; height: 30px; border-radius: 15px; display: inline-block; text-align: center; line-height: 30px; background-color: #fcc;
						font-weight: bold;}
</style>
</head>
<body>
<%@ include file ="index_header.jsp" %>
<div class="content">
	<breadcrumb id="bread">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="companyInst.jsp">Company</a></li>
			<li class="sub_menu">연혁
				<a href="companyInst.jsp">회사소개</a>
				<a href="company_come.jsp">오시는길</a>
				<a href="companyChart.jsp">조직</a>
			</li>
		</ul>
	</breadcrumb>
	<div class="history">
		<ul>
			<li><span>2020.11</span>회사 설립</li>
			<li><span>2020.11</span>홈페이지 1차 오픈</li>
			<li><span>2020.11</span>신규 브랜드 입점 / OOO, OOO, OOO</li>
			<li><span>2020.12</span>홈페이지 리뉴얼 및 2차 오픈</li>
			<li><span>2020.12</span>사옥 이전 / 관악구</li>
		</ul>
	</div>
</div>
<%@ include file = "index_footer.jsp" %>