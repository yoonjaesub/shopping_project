<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 댓글등록</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		conn = DBcon.getConnection();
		String sql = "insert into comment_tbl(ccontent, custid, ctit) values(?, ?, ?)";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("ccontent"));
		pstmt.setString(2, (String) session.getAttribute("custid"));
		pstmt.setString(3, request.getParameter("ctit"));
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
	alert("댓글이 작성되었습니다.");
	location.href = "QnA.jsp";
</script>
</body>
</html>