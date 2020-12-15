<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(제품정보수정처리)</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;

	try{
		conn = DBcon.getConnection();
		String sql = "update product_tbl set pid = ?, pname = ?, pspec = ? , price = ?, count = ?, brand = ? where pno = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("pid"));
		pstmt.setString(2, request.getParameter("pname"));
		pstmt.setString(3, request.getParameter("pspec"));
		pstmt.setString(4, request.getParameter("price"));
		pstmt.setString(5, request.getParameter("count"));
		pstmt.setString(6, request.getParameter("brand"));
		pstmt.setString(7, request.getParameter("pno"));
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
	alert("제품정보가 정상적으로 수정되었습니다.");
	location.href = "admin_itemList.jsp";
</script>
</body>
</html>