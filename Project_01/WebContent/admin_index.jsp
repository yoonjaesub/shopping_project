<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="Project.DBcon" %>
<%@ page import="java.sql.*, java.text.*, java.util.*, java.lang.*, java.net.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>YJS - 관리자 페이지</title>
<link rel="stylesheet" href="./css/admin_main.css" />
<style>
.content {width: 100%; clear: both; height: 300px; padding-top: 150px;}
</style>
</head>
<body>
<%@ include file ="admin_header.jsp" %>
<section class="content">
</section>
<%@ include file ="index_footer.jsp" %>