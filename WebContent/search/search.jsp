<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE HTML>
<% LoginManager loginManager = LoginManager.getInstance(); %>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
	<head>
		<title>Search Cars</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>
	<body class="subpage">
	
		<!-- Header -->
			<header id="header">
				<div class="inner">
				
					<a href="../main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						<a href="../main.jsp">Home</a>
						<% if(!loginManager.isLogin(session.getId())) {%>
						<a href="../login/login.jsp">Sign in</a>
						<a href="../login/sign_up.jsp">Sign up</a>
						<%} %>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Three -->
		
			<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
					<header class="align-center">
						<h2><strong>Search Vehicles</strong></h2>
						<p>Search vehicles by options</p>
					</header>
					
					<div class="logo" style="display:inline; float:left; width:100%; height: auto; text-align: left">
						 <form action="searchcar.jsp" method="POST">
						 	<strong>Make</strong> 
						 	<select id="selectmake" name="make" onchange="makeChange()">
						 		<option value="" selected disabled hidden></option>
								<option>Hyundai</option>
								<option>Kia</option>
								<option>Chevrolet(GM DaeWoo)</option>
								<option>Renault Samsung</option>
								<option>Ssangyong</option>
								<option>Benz</option>
								<option>BMW</option>
								<option>Volkswagen</option>
							</select><br>
							<strong>Model </strong>
							<select id="selectmodel" name="model" onchange="modelChange()">
							</select><br>
							<strong>Detailed_model</strong>
							<select id="selectdmodel" name="dmodel">
							</select><br>
							
							<button type="submit" value="search" style="float: right;">SEARCH</button>
						 </form>
					</div>
				</div>
			</section>


		<!-- Scripts -->
			<script src="../assets/js/jquery.min.js"></script>
			<script src="../assets/js/skel.min.js"></script>
			<script src="../assets/js/util.js"></script>
			<script src="../assets/js/main.js"></script>
			<script src="../assets/js/searchcar.js"></script>
	</body>
</html>