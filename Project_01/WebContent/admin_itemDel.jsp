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
.content {padding-top: 140px; width: 100%;}
</style>
<title>YJS - 관리자(상품삭제)</title>
</head>
<body>
<%@ include file = "admin_header.jsp" %>
<section class="content">
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String pno = request.getParameter("pno");
		System.out.println(pno);
		try{
			conn = DBcon.getConnection();
			String sql = "delete from product_tbl where pno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pno);
			pstmt.executeQuery();
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
	<script>
		alert("<%=pno%> 상품이 삭제되었습니다.");
		location.href = "admin_itemList.jsp";
	</script>
</section>
<%@ include file = "index_footer.jsp" %>