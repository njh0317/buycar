<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Buy Car</title>
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
						<a href="../login/join.jsp">Sign up</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>
	<section id="three" class="wrapper" style="padding: 30px">
			<div class="inner">
				<header class="align-center">
					<h2><strong>Purchase Vehicle</strong></h2>
					<p>You can buy vehicle here</p>
						
				</header>
				<form name ='frm' method = 'post' action = "buypop.jsp" onsubmit="return popup();">
				<div class="logo" style="display:inline; float:left; width:100%; height: auto; text-align: left">
					<div style="background-color: #f0f5f0; border-radius: 10px; height: 320px; padding: 25px 20px 20px 35px">
						<h4><strong>&nbsp;&nbsp;&nbsp;Selected Car</strong></h4>
						<% 
							String serverIP = (String)session.getAttribute("serverIP");
						   String strSID = (String)session.getAttribute("strSID");
						   String portNum = (String)session.getAttribute("portNum");
						   String user = (String)session.getAttribute("user");
						   String pass = (String)session.getAttribute("passnum");
							String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
							System.out.println(url);
							Connection conn = null;
							PreparedStatement pstmt;
							Class.forName("oracle.jdbc.driver.OracleDriver");
							conn = DriverManager.getConnection(url,user,pass);
							conn.setAutoCommit(false);
							request.setCharacterEncoding("euc-kr");
							String carid = request.getParameter("sendid");
							//application.setAttribute("CARID", carid);
							String SQL;
							   
							Statement stmt = conn.createStatement();
							ResultSet rs = null;
							
							SQL = "SELECT * FROM VEHICLE WHERE Car_Number NOT IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) AND Car_number=\'"+ carid +"\'";
							rs = stmt.executeQuery(SQL);
							out.println("<table border=\"1\" style=\"width: 100%; table-layout: fixed;\" id=\"result\">");
							ResultSetMetaData rsmd = rs.getMetaData();
							int cnt = rsmd.getColumnCount();
							
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(1)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(12)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(13)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(14)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(2)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(3)+"</th>");
							out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(4)+"</th>");
				
							while(rs.next()){     
								   out.println("<tr>");
								   out.println("<td>"+rs.getString(1)+"</td>");
								   out.println("<td>"+rs.getString(12)+"</td>");
								   out.println("<td>"+rs.getString(13)+"</td>");
								   out.println("<td>"+rs.getString(14)+"</td>");
								   out.println("<td>"+rs.getDate(2)+"</td>");
								   out.println("<td>"+rs.getString(3)+"</td>");
								   out.println("<td>"+rs.getString(4)+"</td>");
								   out.println("</tr>");
								   out.println("</table>");
								   
								   out.println("<table border=\"1\" style=\"width: 100%; table-layout: fixed;\" id=\"result\">");
								   out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(5)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(6)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(7)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(8)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(9)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(10)+"</th>");
									out.println("<th style = \"font-size: 13px;\">"+rsmd.getColumnName(11)+"</th>");
									out.println("<tr>");
								   out.println("<td>"+rs.getString(5)+"</td>");
								   out.println("<td>"+rs.getString(6)+"</td>");
								   out.println("<td>"+rs.getString(7)+"</td>");
								   out.println("<td>"+rs.getString(8)+"</td>");
								   out.println("<td>"+rs.getString(9)+"</td>");
								   out.println("<td>"+rs.getString(10)+"</td>");
								   out.println("<td>"+rs.getString(11)+"</td>");
								   out.println("</tr>");
								    
							}
							out.println("</table>");
						%>
						<div style="float:right;">
							<strong>Are you sure to buy this vehicle?</strong>&nbsp;&nbsp;&nbsp;<br>
							<input type="submit" value="YES">
							&nbsp;&nbsp;
							<input type = "button" onclick="history.back(-1)" value = "NO">
							<input type="hidden" value="<%out.print(carid); %>" id="carid" name="carid">
						</div>
					</div>
					<br>
				
						
				</div>
				</form>
			</div>
		</section>
		
		<script src="../assets/js/jquery.min.js"></script>
		<script src="../assets/js/skel.min.js"></script>
		<script src="../assets/js/util.js"></script>
		<script src="../assets/js/main.js"></script>
		<script src="../assets/js/searchcar.js"></script>
		
		<script>
			function popup() {
				var ans = confirm("Purchase this car")
				if (ans) {
					return true;
				}
				return false
			}
		</script>
		
</body>
</html>