<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(상품등록처리)</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	
	try{
		conn = DBcon.getConnection();
		String sql = "insert into product_tbl values (?, ?, ?, ?, ?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("pno"));
		pstmt.setString(2, request.getParameter("pid"));
		pstmt.setString(3, request.getParameter("pname"));
		pstmt.setString(4, request.getParameter("pspec"));
		pstmt.setString(5, request.getParameter("price"));
		pstmt.setString(6, request.getParameter("count"));
		pstmt.setString(7, request.getParameter("brand"));
		
		pstmt.executeQuery();
	}catch(Exception e) {
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
	alert("상품 등록이 정상적으로 처리되었습니다.");
	var check = confirm("추가로 상품을 등록하시겠습니까?");
	if(check){
		location.href = "admin_item.jsp";
	}else{
		alert("메인페이지로 이동합니다.");
		location.href = "admin_index.jsp";
	}
</script>
</body>
</html>