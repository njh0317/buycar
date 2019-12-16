<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>비밀번호 변경</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
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
						<h2><strong>비밀번호 변경</strong></h2>
						<p>Insert your password</p>
						<% 
						   out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
						
						%>
					</header>
					
						<hr><br>
						<script type="text/javascript">
						function check() {
							if(!document.fr.nowpass.value)
							  {
								  alert("올바르지 않은 입력");
								  document.fr.nowpass.focus();
								  return false;
							  }
							  else if(!document.fr.changepw.value)
							  {
								  alert("올바르지 않은 입력");
								  document.fr.changepw.focus();
								  return false;
							  }
							  else if(document.fr.changepw.value==document.fr.nowpass.value)
							  {
								  alert("동일한 비밀번호");
								  document.fr.changepw.focus();
								  return false;
							  }
							  else return true;
							}
						</script>
 
						<form name="fr" method = post action = "pwchange.jsp" onsubmit="return check();">
						<p>
						<label for="nowpass">현재 비밀번호</label>
						<input type="text" name="nowpass">
						</p>
						<p>
						<label for="changepw">변경할 비밀번호</label>
						<input type="text" name="changepw">
						</p>
				
						<input type="submit" value="변경">
						</form>
						
					</div>
				
			</section>


</body>
</html>