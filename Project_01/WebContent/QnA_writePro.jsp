<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 1:1문의 작성 처리</title>
</head>
<body>
<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	try{
		conn = DBcon.getConnection();
		String sql = "insert into qna_tbl(qnum, qtit, qcontent, custid) values(?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("qnum"));
		pstmt.setString(2, request.getParameter("qtit"));
		pstmt.setString(3, request.getParameter("qcontent"));
		pstmt.setString(4, request.getParameter("custid"));
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
alert("1:1 문의가 정상적으로 등록되었습니다.");
location.href = "QnA.jsp";

</script>
</body>
</html>