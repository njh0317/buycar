<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ page import="pro2.LoginManager" %>
<% LoginManager loginManager = LoginManager.getInstance(); %>
<title>MY INFO Results</title>
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
						<a href="../login/login.jsp">Sign in</a>
						<a href="../login/sign_up.jsp">Sign up</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>


		<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
				
					<header class="align-center">
						<h2><strong>매니저 로그인</strong></h2>
						<p>manager login</p>
						
					</header>
					
						<hr><br>
						
 
						<% if(!loginManager.isLogin(session.getId())) { //세션이 설정되지 않을 경우 %>
							<form method="post" action="mnglogin_ok.jsp">
								<label for="id">아이디</label>
								<input  type="text" name="mngid" id="mngid" placeholder="아이디" required /><br>
								<label for="pass">비밀번호</label>
								<input type="password" name="mngpass" id="mngpass" placeholder="비밀번호" required /><br>
								<label for="pass">매니저 번호</label>
								<input type="text" name="mngnumber" id="mngnumber" placeholder="매니저번호" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /><br>
								<input type="submit" value="로그인" />
							
							</form>
							<% }else{ %>
							
								<%=loginManager.getUserID(session.getId()) %> 매니저 로그인 성공<br>
								<button onclick="location='mnglogout.jsp'">로그아웃 </button>
								<button onclick="location='managerinfo.jsp'">관리 </button>
								<button onclick="location='../main.jsp'">메인 화면 </button>
							
							
							<% } %>
						
					</div>
				
			</section>


</body>
</html>