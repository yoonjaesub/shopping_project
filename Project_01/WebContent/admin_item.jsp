<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(상품등록)</title>
<link rel="stylesheet" href="./css/admin_main.css" />
<style>
.content {padding-top: 140px; text-align: center;}
.content h1 {margin-bottom: 50px;}
#form1 {width: 80%; margin: 0 auto;}
#form1 table {width: 100%; height: 500px;}
#form1 table th {width: 30%; border: 1px solid #333; height: 40px;}
#form1 table input {width: 90%; height: 100%; text-align: center; font-size: 24px;}
.btn {width: 30%; height: 50px; margin: 30px;}
</style>
</head>
<body>
<%@ include file = "admin_header.jsp" %>
<section class="content">
	<h1>제품 등록</h1>
	<form action="admin_itemPro.jsp" id="form1" name="form1" method="get">
		<table>
			<tr>
				<th>제품번호</th>
				<td><input type="text" name="pno" required/></td>
			</tr>
			<tr>
				<th>카테고리(*화장품, 시계 등)</th>
				<td><input type="text" name="pid" required/></td>
			</tr>
			<tr>
				<th>제품명</th>
				<td><input type="text" name="pname" required/></td>
			</tr>
			<tr>
				<th>제품스펙(*사이즈,색상 등)</th>
				<td><input type="text" name="pspec" required/></td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td><input type="text" name="price" required/></td>
			</tr>
			
			<tr>
				<th>보유수량</th>
				<td><input type="text" name=count required/></td>
			</tr>
			<tr>
				<th>브랜드명</th>
				<td><input type="text" name="brand" required/></td>
			</tr>
		</table>
		<input type="submit" value="등록하기" class="btn" />
		<button type="button" id="back" class="btn">이전으로</button>
		<script>
		var back = document.getElementById("back");
		back.addEventListener("click",function(){
			location.href = "admin_index.jsp";
		})
		var form = document.getElementById("form1");
		var pno = form.pno;
		var pid = form.pid;
		var pname = form.pname;
		var pspec = form.pspec;
		var price = form.price;
		var count = form.count;
		var brand = form.brand;
		
		</script>
	</form>
</section>
<%@ include file ="index_footer.jsp" %>