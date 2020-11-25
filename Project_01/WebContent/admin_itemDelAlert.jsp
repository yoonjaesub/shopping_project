<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(상품 삭제 확인)</title>
</head>
<body>
<%
	String pno = request.getParameter("pno");
	System.out.println(pno);
%>
<script>
var check = confirm("정말로 해당 제품을 삭제하시겠습니까?");
if(check){
	location.href = "admin_itemDel.jsp?pno=<%=pno%>";
}else{
	confirm.close;
}
</script>
</body>
</html>