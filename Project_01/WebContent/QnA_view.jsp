<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 1:1문의</title>
<link rel="stylesheet" href="./css/main.css" />
<link rel="stylesheet" href="./css/bread.css" />
<style>
	.QnA_box {width: 80%; border: 1px solid #333; margin: 0 auto;}
	.QnA_box { margin-bottom: 50px;}
	.QnA_box th, td {border: 1px solid #333;}
	.QnA_box th {background-color: #cdf;}
	.custid {text-align: center; width: 10%;}
	#qtit {text-align: center;}
	.qcontent { height: 500px;}
	.commentBox {width: 80%; margin: 0 auto; border: 1px solid #333;}
	.cid{width: 10%; border-right: 1px solid #333;}
	.ccontent {width: 80%;  border: none; }
	.sdate {width: 10%; text-align: center; border: none;}
	
	#form1 {width: 80%; border: 1px solid #333; margin: 0 auto; margin-top: 50px; position: relative;}
	#form1 textarea {width: 90%; height: 100%; margin-top: 5px; margin-left: 5px;}
	#form1 button {width: 8%; height: 60px; position: absolute; top: 13px; right: 10px;}
</style>
</head>
<body>
<%@ include file = "index_header.jsp" %>
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
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		String qtit, qcontent, custid;
		ResultSet rs;
		qtit = request.getParameter("qtit");
		try{
			conn = DBcon.getConnection();
			String sql = "select qtit, qcontent, custid from qna_tbl where qtit = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("qtit"));
			rs = pstmt.executeQuery();
			
			while(rs.next()){
			qtit = rs.getString("qtit");
			qcontent = rs.getString("qcontent");
			custid = rs.getString("custid");
	%>
	<table class="QnA_box">
		<tr>
			<th colspan="2">글 제목</th>
		</tr>
		<tr>
			<td id="qtit" colspan="2"><%=qtit %></td>
		</tr>
		<tr>
			<th class="contit">글 내용</th>
			<th class="custid">작성자</th>
		</tr>
		<tr>
			<td class="qcontent"><%=qcontent %></td>
			<td class="custid"><%=custid %></td>
		</tr>
	</table>
	<table class="commentBox">
	<%}
	sql = "select custid, ccontent, cdate from comment_tbl where ctit = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, request.getParameter("qtit"));
	rs = pstmt.executeQuery();
	String ccontent, cid;
	java.util.Date cdate = null;
	SimpleDateFormat simple = new SimpleDateFormat("yy/MM/dd");
	while(rs.next()){
		ccontent = rs.getString("ccontent");
		cdate =rs.getDate("cdate");
		cid = rs.getString("custid");
		String sdate = simple.format(cdate);
		System.out.println(cdate);
	%>
	
		<tr>
			<th class="cid"><%=cid %></th>
			<td class="ccontent"><%=ccontent %></td>
			<td class="sdate"><%=sdate %></td>
		</tr>
	
	<%} %>
	</table>
	<form action="comment_write.jsp" name="form1" id="form1" method="get">
		<textarea rows="5" cols="60" name="ccontent" id="ccomment"></textarea>
		<button type="button" id="cWrite_btn">댓글쓰기</button>
		<input type="hidden" value="<%=qtit%>" name="ctit"/>
	</form>
	<script>
		var form = document.form1;
		var cmt = document.getElementById("ccomment");
		var cwBtn = document.getElementById("cWrite_btn");
		cwBtn.addEventListener("click",function(){
			if(cmt.value==""){
				alert("댓글 내용을 입력하지 않으셨습니다.");
			}
			if(cmt.value!=""){
				form.submit();
			}
		})
	</script>
	<%
	
		}catch(Exception e){
			System.out.println("DB Connection error : " + e);
		}
	%>
</div>

<%@ include file ="index_footer.jsp" %>