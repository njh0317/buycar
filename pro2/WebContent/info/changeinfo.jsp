<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>
<%@ page import="pro2.LoginManager" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% LoginManager loginManager = LoginManager.getInstance(); %>
<title>MY INFO Results</title>
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
						<h2><strong>���� ����</strong></h2>
						<p>This is my information</p>
						
						<script type="text/javascript">
						
						function writeCheck() {
							var form = document.writeform; 
							var patter2 = /^\d{3}-\d{3,4}-\d{4}$/;
							var patter3 = /^\d{4}-\d{2}-\d{2}$/;
							if( !document.writeform.myname.value) // form �� �ִ� name ���� ���� �� 
							{ 
								alert( "�̸��� �����ּ���" ); // ���â ��� 
								form.myname.focus(); // form �� �ִ� name ��ġ�� �̵� 
								return false; 
							} 
							if( !document.writeform.Phonenum.value ) 
							{ 
								alert( "��ȭ��ȣ�� �����ּ���" ); 
								form.Phonenum.focus(); 
								return false; 
							} 
							if(!patter2.test(document.writeform.Phonenum.value))
							{
								alert( "000-0000-0000�� ���� ����" ); 
								form.Phonenum.focus(); 
								return false; 
							}	
							if(!patter3.test(document.writeform.Date.value) )
							{
								alert( "YYYY-MM-DD�� ���� ����" ); 
								form.Date.focus(); 
								return false; 
							}
							else if(!document.writeform.Date.value)
								return true;
							
							return true;
							//form.submit(); 
							} 
						</script>
						<script type="text/javascript">
						function isValidDate() 
						{
							
							if(!document.writeform.Date.value) 
								return true;
						     var year = Number(document.writeform.Date.value.substr(0,4));    
						     var month = Number(document.writeform.Date.value.substr(5,2));
						     
						     var day = Number(document.writeform.Date.value.substr(8,2));
						     
						     var today = new Date(); // ���� ���� ����
						     
						     var yearNow = today.getFullYear();
						     
						     var adultYear = yearNow-20;
						     
						     if (year < 1900 || year > adultYear){
						          alert("�⵵�� Ȯ���ϼ���. \n("+adultYear+"��� ���� ����ڸ� ��� �����մϴ�.)");
						          return false;
						     }
						     if (month < 1 || month > 12) { 
						          alert("���� 1������ 12������ �Է� �����մϴ�.");
						          return false;
						     }
						    if (day < 1 || day > 31) {
						          alert("���� 1�Ϻ��� 31�ϱ��� �Է°����մϴ�.");
						          return false;
						     }
						     if ((month==4 || month==6 || month==9 || month==11) && day==31) {
						          alert(month+"���� 31���� �������� �ʽ��ϴ�.");
						          return false;
						     }
						     if (month == 2) {
						          var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
						          if (day>29 || (day==29 && !isleap)) {
						               alert(year + "�� 2����  " + day + "���� �����ϴ�.");
						               return false;
						          }
						     }
						     return true;
						}

						</script>
						<script>
						function inputIdChk()
						{
							document.writeform.idDuplication.value="idUnchecked";
						}
						</script>

						<% 
						//*���̵�, *��й�ȣ, *��ȭ��ȣ, *�̸�, �ּ�, ����, �������, ����
						out.println("<form name=\"writeform\" method=\"post\" action=\"info_ok.jsp\" onsubmit=\"return !!(writeCheck()&isValidDate());\">");
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
						
							String serverIP = (String)session.getAttribute("serverIP");
							   String strSID = (String)session.getAttribute("strSID");
							   String portNum = (String)session.getAttribute("portNum");
							   String user = (String)session.getAttribute("user");
							   String pass = (String)session.getAttribute("passnum");
							   String url = "jdbc:oracle:thin:@"+serverIP+":"+portNum+":"+strSID;
						  
						   Connection conn = null;
						   PreparedStatement pstmt;
						   ResultSet rs;
						   Class.forName("oracle.jdbc.driver.OracleDriver");
						   conn = DriverManager.getConnection(url,user,pass);
						%>
					</header>
					
						<hr><br>
						
					
						<%
						String SQL = "SELECT * FROM ACCOUNT WHERE ID = ?";
						String loginID = (String)loginManager.getUserID(session.getId());
						try {
					         pstmt = conn.prepareStatement(SQL);
					         pstmt.setString(1, loginID);
					         // rs:result set �� �������
					         rs = pstmt.executeQuery();
					         // ����� �����Ѵٸ� ����
					         if (rs.next()) {
					            // �н����� ��ġ�Ѵٸ� ����
					            String blank = "    ";
					            String textare = "<td style=\"border: 0px;\"><input type=\"text\" name=\"myname\" size=\"5\" style=\"width:70%; height:70%; border: 0; \" value = '";
					            String textare2 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Phonenum\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare3 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Addr\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare4 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"text\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare5 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Occupation\" size=\"5\" style=\"width:50%; height:70%; border: 0;\" value = '";
					            String textare6 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Date\" size=\"5\" style=\"width:70%; height:70%; border: 0;\" value = '";
					            String textare7 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"date2\" size=\"5\" style=\"width:33%; height:70%; border: 0;\" value = '";
					            String textare8 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"date3\" size=\"5\" style=\"width:33%; height:70%; border: 0;\" value = '";
					            
					            String text = "<td style=\"text-align:left\"><input type=\"radio\" name=\"gender\" value=\"0\" ondblclick=\"this.checked=false\">���� &emsp; &ensp; <input type=\"radio\" name=\"gender\" value=\"1\" ondblclick=\"this.checked=false\">����</td>";
					            
					            
					            String id = rs.getString(1);
					            String password = rs.getString(2);
					            String phonenum = rs.getString(3);
					            String gender = rs.getString(4);
					            String occupation = rs.getString(5);
					            String date = rs.getString(6);
					            String name = rs.getString(7);
					            String addr = rs.getString(8);
					            String num = rs.getString(9);
					            if(  gender == null) gender = "";	      
					    		
					            if(  occupation == null) occupation = "";	      
					            if(date != null)
					            {
					               date = date.substring(0, 10);
					            }
					            if(  date == null) date = "";
					            if(  addr == null) addr = "";
					            

					            
					            int count = rs.getInt(9);

								
								out.println("<tr><th>*�̸�</th> "+textare+name+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>*����ó</th>"+textare2+phonenum+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>�ּ�</th>"+textare3+addr+"'></td><th>"+blank+"</th></tr>");
					     
					            out.println("<tr><th>����</th>"+text+"<th>"+blank+"</th></tr>");
					            out.println("<tr><th>����</th>"+textare5+occupation+"'></td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>�������</th>"+textare6+date+"'></td><th>"+blank+"</th></tr>");
					            
					            
					            out.println("</table>");
					            
					            out.println("<input type=\"submit\" value=\"����\">");
					            out.println("</form>");
					            try{
									if(pstmt!=null)pstmt.close();
									if(conn!=null)conn.close();
								}catch(Exception ex){
									System.out.println("Ŀ�ؼ� ���� Exception�߻� : "+ex.getMessage());
								}

					         }
					      } catch (Exception e) {
					         e.printStackTrace();
					      }
							
						%>
						
					</div>
				
			</section>


</body>
</html>