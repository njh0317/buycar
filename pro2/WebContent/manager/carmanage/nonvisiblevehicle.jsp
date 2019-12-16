<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>차량 비공개 처리</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../../assets/css/main.css" />
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
						<h2><strong>차량 비공개 처리</strong></h2>
						<p>Nonvisible Vehicle</p>
						<script type="text/javascript">
						function check() {
							
							if(confirm("비공개 처리를 하시겠습니까?"))
							{
					              return true;
					              
					        }else{
					        	return false
					        }			  
							}
						</script>
					
					</header>
					
						<hr><br>
						
 
						<form name="fr" method = post action = "carmanage/novisi.jsp" onsubmit="return check();">
						<p>
						<label for="nonvisible">비공개 처리를 할 차량 번호를 입력하세요</label>
						<input type="text" name="nonvisible" required>
						</p>
						<input type="submit" value="확인">
						</form>
						
					</div>
				
			</section>


</body>
</html>