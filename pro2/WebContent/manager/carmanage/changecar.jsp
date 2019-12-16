<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>
<%@ page import="pro2.MemberCar" %>

<html>
<head>
    <title>차량 등록</title>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

		String carnum = request.getParameter("carnum");
	    String model_year = request.getParameter("Model_year");
	    String Mileage = request.getParameter("mileage");
	    String Price = request.getParameter("price");
	    String Color1 = request.getParameter("color1");
        String Color2 = request.getParameter("color2"); 
        String Fuel1 = request.getParameter("fuel1");
        String Fuel2 = request.getParameter("fuel2");
        String Category = request.getParameter("category");
        String Transmission = request.getParameter("transmission");
        String Engine = request.getParameter("engine");
        String selectmake = request.getParameter("make");
        String selectmodel = request.getParameter("model");
        String selectdmodel = request.getParameter("dmodel");
      int mileage = Integer.parseInt(Mileage);
      int price = Integer.parseInt(Price);
      int engine = Integer.parseInt(Engine);
       System.out.println(carnum +" "+model_year+" "+mileage+" "+price);
       System.out.println(Color1+" "+Color2+" "+Fuel1+" "+Fuel2+" "+Category+" "+Transmission);
       System.out.println(engine+" "+selectmake+" "+selectmodel+" "+selectdmodel);
       
 
        //updateMember(String id, String pw, String Name, String Phone_Number, String Gender, String Occupation,
        //		String Address, String Birth_Date)
         MemberCar dao = MemberCar.getInstance();
        
        
        	int check = dao.updateMember(carnum, model_year, mileage, price, Color1, Color2, Fuel1, Fuel2, Category, Transmission, engine, selectmake, selectmodel, selectdmodel);
        	if(check == 1){
	    %>
		    <br><br>
		    <font size="5" color="gray">등록완료.</font>
		    <br><br>
		    <input type="button" value="확인" onclick="javascript:window.location='../managerinfo.jsp'"/>
	    
	    <%    
 
	        }else if(check == -2){
	    %>
	        <script>
	            alert("모델을 입력하지 않았습니다.");
	            history.go(-1);
	        </script>
	    <%
	        } else if(check == -3){
        
        
	    %>
			<script>
	            alert("세부 모델을 입력하지 않았습니다. ");
	            history.go(-1);
	        </script>
	    <%
	        } else {
	    %> <script>
	            alert("잘못된 정보");
	            history.go(-1);
	        </script>
	    <%
	        } %>
	        
        

    
</body>
</html>




