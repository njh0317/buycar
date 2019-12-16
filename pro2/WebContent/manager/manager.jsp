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
						<h2><strong>�Ŵ��� �α���</strong></h2>
						<p>manager login</p>
						
					</header>
					
						<hr><br>
						
 
						<% if(!loginManager.isLogin(session.getId())) { //������ �������� ���� ��� %>
							<form method="post" action="mnglogin_ok.jsp">
								<label for="id">���̵�</label>
								<input  type="text" name="mngid" id="mngid" placeholder="���̵�" required /><br>
								<label for="pass">��й�ȣ</label>
								<input type="password" name="mngpass" id="mngpass" placeholder="��й�ȣ" required /><br>
								<label for="pass">�Ŵ��� ��ȣ</label>
								<input type="text" name="mngnumber" id="mngnumber" placeholder="�Ŵ�����ȣ" required onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" /><br>
								<input type="submit" value="�α���" />
							
							</form>
							<% }else{ %>
							
								<%=loginManager.getUserID(session.getId()) %> �Ŵ��� �α��� ����<br>
								<button onclick="location='mnglogout.jsp'">�α׾ƿ� </button>
								<button onclick="location='managerinfo.jsp'">���� </button>
								<button onclick="location='../main.jsp'">���� ȭ�� </button>
							
							
							<% } %>
						
					</div>
				
			</section>


</body>
</html>