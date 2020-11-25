<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./css/admin_main.css" />
<meta charset="UTF-8">
<style>
.content { padding-top: 140px; width: 100%;}
.dataTable {border: 1px solid #333; width: 90%; margin: 0 auto;}
.dataTable th, td { text-align: center; border: 1px solid #333; height: 50px;}
.dataTable th {background-color: #ddd;}
.dataTable td {height: 30px;}
#userid {font-weight: bold; color: black; cursor: pointer;}
</style>
<title>YJS - 관리자(회원목록)</title>
</head>
<body>
<%@ include file="admin_header.jsp" %>
<section class="content">
	<form action="admin_edit.jsp" class="form1" method="post" name="form1" id="form1">
		<table class="dataTable">
			<tr>
				<th>아이디</th>
				<th>성명</th>
				<th>관심상품</th>
				<th>연락처</th>
				<th>이메일</th>
				<th>거주지</th>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs;
				String custid, author, goods, phone, email, area;
				
				try{
					conn = DBcon.getConnection();
					String sql = "select custid, author, goods, phone, email, area ";
					sql += "from custom_tbl";
					pstmt = conn.prepareStatement(sql);
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
				<td><a href="admin_edit.jsp?custid=<%=custid %>"><%=custid %></a></td>
				<td><%=author %></td>
				<td><%=goods %></td>
				<td><%=phone %></td>
				<td><%=email %></td>
				<td><%=area %></td>
			</tr>
			<%
					}
				}catch(Exception e){
					System.out.println("DB Connection error : " + e);
				}finally{
					try{
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					}catch(Exception e){
						System.out.println("DB Close error : " + e);
					}
				}
			%>
		</table>
	</form>
</section>
<%@ include file ="index_footer.jsp" %>