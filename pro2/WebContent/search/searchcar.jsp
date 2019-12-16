<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE html>
<html>
<% LoginManager loginManager = LoginManager.getInstance(); %>
	<head>
		<title>Search Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
		<script>
			function chk_select(chk1) {
				var select1;
				if (chk1 == 'c1check') select1 = 'color1';
				else if (chk1 == 'c2check') select1 = 'color2';
				else if (chk1 == 'f1check') select1 = 'fuel1';
				else if (chk1 == 'f2check') select1 = 'fuel2';
				else if (chk1 == 'catcheck') select1 = 'category';
				else if (chk1 == 'transcheck') select1 = 'transmission';
				
				var chk = document.getElementById(chk1);
				var select = document.getElementById(select1);
				if (chk.checked == true) {
					select.value = "";
					select.disabled = false;
				} else {
					select.disabled = true;
				}
			}
			
			function getcarid(t) {
				checkedrow = t.cells[1].innerHTML;
				var d = document.getElementById('returncarid');
				d.value = checkedrow;
			}
		</script>
		
	</head>
	<body class="subpage">
	
		<!-- Header -->
			<header id="header">
				<div class="inner">
				
					<a href="../main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						<a href="../main.jsp">Home</a>
						<% if(!loginManager.isLogin(session.getId())) {%>
						<a href="../login/login.jsp">Sign in</a>
						<a href="../login/sign_up.jsp">Sign up</a>
						<%} %>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>
			
			<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
					<header class="align-center">
						<h2><strong>Search Results</strong></h2>
						<p>This is result of your search</p>
						<% 
						   String serverIP = "localhost";
						   String strSID = "xe";
						   String portNum = "1521";
						   String user = "project";
						   String pass = "comp322";
						   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						   System.out.println(url);
						   Connection conn = null;
						   PreparedStatement pstmt;
						   ResultSet rs;
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						%>
					</header>

					<form action="searchcardetail.jsp" method="POST">
						<h4>SELECT MORE DETAILED OPTIONS</h4>
						<div style="background-color: #f0f5f0; border-radius: 10px; height: 420px; padding: 10px 20px">
							<h5>-- Now selected --</h5>
							<div style="width:33%; float:left">
								<input type="text" name="make" value='Make : <%
									String m1 = request.getParameter("make");
									out.println(m1);
								%>' disabled >
							</div>
							<div style="width:33%; float:left">
								<input type="text" name="model" value='Model : <%
									String m2 = request.getParameter("model");
									out.println(m2);
								%>' disabled > 
							</div>
							<div style="width:33%; float:left">
								<input type="text" name="dmodel" value='Detailed_model : <%
									String m3 = request.getParameter("dmodel");
									out.println(m3);
								%>' disabled > 
							</div>
							<br><br><br>
								 	
							<div style="width:48%; float:left">
								<input type="checkbox" id="c1check" name="checkc1" value="Y" onclick='chk_select(this.id);'>
								Color1&nbsp;
								<select id="color1" name="c1" disabled="disabled">
									<option>Black</option>
									<option>White</option>
									<option>Gray</option>
									<option>Charcoal</option>
									<option>Red</option>
									<option>Blue</option>
								</select>
							</div>
							
							<div style="width:48%; float:right">
								<input type="checkbox" id="c2check" name="checkc2" value="Y" onclick='chk_select(this.id);'>
								Color2
								<select id="color2" name="c2" disabled="disabled">
									<option>Black</option>
									<option>White</option>
									<option>Gray</option>
									<option>Charcoal</option>
									<option>Red</option>
									<option>Blue</option>
								</select>
							</div><br>
							
							<div style="width:48%; float:left">
								<input type="checkbox" id="f1check" name="checkf1" value="Y" onclick='chk_select(this.id);'>
								Fuel1&nbsp;
								<select id="fuel1" name="f1" disabled="disabled">
									<option>Gasoline</option>
									<option>Disel</option>
									<option>Electric</option>
									<option>LPG</option>
									<option>Fuel Cell</option>
								</select>
							</div>
									
							<div style="width:48%; float:right">
								<input type="checkbox" id="f2check" name="checkf2" value="Y" onclick='chk_select(this.id);'>
								Fuel2
								<select id="fuel2" name="f2" disabled="disabled">
									<option>Gasoline</option>
									<option>Disel</option>
									<option>Electric</option>
									<option>LPG</option>
									<option>Fuel Cell</option>
								</select>
							</div><br>
							
							<div style="width:48%; float:left">
								<input type="checkbox" id="catcheck" name="checkcat" value="Y" onclick='chk_select(this.id);'>
								Category&nbsp;
								<select id="category" name="category" disabled="disabled">
									<option>light-weight</option>
									<option>small-size</option>
									<option>midsize</option>
									<option>full-size</option>
									<option>SUV</option>
								</select>
							</div>
										
							<div style="width:48%; float:right">
								<input type="checkbox" id="transcheck" name="checktrans" value="Y" onclick='chk_select(this.id);'>
								Transmission Type
								<select id="transmission" name="transmission" disabled="disabled">
									<option selected>Automatic</option>
									<option>Manual</option>
									<option>Semi-Auto</option>
									<option>CVT</option>
								</select>
							</div><br><br>
							
							<div style="width:20%; float:right; padding: 10px 20pxs">
							<input type="hidden" value="<%out.print(m1); %>" id="make" name="make">
							<input type="hidden" value="<%out.print(m2); %>" id="model" name="model">
							<input type="hidden" value="<%out.print(m3); %>" id="detailed" name="detailed">
								<br><button type="submit" value="searchdetail" style="float: right;">SEARCH</button>
							</div>
						</div>
					</form>
				</div><br>
						<hr><br>
						
						<form action="buycar.jsp" method="POST">
							<%
								request.setCharacterEncoding("euc-kr");
								String maker = request.getParameter("make");
								String model = request.getParameter("model");
								String dmodel = request.getParameter("dmodel");
								application.setAttribute("MAKE", maker);
								application.setAttribute("MODEL", model);
								application.setAttribute("DMODEL", dmodel);
	
								String query = "SELECT * FROM VEHICLE WHERE Car_Number NOT IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) " +
										"AND Car_Make = \'"+ maker + "\' AND Car_model = \'" + model + "\' AND Car_Detailed = \'" + dmodel + "\' AND visible=\'true\'";
								pstmt = conn.prepareStatement(query);
								rs = pstmt.executeQuery();
								out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
								ResultSetMetaData rsmd = rs.getMetaData();
								int cnt = rsmd.getColumnCount();
								out.println("<th>"+"CHECK"+"</th>");
								for(int i =1;i<=cnt-4;i++){
								   out.println("<th>"+rsmd.getColumnName(i)+"</th>");
								}
								while(rs.next()){     
								   out.println("<tr>");
								   out.println("<td id =\"vehiclecheck\" onclick=\"getcarid(this.parentNode);\"><input type= \"radio\" name=\"buyvehicle\" style=\"padding: 0 0 0 0;\"></td>");
								   out.println("<td>"+rs.getString(1)+"</td>");
								   out.println("<td>"+rs.getDate(2)+"</td>");
								   out.println("<td>"+rs.getString(3)+"</td>");
								   out.println("<td>"+rs.getString(4)+"</td>");
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
							<%if((!loginManager.isLogin(session.getId()))||(session.getAttribute("mngnum")!=null))
								{%>
									<button type="submit" style="float: right;" disabled >BUY</button><br><br>
							<% }else 
							{%>
									<input type="hidden" value="" id="returncarid" name="sendid">
									<button type="submit" style="float: right;">BUY</button><br><br>		
							<% }%>
						</form>
			</section>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
	</body>
</html>