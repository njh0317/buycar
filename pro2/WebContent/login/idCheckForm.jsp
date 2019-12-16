<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="pro2.MemberDAO" %>
<%@ page import="pro2.MemberBean" %>

<html>
<head>
    <title>비밀번호 변경</title>
    <script type="text/javascript">
			function sendCheckValue()
			{
				
				opener.document.writeform.isDuplication.value = "idCheck";
				if(opener != null)
				{
					opener.chkForm = null;
					self.close();
				}
			}
				
			</script>
</head>
<body>
    <%-- 자바빈 관련 액션태그 사용 --%>
    <jsp:useBean id="memberBean" class="pro2.MemberBean" />
    <jsp:setProperty property="*" name="memberBean"/>    
    
    <%

		String id = request.getParameter("id");

        MemberDAO dao = MemberDAO.getInstance();
    
        	int check = dao.checkID(id);
        	if(check == 1){
	    %>
		    <div style="text-align:center;">
		    <br /><br />
		    <h4> 이미 사용중인 ID 입니다. </h4>
		    <br>
		    <input id = "cancelBtn" type="button" value = "취소" onclick = "window.close()"> 
		    </div>
	    
	    <%   
         // 비밀번호가 틀릴경우 - 삭제가 안되었을 경우
	        }else{
	    %>
	        <div style="text-align:center;">
		    <br /><br />
		    <h4> 입력하신<%=id %>는 사용하실 수 있는 ID입니다. </h4>
		    <br>
		    <input id = "cancelBtn" type="button" value = "취소" onclick = "window.close()">
		    <input id = "useBtn" type="button" value = "사용하기" onclick = "sendCheckValue()">
		    </div>
	    <%
	        } 
        %>


    
</body>
</html>




