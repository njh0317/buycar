<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>���� ����� ó��</title>
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
						<h2><strong>���� ����� ó��</strong></h2>
						<p>Nonvisible Vehicle</p>
						<script type="text/javascript">
						function check() {
							
							if(confirm("����� ó���� �Ͻðڽ��ϱ�?"))
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
						<label for="nonvisible">����� ó���� �� ���� ��ȣ�� �Է��ϼ���</label>
						<input type="text" name="nonvisible" required>
						</p>
						<input type="submit" value="Ȯ��">
						</form>
						
					</div>
				
			</section>


</body>
</html>