<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(회원정보 수정처리)</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs;
	String custid = request.getParameter("custid");
	System.out.println(custid);
	try{
		conn = DBcon.getConnection();
		String sql = "update custom_tbl set password =?, author=?, goods=?, phone=?, email=?, area=? where custid = ?";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("password"));
		pstmt.setString(2, request.getParameter("author"));
		pstmt.setString(3, request.getParameter("goods"));
		pstmt.setString(4, request.getParameter("phone"));
		pstmt.setString(5, request.getParameter("email"));
		pstmt.setString(6, request.getParameter("area"));
		pstmt.setString(7, request.getParameter("custid"));
		pstmt.executeQuery();
	}catch(Exception e){
		System.out.println("DB Connection error : " + e);
	}finally{
		try{
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			%>
			<script>
			alert("회원 정보 수정이 정상적으로 완료되었습니다.");
			location.href = "admin_List.jsp";
			</script>
			<%
		}catch(Exception e){
			System.out.println("DB Close error : " + e);
		}
	}
%>
</body>
</html>