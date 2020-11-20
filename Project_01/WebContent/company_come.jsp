<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 오시는길</title>
<style>
.content {padding-top: 140px; width: 100%;}
#bread { border-bottom: 1px solid #eee; width: 100%; height: 30px; margin-bottom: 20px; display: block;}
#bread ul li {float: left; margin-left: 50px;}
#bread ul li:after {content : ">"; padding-left: 50px;}
#bread ul li:last-child:after {content:none;}
#bread ul li a {color: black;}
.sub_menu { display: block; width: 100px; height: 20px; overflow: hidden; position: absolute; background-color: white; left: 320px; text-align: center;}
.sub_menu:hover {height: 100px;}
.sub_menu a { display: block;}
.sub_menu a:hover {font-weight: bold;}
.info { width: 80%; height: 500px; margin: 0 auto; margin-top: 100px;}
.bus {float: left; width: 50%;}
.metro {float: right; width: 50%;}
.info ul li {width: 25%; float: left; display: block; text-align: center; height: 35px; margin: 30px; line-height: 35px; color: white; font-weight: bold; border-radius: 18px;}
.info ul li:first-child {width: 100%; color: black;}
.blue{ background-color: #4574F2;}
.green{ background-color: #0ABB0C;}
.line7{ background-color: #69870E;}
</style>
<link rel="stylesheet" href="./css/main.css" />
</head>
<body>
<%@ include file ="index_header.jsp" %>
<section class="content">
	<breadcrumb id="bread">
		<ul>
			<li><a href="index.jsp">Home</a></li>
			<li><a href="companyInst.jsp">Company</a></li>
			<li class="sub_menu">오시는길
				<a href="companyInst.jsp">회사소개</a>
				<a href="companyInst.jsp">연혁</a>
				<a href="companyInst.jsp">조직</a>
			</li>
		</ul>
	</breadcrumb>
	<div id="map" style="width:90%;height:400px; margin: 0 auto; margin-top: 100px;"></div>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=ac8f3403fd1d728ab70d3644e3dae800"></script>
	<script>
		var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
		var options = { //지도를 생성할 때 필요한 기본 옵션
			center: new kakao.maps.LatLng(37.492232, 126.823629), //지도의 중심좌표.
			level: 5 //지도의 레벨(확대, 축소 정도)
		};
	
		var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴
		
		var markerPosition = new kakao.maps.LatLng(37.492232, 126.823629); //마커 생성위치
		var marker = new kakao.maps.Marker({ // 마커 생성
			position : markerPosition
		});
		
		marker.setMap(map); // 생성된 마커를 map에 나타나도록 해주기
		
		setZoomable(false);
		function setZoomable(zoomable) {
			map.setZoomable(false);
		}
		
	</script>
	<div class="info">
		<ul class="bus">
			<li><h1>버스</h1></li>
			<li class="blue">160</li>
			<li class="blue">600</li>
			<li class="blue">660</li>
			<li class="green">5626</li>
			<li class="green">6613</li>
			<li class="green">6615</li>
			<li class="green">6616</li>
			<li class="green">6716</li>
			<li class="blue">N16</li>
			<li class="green">구로07</li>
			<li class="green">구로14(통학버스)</li>
		</ul>
		<ul class="metro">
			<li><h1>지하철</h1></li>
			<li class="blue">1호선</li>
			<li class="line7">7호선</li>
		</ul>
	</div>
</section>
<%@ include file = "index_footer.jsp" %>