<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>È¸¿ø Å»Åð</title>
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
						<h2><strong>È¸¿ø Å»Åð</strong></h2>
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
								  alert("¿Ã¹Ù¸£Áö ¾ÊÀº ÀÔ·Â");
								  document.fr.nowpass.focus();
								  return false;
							  }
							if(confirm("Á¤¸»·Î Å»ÅðÇÏ½Ã°Ú½À´Ï±î?"))
							{
					              return true;
					              
					        }else{
					        	return false
					        }			  
							}
						</script>
 
						<form name="fr" method = post action = "withd.jsp" onsubmit="return check();">
						<p>
						<label for="nowpass">ÇöÀç ºñ¹Ð¹øÈ£</label>
						<input type="text" name="nowpass">
						</p>
				
						<input type="submit" value="Å»Åð">
						</form>
						
					</div>
				
			</section>


</body>
</html>