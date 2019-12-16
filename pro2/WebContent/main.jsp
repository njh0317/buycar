<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<% LoginManager loginManager = LoginManager.getInstance(); %>
<html>
	<head>
		<title>Used-Car Sale Service</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
	
		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						
						<% 
						   String serverIP = "localhost";
						   String strSID = "xe";
						   String portNum = "1521";
						   String user = "project";
						   String pass = "comp322";
							session.setAttribute("serverIP",serverIP);
							session.setAttribute("strSID",strSID);
							session.setAttribute("portNum",portNum);
							session.setAttribute("user",user);
							session.setAttribute("passnum",pass);
						if(!loginManager.isLogin(session.getId())){ //세션이 설정되지 않을 경우 %>
							<a href="main.jsp">Home</a>
							<a href="login/login.jsp">Sign in</a>
							<a href="login/sign_up.jsp">Sign up</a>
							<a href="manager/manager.jsp">Manager</a>
							
							<% }else{%>
							<a href="main.jsp">Home</a>
							<% }%>						
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Welcome to Used-Car Sale Service</h1>
					</header>
					<br>
					<div class="flex ">

						<div>
							<span class="icon fa-car"></span>
							<a href="search/search.jsp">
								<h3>Search</h3>
								<p>Search cars by options</p>
							</a>
						</div>

						<div>
						
 						<span class="icon fa-bug"></span>
						<% if(!loginManager.isLogin(session.getId())) { //세션이 설정되지 않을 경우 %>
							<a href="login/login.jsp">
									<h3>로그인</h3>
									<p>로그인 하세요</p>
								</a>
							<% }else
							{ if(session.getAttribute("mngnum")==null){ %>
								<a href="info/myinfo.jsp">
									<h3>내 정보</h3>
									<p>Manage you account</p>
								</a>
								<button style = "font-size : 8px; height : 20%;"  onclick="location='login/logout.jsp'">로그아웃 </button>
							
							<% }else{%>
								<a href="manager/managerinfo.jsp">
									<h3>관리</h3>
									<p>Manage</p>
								</a>
								<button style = "font-size : 8px; height : 20%;"  onclick="location='manager/mnglogout.jsp'">로그아웃 </button>
							
							<% }} %>
							
						
						</div>

					</div>
<!--  
					<footer>
						<a href="#" class="button">Get Started</a>
					</footer>
-->
				</div>
			</section>


		<!-- Three -->
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<article>
							<div class="image round">
								<img src="images/pic01.jpg" alt="Pic 01" />
							</div>
							<header>
								<h3>Lorem ipsum<br /> dolor amet nullam</h3>
							</header>
							<p>Morbi in sem quis dui placerat ornare. Pellentesquenisi<br />euismod in, pharetra a, ultricies in diam sed arcu. Cras<br />consequat  egestas augue vulputate.</p>
							<footer>
								<a href="#" class="button">Learn More</a>
							</footer>
						</article>
						<article>
							<div class="image round">
								<img src="images/pic02.jpg" alt="Pic 02" />
							</div>
							<header>
								<h3>Sed feugiat<br /> tempus adipicsing</h3>
							</header>
							<p>Pellentesque fermentum dolor. Aliquam quam lectus<br />facilisis auctor, ultrices ut, elementum vulputate, nunc<br /> blandit ellenste egestagus commodo.</p>
							<footer>
								<a href="#" class="button">Learn More</a>
							</footer>
						</article>
					</div>
				</div>
			</section>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>