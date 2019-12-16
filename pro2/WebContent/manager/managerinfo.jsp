<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<%
        String select = request.getParameter("pageChange");
 
        if (select == null) {
            select = "../info/myinfomain.jsp";
        }
    %>
    <table border=0 width=700 height = 500>
        <tr>
            <td width=100><jsp:include page="LeftMenu.jsp" flush="false" /></td>
            <td><jsp:include page="<%=select%>" flush="false" /></td>
        </tr>

    </table>

</body>
</html>