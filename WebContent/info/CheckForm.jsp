<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.LoginManager" %>
<html>
 <title>차량 내역</title>
<% LoginManager loginManager = LoginManager.getInstance(); %>
   
    <head>
		<title>Order Results</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="../assets/css/main.css" />
		
	</head>

<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

    String serverIP = (String)session.getAttribute("serverIP");
	   String strSID = (String)session.getAttribute("strSID");
	   String portNum = (String)session.getAttribute("portNum");
	   String user = (String)session.getAttribute("user");
	   String pass = (String)session.getAttribute("passnum");
	   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
	 
	   Connection conn = null;
	
	   Class.forName("oracle.jdbc.driver.OracleDriver");
	   conn = DriverManager.getConnection(url,user,pass);
		String check = request.getParameter("check");
		
    	String SQL = "SELECT * FROM VEHICLE WHERE Car_Number =?";
    	PreparedStatement pstmt;
        ResultSet rs;
        String id= (String)loginManager.getUserID(session.getId());
        String Car_Number=null;
        String date=null;
        
        int mileage=0;
        int price=0;
        String color1=null;
        String color2=null;
        String fuel1=null;
        String fuel2=null;
        String category=null;
        String transmission=null;
        int engine=0;
        String make=null;
        String model=null;
        String detailed=null;
        
        pstmt = conn.prepareStatement(SQL);
        
        pstmt.setString(1, check);
        
        rs = pstmt.executeQuery();

           if(rs.next())
           {
        	   Car_Number = rs.getString(1);
               date = rs.getString(2);
               date = date.substring(0, 10);
               mileage = rs.getInt(3);
               price = rs.getInt(4);
               color1 = rs.getString(5);
               color2 = rs.getString(6);
               fuel1 = rs.getString(7);
               fuel2 = rs.getString(8);
               category = rs.getString(9);
               transmission = rs.getString(10);
               engine = rs.getInt(11);
               make = rs.getString(12);
               model = rs.getString(13);
               detailed = rs.getString(14);
           }
           out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
           if(  fuel2 == null) fuel2 = "";	      
   		
           if(  color2 == null) color2 = "";	      
           
           out.println("<tr><th>번호</th><th>"+Car_Number+"</th></tr>");
           out.println("<tr><th>제조사</th><th>"+make+"</th></tr>");
           out.println("<tr><th>모델</th><th>"+model+"</th></tr>");
           out.println("<tr><th>세부모델</th><th>"+detailed+"</th></tr>");
           out.println("<tr><th>제조년일</th><th>"+date+"</th></tr>");
           out.println("<tr><th>주행거리</th><th>"+mileage+"</th></tr>");
           out.println("<tr><th>색상1</th><th>"+color1+"</th></tr>");
           out.println("<tr><th>색상2</th><th>"+color2+"</th></tr>");
           out.println("<tr><th>연료1</th><th>"+fuel1+"</th></tr>");
           out.println("<tr><th>연료2</th><th>"+fuel2+"</th></tr>");
           out.println("<tr><th>차종</th><th>"+category+"</th></tr>");
           out.println("<tr><th>변속기</th><th>"+transmission+"</th></tr>");
           out.println("<tr><th>배기량</th><th>"+engine+"</th></tr>");
           out.println("<tr><th>가격</th><th>"+price+"</th></tr>");

           
           out.println("</table>");
           

           try{
				if(pstmt!=null)pstmt.close();
				if(conn!=null)conn.close();
			}catch(Exception ex){
				System.out.println("커넥션 해제 Exception발생 : "+ex.getMessage());
			}
	    %>
	     <input id = "cancelBtn" type="button" value = "확인" onclick = "window.close()"> 
		   

    
</body>
</html>




