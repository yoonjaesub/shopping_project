<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자(제품정보수정)</title>
<link rel="stylesheet" href="./css/admin_main.css" />
<style>
.content { padding-top: 140px; text-align: center;}
.content h1 {margin-bottom: 50px;}
#form1 {width: 80%; margin: 0 auto;}
#form1 table {width: 100%; height: 500px;}
#form1 table th {width: 30%; border: 1px solid #333; height: 40px;}
#form1 table input {width: 90%; height: 100%; text-align: center; font-size: 24px;}
.btn {width: 30%; height: 50px; margin: 30px;}
</style>
</head>
<body>
<%@ include file = "admin_header.jsp" %>
<section class="content">
	<h1>제품 정보 수정</h1>
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String pno, pid, pname, pspec, price, count, brand;
		
		try{
			conn = DBcon.getConnection();
			String sql = "select * from product_tbl where pname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, request.getParameter("pname"));
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				pno = rs.getString("pno");
				pid = rs.getString("pid");
				pname = rs.getString("pname");
				pspec = rs.getString("pspec");
				price = rs.getString("price");
				count = rs.getString("count");
				brand = rs.getString("brand");
	%>
		<form action="admin_itemEditPro.jsp" id="form1" name="form1" method="get">
		<table>
			<tr>
				<th>제품번호</th>
				<td><input type="text" name="pno" value="<%=pno%>" readonly style="color: #999;"/></td>
			</tr>
			<tr>
				<th>카테고리(*화장품, 시계 등)</th>
				<td><input type="text" name="pid" value="<%=pid%>"/></td>
			</tr>
			<tr>
				<th>제품명</th>
				<td><input type="text" name="pname" value="<%=pname%>"/></td>
			</tr>
			<tr>
				<th>제품스펙(*사이즈,색상 등)</th>
				<td><input type="text" name="pspec" value="<%=pspec%>"/></td>
			</tr>
			<tr>
				<th>제품가격</th>
				<td><input type="text" name="price" value="<%=price%>"/></td>
			</tr>
			
			<tr>
				<th>보유수량</th>
				<td><input type="text" name=count value="<%=count%>"/></td>
			</tr>
			<tr>
				<th>브랜드명</th>
				<td><input type="text" name="brand" value="<%=brand%>"/></td>
			</tr>
		</table>
	<%
			}
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
		<input type="submit" value="수정하기" class="btn" />
		<button type="button" id="back" class="btn">이전으로</button>
		<script>
			var back = document.getElementById("back");
			back.addEventListener("click",function(){
				location.href = "admin_itemList.jsp";
			});
		</script>
	</form>
</section>
<%@ include file = "index_footer.jsp" %>