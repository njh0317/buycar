<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language="java" import="java.text.*,java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<!DOCTYPE HTML>
<!--
	Projection by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<% LoginManager loginManager = LoginManager.getInstance(); %>
<html>
	<head>
		<title>Used-Car Sale Service</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
	</head>
	<body>
	
		<!-- Header -->
			<header id="header">
				<div class="inner">
					<a href="main.jsp" class="logo">Trade your <strong>Used-Car!</strong></a>
					<nav id="nav">
						
						<% 
						   String serverIP = "localhost";
						   String strSID = "xe";
						   String portNum = "1521";
						   String user = "project";
						   String pass = "comp322";
							session.setAttribute("serverIP",serverIP);
							session.setAttribute("strSID",strSID);
							session.setAttribute("portNum",portNum);
							session.setAttribute("user",user);
							session.setAttribute("passnum",pass);
						if(!loginManager.isLogin(session.getId())){ //세션이 설정되지 않을 경우 %>
							<a href="main.jsp">Home</a>
							<a href="login/login.jsp">Sign in</a>
							<a href="login/sign_up.jsp">Sign up</a>
							<a href="manager/manager.jsp">Manager</a>
							
							<% }else{%>
							<a href="main.jsp">Home</a>
							<% }%>						
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<!-- Banner -->
			<section id="banner">
				<div class="inner">
					<header>
						<h1>Welcome to Used-Car Sale Service</h1>
					</header>
					<br>
					<div class="flex ">

						<div>
							<span class="icon fa-car"></span>
							<a href="search/search.jsp">
								<h3>Search</h3>
								<p>Search cars by options</p>
							</a>
						</div>

						<div>
						
 						<span class="icon fa-bug"></span>
 						
						<% if(!loginManager.isLogin(session.getId())) { //세션이 설정되지 않을 경우 %>
							<a href="login/login.jsp">
									<h3>로그인</h3>
									<p>로그인 하세요</p>
								</a>
								
							<% }else
							{ if(session.getAttribute("mngnum")==null){ %>
								<a href="info/myinfo.jsp">
									<h3>내 정보</h3>
									<p>Manage you account</p>
								</a>
								<button style = "font-size : 8px; height : 20%;"  onclick="location='login/logout.jsp'">로그아웃 </button>
							
							<% }else{%>
								<a href="manager/managerinfo.jsp">
									<h3>관리</h3>
									<p>Manage</p>
								</a>
								<button style = "font-size : 8px; height : 20%;"  onclick="location='manager/mnglogout.jsp'">로그아웃 </button>
							
							<% }} %>
							
						
						</div>

					</div>
<!--  
					<footer>
						<a href="#" class="button">Get Started</a>
					</footer>
-->
				</div>
			</section>


		<!-- Three -->
		<%//SELECT car_detailed ,count(*) cnt FROM VEHICLE WHERE Car_Number IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) group by car_detailed order by cnt desc;
		String idmake = loginManager.getUserID(session.getId())+"make";
		String idmodel = loginManager.getUserID(session.getId())+"model";
		String iddmodel = loginManager.getUserID(session.getId())+"dmodel";
		idmake = (String)session.getAttribute(idmake);
		idmodel = (String)session.getAttribute(idmodel);
		iddmodel = (String)session.getAttribute(iddmodel);
		   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
		   //System.out.println(url);
		   Connection conn = null;
		   PreparedStatement pstmt;
		   Class.forName("oracle.jdbc.driver.OracleDriver");
		   conn = DriverManager.getConnection(url,user,pass);
			request.setCharacterEncoding("euc-kr");
			ResultSet rs;
			int cnt = 0;
			int cnt2=0; //2개까지 count
			int insertnum=0;
			String[] make = new String[100];
			String[] modelname=new String[100];
			String[] dmodelname = new String[100];
			String[] choosemake = new String[5];
			String[] choosemodel = new String[5]; 
			String[] choosedmodel = new String[5];
			String[] num = new String[5];
			
			String carname=null, carname2=null;
			String carnum=null, carnum2=null;
			String query;
			
		query = "SELECT car_make, car_model, car_detailed ,count(*) cnt FROM VEHICLE WHERE Car_Number IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) group by car_make, car_model, car_detailed order by cnt desc";
		String query3= "SELECT car_make, car_model, car_detailed, car_number FROM VEHICLE WHERE Car_Number NOT IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) and  visible ='true' AND car_model = ? and car_detailed = ?";
		String query4= "SELECT car_make, car_model, car_detailed, car_number FROM VEHICLE WHERE Car_Number NOT IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) and  visible ='true' AND car_model = ?";
		pstmt = conn.prepareStatement(query);
		rs = pstmt.executeQuery();
		
		while(rs.next()){  
			make[cnt] = rs.getString(1);
		   modelname[cnt] = rs.getString(2);
		   dmodelname[cnt] = rs.getString(3);
		   cnt++;
		}
		try{
			if(pstmt!=null)pstmt.close();
			
		}catch(Exception ex){
			System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
		}
		pstmt = conn.prepareStatement(query3);
		pstmt.setString(1,idmodel);
		pstmt.setString(2,iddmodel);
		rs = pstmt.executeQuery();
		if(idmake != null)
		{
			while(rs.next())
			{
				choosemake[insertnum]=rs.getString(1);
				choosemodel[insertnum] = rs.getString(2);
		 		choosedmodel[insertnum] = rs.getString(3);
		 		num[insertnum] = rs.getString(4); 
		 		System.out.println(num[insertnum]);
		 		insertnum++;
		 		if(insertnum==2)
		 		{
		 			try{
		 				if(pstmt!=null)pstmt.close();
		 				
		 			}catch(Exception ex){
		 				System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
		 			}
		 			break;
		 		}
			}
		}
		
		if(idmake!=null&&insertnum!=2)
		{
			pstmt = conn.prepareStatement(query4);
			pstmt.setString(1,idmodel);
	
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				choosemake[insertnum]=rs.getString(1);
				choosemodel[insertnum] = rs.getString(2);
		 		choosedmodel[insertnum] = rs.getString(3);
		 		num[insertnum] = rs.getString(4); 
		 		System.out.println(num[insertnum]);
		 		insertnum++;
		 		if(insertnum==2)
		 		{
		 			try{
		 				if(pstmt!=null)pstmt.close();
		 				
		 			}catch(Exception ex){
		 				System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
		 			}
		 			break;
		 		}
			}
		}
		while(insertnum!=2)
		{
			String query2 = "SELECT car_number FROM VEHICLE WHERE Car_Number NOT IN(SELECT Car_Num FROM BUY,VEHICLE WHERE Car_Num = Car_Number) and  visible ='true' AND car_model = ? and car_detailed = ?";
			PreparedStatement pstmt2 = null;
		 	pstmt2 = conn.prepareStatement(query2);
		 	pstmt2.setString(1, modelname[cnt2]);
		 	pstmt2.setString(2, dmodelname[cnt2]);
		 	rs = pstmt2.executeQuery();
		 	if(rs.next()){     
		 		choosemake[insertnum] = make[cnt2];
		 		choosemodel[insertnum] = modelname[cnt2];
		 		choosedmodel[insertnum] = dmodelname[cnt2];
				num[insertnum] = rs.getString(1); 
				System.out.println(num[insertnum]);
				insertnum++;
			}else
			{
				
			}
		 	if(pstmt2!=null)pstmt2.close();
		 	if(insertnum==2)
		 		break;
		 	cnt2++;

		}
		%>
			<section id="three" class="wrapper align-center">
				<div class="inner">
					<div class="flex flex-2">
						<article>
							<div class="image round">
								<img src="images/pic01.jpg" alt="Pic 01" />
							</div>
							<header>
								<h4><%out.print(choosemake[0]); %><br /> <%out.print(choosemodel[0]); %>   <%out.print(choosedmodel[0]); %></h4>
							</header>
							<header>
							<h3> <% out.print(num[0]); %><br /></h3>
							</header>
							<footer>
							<%if((!loginManager.isLogin(session.getId()))||(session.getAttribute("mngnum")!=null))
								{%>
									<button type="button" onclick="location.href='search/buycar.jsp?sendid=<%out.print(num[0]);%>'" disabled>로그인 후 구매 가능</button>
							<% }else 
							{%>
									<button type="button" onclick="location.href='search/buycar.jsp?sendid=<%out.print(num[0]);%>'">이 차량 구매!</button>		
							<% }%>
								
							</footer>
						</article>
						<article>
							<div class="image round">
								<img src="images/pic02.jpg" alt="Pic 02" />
							</div>
							<header>
								<h4><%out.print(choosemake[1]); %><br /> <%out.print(choosemodel[1]); %>   <%out.print(choosedmodel[1]); %></h4>
							</header>
							<header>
							<h3><%out.print(num[1]); %><br /></h3>
							</header>
							<footer>
								<%if((!loginManager.isLogin(session.getId()))||(session.getAttribute("mngnum")!=null))
								{%>
									<button type="button" onclick="location.href='search/buycar.jsp?sendid=<%out.print(num[1]);%>'" disabled>로그인 후 구매 가능</button>
							<% }else 
							{%>
									<button type="button" onclick="location.href='search/buycar.jsp?sendid=<%out.print(num[1]);%>'">이 차량 구매!</button>		
							<% }%>
							</footer>
						</article>
					</div>
				</div>
			</section>


		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>