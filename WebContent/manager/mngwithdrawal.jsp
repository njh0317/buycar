<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>�Ŵ��� Ż��</title>
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
						<h2><strong>�Ŵ��� ���� Ż��</strong></h2>
						<p>Withdrawal of manager account</p>
		
					</header>
					
						<hr><br>
						<script type="text/javascript">
						function check() {
							if(!document.fr.nowpass.value)
							  {
								  alert("�ùٸ��� ���� �Է�");
								  document.fr.nowpass.focus();
								  return false;
							  }
							if(confirm("������ Ż���Ͻðڽ��ϱ�?"))
							{
					              return true;
					              
					        }else{
					        	return false
					        }			  
							}
						</script>
 
						<form name="fr" method = post action = "withd.jsp" onsubmit="return check();">
						<p>
						<label for="nowpass">���� ��й�ȣ</label>
						<input type="text" name="nowpass">
						</p>
				
						<input type="submit" value="Ż��">
						</form>
						
					</div>
				
			</section>


</body>
</html>