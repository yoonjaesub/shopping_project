<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 화장품</title>
<style>
.content {width: 100%; padding-top: 140px; height: 2000px;}
#sidemenu {width: 20%; height: 60vh; position: fixed;}
#sidemenu ul {border-top: 3px solid #333; border-bottom: 3px solid #333; float: right; width: 65%;}
#sidemenu ul li {text-align: center; margin-bottom: 10px; cursor: pointer; color:#666;}
#sidemenu ul li:hover {font-weight: bold;}
#sidemenu ul li:first-child {margin-top: 30px; margin-bottom: 40px; text-align: left; color:black;}


#itemBox {width: 79%; float: right; height: 1000px;}
#itemBox div {width: 20%; height: 450px; margin: 20px; float: left; cursor: pointer;}
#itemBox div img {margin: 10px; width: 280px; height: 280px; border-bottom: 1px solid #999;}
.itemInfo {width: 100%;}
.itemInfo li { width: 100%; color: #666; }
.itemInfo li:first-child {font-size: large; font-weight: bold; margin-bottom: 5px; color:black;}
.itemInfo li:nth-child(3) {font-size: 14px;}
.itemInfo li:last-child {font-size: 24px; font-weight: bold; margin-bottom: 5px; color:black; margin-top: 25px;}

</style>
<link rel="stylesheet" href="./css/main.css" />
</head>
<body>
<%@ include file = "index_header.jsp" %>
<section class="content">
	<div id="sidemenu">
		<ul>
			<li><h1>화장품</h1></li>
			<li>입생로랑</li>
			<li>키엘</li>
			<li>랑콤</li>
			<li>디올</li>
			<li>MAC</li>
			<li>설화수</li>
			<li>에스티 로더</li>
		</ul>
	</div>
	<div id="itemBox">
	 <%
	 	//이제 여기에 while문을 써서 div를 하나하나 늘려야 합니다.
	 	Connection conn = null;
	 	PreparedStatement pstmt = null;
	 	ResultSet rs;
	 	String pname, brand, pno, pspec, commaPrice;
	 	int price;
	 	try{
	 		conn = DBcon.getConnection();
	 		String sql = "select pno, brand, pname, pspec, price from product_tbl where brand = '입생로랑'";
	 		
	 		pstmt = conn.prepareStatement(sql);
	 		rs = pstmt.executeQuery();
	 		
	 		while(rs.next()) {
	 			pno = rs.getString("pno");
	 			brand = rs.getString("brand");
	 			pname = rs.getString("pname");
	 			pspec = rs.getString("pspec");
	 			price = rs.getInt("price");
	 			commaPrice = String.format("%,d",price);
	 			%>
	 	
	 	<div>
			<img src="./img/<%=pno %>.jpg" alt="" onmouseover="this.src='./img/<%=pno%>1.jpg'" onmouseout="this.src='./img/<%=pno%>.jpg'"/>
			<ul class="itemInfo">
				<li><%=brand%></li>
				<li><%=pname%></li>
				<li><%=pspec %></li>
				<li><%=commaPrice%> 원</li>
			</ul>
		</div>
		<%
	 		}
	 		
	 		sql = "select pno, brand, pname, pspec, price from product_tbl where brand = '키엘'";
	 		pstmt = conn.prepareStatement(sql);
	 		rs = pstmt.executeQuery();
	 		
	 		while(rs.next()) {
	 			pno = rs.getString("pno");
	 			brand = rs.getString("brand");
	 			pname = rs.getString("pname");
	 			pspec = rs.getString("pspec");
	 			price = rs.getInt("price");
	 			commaPrice = String.format("%,d",price);
	 			%>
	 	<div>
			<img src="./img/<%=pno %>.jpg" alt="" onmouseover="this.src='./img/<%=pno%>1.jpg'" onmouseout="this.src='./img/<%=pno%>.jpg'"/>
			<ul class="itemInfo">
				<li><%=brand%></li>
				<li><%=pname%></li>
				<li><%=pspec %></li>
				<li><%=commaPrice%> 원</li>
			</ul> 
		</div>
	 		<%}
	 		
	 		
	 	
	 	}catch(Exception e){
	 		System.out.println("DB Connection error : " + e);
	 	}finally{
	 		try{
	 			if(pstmt!=null) pstmt.close();
	 			if(conn!=null)	conn.close();
	 		}catch(Exception e){
	 			System.out.println("DB Close error : " + e);
	 		}
	 	}
	 	%>
		
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
		<div>
		</div>
	</div>
</section>
<%@ include file = "index_footer.jsp" %>
