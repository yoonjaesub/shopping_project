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
.content {padding-top: 140px; text-align: center; width: 100%;}
.content table {border: 1px solid #333; width: 90%; margin: 0 auto; margin-top: 50px;}
.content table a { color: #8af;}
.content table a:hover { font-weight: bold;}
.content table th {border: 1px solid #333; background-color: #def; height: 35px;}
.content table td {border-bottom: 1px solid #333; height: 30px;}
</style>
<title>YJS - 관리자(제품목록)</title>
</head>
<body>
<%@ include file = "admin_header.jsp" %>
<section class="content">
	<h1>제품 목록</h1>
	<h4>* 제품번호를 누르시면 해당 제품을 삭제하실 수 있습니다.</h4>
	<h4>* 제품명을 누르시면 해당 제품의 정보를 수정하실 수 있습니다.</h4>
	<form action="">
		<table>
			<tr>
				<th>제품번호</th>
				<th>카테고리</th>
				<th>제품명</th>
				<th>제품스펙</th>
				<th>제품가격</th>
				<th>보유수량</th>
				<th>브랜드명</th>
			</tr>
			<%
				Connection conn = null;
				PreparedStatement pstmt = null;
				ResultSet rs;
				String pno, pid, pname, pspec, price, count, brand;
				try{
					conn = DBcon.getConnection();
					String sql = "select * from product_tbl ";
					pstmt = conn.prepareStatement(sql);
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						pno = rs.getString("pno");
						pid = rs.getString("pid");
						pname = rs.getString("pname");
						pspec = rs.getString("pspec");
						price = rs.getString("price");
						count = rs.getString("count");
						brand = rs.getString("brand");
			%>
			<tr>
				<td><a href="admin_itemDelAlert.jsp?pno=<%=pno%>"><%=pno %></a></td>
				<td><%=pid %></td>
				<td><a href="admin_itemEdit.jsp?pname=<%=pname%>"><%=pname %></a></td>
				<td><%=pspec %></td>
				<td><%=price %></td>
				<td><%=count %></td>
				<td><%=brand %></td>
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
<%@ include file = "index_footer.jsp" %>