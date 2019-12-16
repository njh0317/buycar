<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page language = "java" import = "java.text.*, java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Sign up</title>
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
						<a href="login.jsp">Sign in</a>
						<a href="sign_up.jsp">Sign up</a>
					</nav>
					<a href="#navPanel" class="navPanelToggle"><span class="fa fa-bars"></span></a>
				</div>
			</header>

		<section id="three" class="wrapper" style="padding: 30px">
				<div class="inner">
					<header class="align-center">
						<h2><strong>ȸ�� ����</strong></h2>
						<p>Insert your information</p>
						
						<script type="text/javascript">
						
						function writeCheck() {
							var form = document.writeform; 
							var patter2 = /^\d{3}-\d{3,4}-\d{4}$/;
							var patter3 = /^\d{4}-\d{2}-\d{2}$/;
							if( !document.writeform.id.value) // form �� �ִ� name ���� ���� �� 
							{ 
								alert( "id�� �Է��ϼ���" ); // ���â ��� 
								form.id.focus(); // form �� �ִ� name ��ġ�� �̵� 
								return false; 
							} 
							if(document.writeform.isDuplication.value!="idCheck")
							{
								alert("���̵� �ߺ� üũ�� ���ּ���");
								return false;
							}
							if( !document.writeform.pass.value) // form �� �ִ� name ���� ���� �� 
							{ 
								alert( "��й�ȣ�� �Է��ϼ���" ); // ���â ��� 
								form.myname.focus(); // form �� �ִ� name ��ġ�� �̵� 
								return false; 
							} 
							if( !document.writeform.myname.value) // form �� �ִ� name ���� ���� �� 
							{ 
								alert( "�̸��� �Է��ϼ���" ); // ���â ��� 
								form.myname.focus(); // form �� �ִ� name ��ġ�� �̵� 
								return false; 
							} 
							if( !document.writeform.Phonenum.value ) 
							{ 
								alert( "��ȭ��ȣ�� �Է��ϼ���" ); 
								form.Phonenum.focus(); 
								return false; 
							} 
							if(!patter2.test(document.writeform.Phonenum.value))
							{
								alert( "000-0000-0000�� ���� ����" ); 
								form.Phonenum.focus(); 
								return false; 
							}
							if(!document.writeform.Date.value)
								return true;
							if(!patter3.test(document.writeform.Date.value) )
							{
								alert( "YYYY-MM-DD�� ���� ����" ); 
								form.Date.focus(); 
								return false; 
							}
							
							
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
						<script type="text/javascript">
						function openIdchk()
						{
							if(!document.writeform.id.value)
							{
								alert( "id�� �Է��ϼ���" ); // ���â ��� 
								form.id.focus(); // form �� �ִ� name ��ġ�� �̵� 
								return;
							}
							
							url = "idCheckForm.jsp?id="+document.writeform.id.value;
							open(url, "confirm","toolbar=no, location = no, status=no, menubar=no, scrollbars=no, resizable=no, width=300, height = 200");
							
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
						out.println("<form name=writeform method=post action=\"sign_up_ok.jsp\" onsubmit=\"return !!(writeCheck()&isValidDate());\">");
							out.println("<table border=\"1\" style=\"width: 100%\" id=\"result\">");
						
						   
						%>
					</header>
					
						<hr><br>
						
					
						<%
					
						
					            String blank = "    ";
					            String textare7 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"id\" size=\"5\" style=\"width:70%; float:left; height:25px; border: 0; \" onkeydown=\"inputIdChk();\"> ";
					            String textare8 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"pass\" size=\"5\" style=\"width:70%; height:100%; border: 0; \">";
					            String textare = "<td style=\"border: 0px;\"><input type=\"text\" name=\"myname\" size=\"5\" style=\"width:70%; height:100%; border: 0; \"> ";
					            String textare2 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Phonenum\" size=\"5\" style=\"width:70%; height:100%; border: 0;\"> ";
					            String textare3 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Addr\" size=\"5\" style=\"width:70%; height:100%; border: 0;\">";
					            String textare4 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"text\" size=\"5\" style=\"width:70%; height:100%; border: 0;\">";
					            String textare5 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Occupation\" size=\"5\" style=\"width:50%; height:100%; border: 0;\" >";
					            String textare6 = "<td style=\"border: 0px;\"><input type=\"text\" name=\"Date\" size=\"5\" style=\"width:70%; height:100%; border: 0;\">";
					            String text = "<td style=\"text-align:left\"><input type=\"radio\" name=\"gender\" value=\"0\" ondblclick=\"this.checked=false\">���� &emsp; &ensp; <input type=\"radio\" name=\"gender\" value=\"1\" ondblclick=\"this.checked=false\">����</td>";
					            
					            

								//out.println("<thead> <tr> <th>Lorem</th> <th>Ipsum</th> <th>Dolor</th>  </tr> </thead><tbody>");
								//out.println("<tr> <th>Lorem</th> <th>Ipsum</th> <th>Dolor</th>  </tr> </tbody>");
								out.println("<tr><th>*ID</th> "+textare7+"<input type = \"button\" value = \"�ߺ�Ȯ��\" style = \"font-size : 8px; height : 20%; float:right\" onclick = \"openIdchk(this.form)\"><input type = \"hidden\" name = \"isDuplication\" value =\"idUncheck\"></td><th>"+blank+"</th></tr>");
								out.println("<tr><th>*��й�ȣ</th> "+textare8+"</td><th>"+blank+"</th></tr>");
								out.println("<tr><th>*�̸�</th> "+textare+"</td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>*����ó</th>"+textare2+"</td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>�ּ�</th>"+textare3+"</td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>����</th>"+text+"<th>"+blank+"</th></tr>");
					            out.println("<tr><th>����</th>"+textare5+"</td><th>"+blank+"</th></tr>");
					            out.println("<tr><th>�������</th>"+textare6+"</td><th>"+blank+"</th></tr>");
		
					            out.println("</table>");
					            
					            out.println("<input type=\"submit\" value=\"�����ϱ�\">");
					            out.println("</form>");

							
						%>
						
					</div>
				
			</section>


</body>
</html>