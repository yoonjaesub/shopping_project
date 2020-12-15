<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 제품 삭제</title>
<link rel="stylesheet" href="./css/admin_main.css" />
<style>
.content {width: 100%; padding-top: 140px; text-align: center;}
#form1 {width: 50%; margin: 0 auto;}
#form1 table {width: 100%;}
#form1 table tr {height: 100px;}
#form1 table input {width: 80%; text-align: center; height: 50px;}
#del_btn {width: 50%; height: 30px; margin: 50px;}
</style>
</head>
<body>
<%@ include file ="admin_header.jsp" %>
<section class="content">
	<h1>제품 목록</h1>
	<span>*수정하고자 하는 제품의 명칭을 입력해주세요.</span>
	<form action="admin_itemEdit.jsp" method="get" id="form1">
		<table>
			<tr>
				<th><lable>제품명</lable></th>
				<td><input type="text" name="pname" required/></td>
			</tr>
		</table>
		<button type="submit" id="del_btn">변경하기</button>
	</form>
</section>
<%@ include file = "index_footer.jsp" %>