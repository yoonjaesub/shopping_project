<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/admin_main.css" />
<style>
.content { padding-top: 140px; width: 100%;}
.edit_box { width: 70%; margin: 0 auto; border: 1px solid #333;}
.edit_box td, th {border: 1px solid #333; height: 50px;}
.edit_box th {background-color: #ddd;}
#form1 td input {width: 90%; height: 80%; text-align: center;}
#form1 {width: 100%; text-align: center;}
.btn { width: 100px; height: 30px; margin: 50px;}
</style>
<title>YJS - 관리자(회원정보수정)</title>
</head>
<body>
<%@ include file ="admin_header.jsp" %>
<section class="content">
	<form action="admin_editPro.jsp" id="form1" name="form1" method="get">
		<table class="edit_box">
			<%
				//String custid = request.getParameter("custid");
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs;
				String custid, author, goods, phone, email, area;
				
				try{
					conn = DBcon.getConnection();
					String sql = "select custid, author, goods, phone, email, area from custom_tbl where custid = ?";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, request.getParameter("custid"));
					rs = pstmt.executeQuery();
					while(rs.next()){
						custid = rs.getString("custid");
						author = rs.getString("author");
						goods = rs.getString("goods");
						phone = rs.getString("phone");
						email = rs.getString("email");
						area = rs.getString("area");
						
			%>
				<tr>
					<th><label for="">아이디</label></th>
					<td><input type="text" value="<%=custid %>" readonly name="custid"></td>
				</tr>		
				<tr>
					<th><label for="">성명</label></th>
					<td><input type="text" value="<%=author%>" name="author"/></td>
				</tr>
				<tr>
					<th><label for="">관심상품</label></th>
					<td><input type="text" value="<%=goods%>" name="goods"/></td>
				</tr>
				<tr>
					<th><label for="">연락처</label></th>
					<td><input type="text" value="<%=phone%>" name="phone"/></td>
				</tr>
				<tr>
					<th><label for="">이메일</label></th>
					<td><input type="text" value="<%=email%>" name="email"/></td>
				</tr>
				<tr>
					<th><label for="">거주지</label></th>
					<td><input type="text" value="<%=area%>" name="area"/></td>
				</tr>
				
				<%
					}
				}catch(Exception e) {
					System.out.println("DB Connection error : " + e);
				}
			%>
		</table>
		<input type="button" value="수정하기" id="submit_btn" class="btn"/>
		<input type="button" value="이전으로" id="back" class="btn"/>
	</form>
	<script>
	var form = document.form1;
	var submit = document.getElementById("submit_btn");
	var back = document.getElementById("back");
	submit.addEventListener("click",function(){
		form.submit();
	})
	back.addEventListener("click",function(){
		location.href = "admin_List.jsp";
	})
	</script>
</section>
<%@ include file ="index_footer.jsp" %>