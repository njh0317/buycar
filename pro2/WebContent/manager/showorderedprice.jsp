<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<html>
<style>

ul{
list-style-type: none;
}

	
</style>

<head>
    <title>�ֹ� ����</title>
    <head>
		<title>Order Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>
</head>
<body class ="subpage">
		<header id="header">
				<div class="inner">
					<a href="../main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						<a href="../main.jsp">Home</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>  
    
    <section id="three" class="wrapper" style="padding: 30px">
			<div class="inner">
					<header class="align-center">
						<h2><strong>����� Ȯ��</strong></h2>
						<p>�׸� ����� Ȯ��</p>
			
					</header>
						<hr><br>
					<div>
						
						<ul>
    						<li><a href="?pageChange=order/monthorder.jsp">���� �����</a></li>
    						<li><a href="?pageChange=order/yearorder.jsp">�⵵�� �����</a></li>
    						<li><a href="?pageChange=order/makerorder.jsp">������ �����</a></li>
						</ul>
					</div>
				</div>
			</section>
	</body>
</html>




