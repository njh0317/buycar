<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<%@ page import="pro2.LoginManager" %>
<html>
<head>
    <title>비밀번호 변경</title>
</head>
<body>
<% LoginManager loginManager = LoginManager.getInstance(); %>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

		String nowpw = request.getParameter("nowpass");
	    String pw = request.getParameter("changepw");
        String id= (String)loginManager.getUserID(session.getId());
        String realnow = (String)session.getAttribute("pass");

        MemberDAO dao = MemberDAO.getInstance();
        
        if(nowpw.equals(realnow))
        {
        	int check = dao.updateMemberpw(id, pw);
        	if(check == 1){
	    %>
		    <br><br>
		    <font size="5" color="gray">비밀번호가 수정되었습니다.</font>
		    <br><br>
		    <input type="button" value="메인으로" onclick="javascript:window.location='myinfo.jsp'"/>
	    
	    <%    session.setAttribute("pass",pw);
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
	        }else{
	    %>
	        <script>
	            alert("변경실패 ");
	            history.go(-1);
	        </script>
	    <%
	        } 
        }
        else{
	    %>
	    <script>
	         alert("비밀번호가 맞지 않습니다.");
	         history.go(-1);
	    </script>
	    <%} %>


    
</body>
</html>




