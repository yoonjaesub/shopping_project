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
#sidemenu ul li a{color : #666;}
#sidemenu ul li a:hover { font-weight: bold;}


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
			<li><a href="cosmetics.jsp?brand=전체보기">전체보기</a></li>
			<li><a href="cosmetics.jsp?brand=입생로랑">입생로랑</a></li>
			<li><a href="cosmetics.jsp?brand=키엘">키엘</a></li>
			<li><a href="cosmetics.jsp?brand=MAC">MAC</a></li>
			<li><a href="cosmetics.jsp?brand=설화수">설화수</a></li>
			<li><a href="cosmetics.jsp?brand=에스티로더">에스티 로더</a></li>
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
	 	String s_brand = request.getParameter("brand");
	 	try{
	 		conn = DBcon.getConnection();
	 		if(s_brand.equals("전체보기")){
	 			String sql = "select pno, brand, pname, pspec, price from product_tbl";
	 			pstmt = conn.prepareStatement(sql);
	 		}else{
	 			String sql = "select pno, brand, pname, pspec, price from product_tbl where brand = ?";
	 			pstmt = conn.prepareStatement(sql);
	 			pstmt.setString(1, s_brand);
	 		}
	 		rs = pstmt.executeQuery();
	 		
	 		while(rs.next()) {
	 			pno = rs.getString("pno");
	 			brand = rs.getString("brand");
	 			pname = rs.getString("pname");
	 			pspec = rs.getString("pspec");
	 			price = rs.getInt("price");
	 			commaPrice = String.format("%,d",price);
	 			%>
	 	 <div id="item_view" onclick="location.href= 'cosmetics_view.jsp?pname=<%=pname%>'">
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
		 		System.out.println("DB Connection error + " + e);
		 	}finally{
		 		try{
		 			if(pstmt!=null) pstmt.close();
		 			if(conn!=null) conn.close();
		 		}catch(Exception e) {
		 			System.out.println("DB Close error : " + e);
		 		}
		 	}
	%>
	</div>
<%-- 	<script>
		var item_view = document.getElementById("item_view");
		item_view.addEventListener("click",function(){
			location.href = "cosmetics_view.jsp?pname = <%pname%>"
		})
	</script> --%>
</section>
<%@ include file = "index_footer.jsp" %>
