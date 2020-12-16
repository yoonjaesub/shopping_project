<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 1:1문의 글쓰기</title>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bread.css" />
<style>
	.content table {width: 60%; margin: 0 auto; border: 1px solid #333; height: 500px;}
	.content table th {width: 20%;}
	.content table td {width: 80%;}
	.content table td input {width: 90%; height: 30px; font-weight: bold;}
	.content table td textarea {width: 90%; height: 400px; font-size: 14px;}
	.content form { text-align: center;}
	#write_btn {width: 100px; margin: 20px; height: 50px;}
</style>
</head>
<body>
<%@ include file = "index_header.jsp" %>
<%
	if(uid == null){
		%>
		<script>
		alert("1:1문의는 로그인 후 이용하실 수 있습니다.");
		location.href = "login.jsp";
		</script>
<%
	}
%>
<div class="content">
	<breadcrumb id="bread">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="companyInst.jsp">Service</a></li>
			<li class="sub_menu">1:1 문의
				<a href="companyInst.jsp">온라인상담</a>
				<a href="history.jsp">원격상담</a>
				<a href="companyChart.jsp">문자상담</a>
			</li>
		</ul>
	</breadcrumb>
	<form action="QnA_writePro.jsp" name="form1" method="get">
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		int qnum=0, number;
		
		try{
			conn = DBcon.getConnection();
			String sql = "select qnum from qna_tbl order by qnum asc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()){
				qnum = rs.getInt("qnum");
				System.out.println(qnum);
				
			}
			number = qnum+1;
			System.out.println(number);
	%>
		<table>
			<tr>
				<th><label for="">글번호</label></th>
				<td><input name="qnum" type="text" value="<%=number %>" readonly style="border: none"/></td>
			</tr>
			<tr>
				<th><label for="qtit">제목</label></th>
				<td><input type="text" name="qtit" id="qtit"/></td>
			</tr>
			<tr>
				<th><label for="qcontent">내용</label></th>
				<td><textarea name="qcontent" id="qcontent" cols="30" rows="10"></textarea></td>
			</tr>
			<tr>
				<th><label for="">작성자</label></th>
				<td><input type="text" name="custid" value="<%=uid %>" readonly style="border: none"/></td>
			</tr>
		</table>
		<button type="button" id="write_btn">글쓰기</button>
	</form>
</div>
<%
		}catch(Exception e){
			System.out.println("DB Connection error : " + e);
		}finally{
			try {
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			}catch(Exception e){
				System.out.println("DB Close error : " + e);
			}
		}
%>
<script>
	var form = document.form1;
	var qtit = form.qtit;
	var content = form.qcontent;
	var custid = form.custid;
	
	var wbtn = document.getElementById("write_btn");
	wbtn.addEventListener("click",function(){
		if(qtit.value == ""){
			alert("글 제목이 비어있습니다.");
			qtit.focus();
			return;
		}
		if(content.value==""){
			alert("글 내용이 비어있습니다.");
			content.focus();
			return;
		}
		if(qtit.value!="" && content.value!=""){
			form.submit();
		}
	})
	
</script>
<%@ include file = "index_footer.jsp" %>
