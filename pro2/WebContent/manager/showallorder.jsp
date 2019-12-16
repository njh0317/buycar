<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<html>
<head>
    <title>주문 내역</title>
    <head>
		<title>Order Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>
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
			<script type="text/javascript">
						window.onload=function(){
							
							//2. radio 버튼 선택 후 선택한 radio 버튼의 index 및 value 출력
							var btn = document.getElementById('btn');
							//버튼 클릭시 함수 호출
							btn.onclick=function(){
								var xform = document.getElementById('xform');
								if(xform.check.length==undefined)
									if(xform.check.checked==true)
									{
										url = "CheckForm.jsp?check="+xform.check.value;
										open(url, "confirm","toolbar=no, location = no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height = 200");
									}
								for(var i=0; i<xform.check.length;i++){
									if(xform.check[i].checked == true){
								   		url = "CheckForm.jsp?check="+xform.check[i].value;
										open(url, "confirm","toolbar=no, location = no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height = 200");
										
									}
								}	
							};
						};
					</script>
					<header class="align-center">
						<h2><strong>거래내역 조회</strong></h2>
						<p>Show all order</p>
						<% 
						String serverIP = (String)session.getAttribute("serverIP");
						   String strSID = (String)session.getAttribute("strSID");
						   String portNum = (String)session.getAttribute("portNum");
						   String user = (String)session.getAttribute("user");
						   String pass = (String)session.getAttribute("passnum");
						   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						 
						   Connection conn = null;
						   PreparedStatement pstmt;
						   
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						%>
					</header>
					<div>
						
						<hr><br>
						<form id="xform">
						<%
							
							String SQL = "SELECT * FROM BUY";
					      	String SQL2 = "SELECT count(*) FROM BUY";
					      	Statement stmt;
					      	ResultSet rs;
					      	stmt = conn.createStatement();
					        rs = stmt.executeQuery(SQL2);
					        out.print("전체 거래 내역 : ");
					        while (rs.next()) {
					            out.println(rs.getInt(1)+" 건" );
					        }
					        rs = null;
					        rs = stmt.executeQuery(SQL);
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
							
							out.println("<th>"+"CHECK"+"</th>");
							
							out.println("<th>Order_num</th><th>Acc_id</th><th>Car_num</th>");
						
							while(rs.next()){
							   out.println("<tr>");
							   String carnum =rs.getString(3);
							   out.println("<td id =\"check\"><input type= \"radio\" name=\"check\" value = \""+carnum+"\" style=\"padding: 0 0 0 0;\"></td>");
							   out.println("<td>"+rs.getInt(1)+"</td>");
							   out.println("<td>"+rs.getString(2)+"</td>");
							   out.println("<td>"+carnum+"</td>");
							  
							   out.println("</tr>");      
							}
							out.println("</table>");
							try{
								if(stmt!=null)stmt.close();
								if(conn!=null)conn.close();
							}catch(Exception ex){
								System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
							}
						%>
						<input type="button" value="확인" id="btn">
						</form>
					</div>
				</div>
			</section>
	</body>
</html>




