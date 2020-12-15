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
.content {height: 500px;}
#write_btn {margin-left: 83%; display: block; border: 1px solid #333; width: 100px; height: 30px; right: 0; line-height: 30px; text-align: center; margin-top: 20px; border-radius: 15px;
			background-color: #cdf; color: black; font-weight: bold;}
.content table {width: 80%; margin: 0 auto;}
.content table td {text-align: center; border-top: 1px solid #333; height: 30px;}
#form1 {width: 80%; margin: 0 auto; text-align: center; margin-top: 30px; height: 50px;}
#form1 * {height: 30px; margin-top: 10px;}
#form1 select {width: 100px;}
#form1 button {width: 80px;}
</style> 
</head>
<body>
<%@ include file ="index_header.jsp" %>
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
	<table>
		<tr>
			<th>글번호</th>
			<th>글제목</th>
			<th>작성일자</th>
			<th>작성자</th>
		</tr>
		<%
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs;
			String qtit, custid, sqdate;
			int qnum;
			java.util.Date qdate = null;
			SimpleDateFormat simple = new SimpleDateFormat("yy/MM/dd");
			
			try{
				conn = DBcon.getConnection();
				String sql = "select qnum, qtit, qdate, custid from qna_tbl";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					qnum = rs.getInt("qnum");
					qtit = rs.getString("qtit");
					qdate = rs.getDate("qdate");
					custid = rs.getString("custid");
					sqdate = simple.format(qdate);
		%>
		<tr>
			<td><%=qnum %></td>
			<td><a href=""><%=qtit %></a></td>
			<td><%=sqdate %></td>
			<td><%=custid %></td>
		</tr>
		<%		}
			}catch(Exception e){
				System.out.println("DB Connection error : " + e);
			}finally{
				try{
					if(pstmt!=null)pstmt.close();
					if(conn!=null)conn.close();
				}catch(Exception e){
					System.out.println("DB Close error : " + e);
				}
			}
		%>
	</table>
	<a href="QnA_write.jsp" id="write_btn">글쓰기</a>
	<form action="" name="form1" id="form1">
		<select>
			<option>작성자</option>
			<option>글제목</option>
			<option>글번호</option>
		</select>
		<input type="text" />
		<button type="button">글찾기</button>
	</form>
</div>
<%@ include file = "index_footer.jsp" %>