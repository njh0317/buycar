<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
					<%if(!loginManager.isLogin(session.getId()))
					{%>
						<a href="../main.jsp">Home</a>
						<a href="login.jsp">Sign in</a>
						<a href="sign_up.jsp">Sign up</a>
						<% }else {%>
						<a href="../main.jsp">Home</a>
						<%}%>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>


		<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
				
					<header class="align-center">
						<h2><strong>로그인</strong></h2>
						<p>Insert your ID and password</p>
						
					</header>
						<hr><br>
 
						<% if(!loginManager.isLogin(session.getId())){ //세션이 설정되지 않을 경우 %>
							<form method="post" action="login_ok.jsp">
								<label for="id">아이디</label>
								<input  type="text" name="id" id="id" placeholder="아이디" required /><br>
								<label for="pass">비밀번호</label>
								<input type="password" name="pass" id="pass" placeholder="비밀번호" required /><br>
								<input type="submit" value="로그인" />
								<button onclick="location='sign_up.jsp'">회원가입</button>
							</form>
							<% }else{ %>
							
								<%=loginManager.getUserID(session.getId()) %>님 환영합니다~<br>
								<button onclick="location='logout.jsp'">로그아웃 </button>
								<button onclick="location='../info/myinfo.jsp'">내 정보 </button>
								<button onclick="location='../main.jsp'">메인 화면 </button>
							
							
							<% } %>
						
					</div>
				
			</section>


</body>
</html>