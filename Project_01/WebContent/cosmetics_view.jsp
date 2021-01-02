<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*, java.lang.*, java.util.*, java.text.*, java.net.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import = "Project.DBcon" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/main.css" />
<title>YJS - 상품상세보기</title>
<style>
	.content {width: 70%; margin: 0 auto;}
	.img_box {text-align:center; width: 63%; float: left; margin: 0 auto;}
	.img_box img {width: 500px; height: 600px;}
	.item_content { width: 32%; float: right; margin: 0 auto; text-align: center;}
	.item_content li {margin: 20px;}
	.ft {clear: both;}
	
	#pname{ font-size: 24px; font-weight: bold; margin-top: 30px;}
	#price {font-size: 18px; margin: 10px; font-weight: bold;}
	#select { width: 100px; margin-bottom: 50px;}
	.item_content button { margin: 15px; height: 40px; width: 150px; font-weight: bold; background-color: #fff;}
	.item_content button:hover {background-color: #eee;}
</style>
</head>
<body>
<%@ include file ="index_header.jsp" %>
<div class="content">
	<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs;
		String pname, brand, pspec, commaPrice, pno;
		int price, count, num=0;
		String s_pname = request.getParameter("pname");
		try{
			conn = DBcon.getConnection();
			String sql = "select pname, pno, pspec, price, count, brand from product_tbl where pname = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, s_pname);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				pname = rs.getString("pname");
				brand = rs.getString("brand");
				pspec = rs.getString("pspec");
				price = rs.getInt("price");
				count = rs.getInt("count");
				pno = rs.getString("pno");
				commaPrice = String.format("%,d", price);
		%>
		<div class="img_box">
			<img src="./img/<%=pno %>.jpg" alt="" onmouseover="this.src='./img/<%=pno%>1.jpg'" onmouseout="this.src='./img/<%=pno%>.jpg'"/>
		</div>
		<div class="item_content">
			<ul>
				<li id="pname"><%=pname %></li>
				<li id="pspec"><%=pspec %></li>
				<li id="price"><%=commaPrice %>원</li>
				<li id="count">수량 : 
					<%if(count <= 0){ %>
					현재 재고가 존재하지 않습니다.
					<%}else if(count >= 1){%>
					<select id="select">
						<%for(int i=1; i <=count; i++){%>
							<option id="count" value="<%=i%>"><%=i %></option>
						<%}
						}%>	
					</select>
				</li>
				<li style="margin-bottom: 50px"><hr /></li>
				<li>평균 배송 기간 : 2~3영업일</li>
				<li>최종 결제 금액 : <%=num %> 원</li>
			</ul>
			<button type="button" id="cart_btn">장바구니 담기</button>
			<button type="button" id="buy_btn">결제하기</button>
		</div>
		<%
			}
		}catch(Exception e){
			System.out.println("DB Connection error : " + e);
		}
	%>
</div>
<%@ include file = "index_footer.jsp" %>