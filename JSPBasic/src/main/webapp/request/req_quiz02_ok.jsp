<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  	request.setCharacterEncoding("utf-8");
	
	String name=request.getParameter("name");
	
	Double kg =Double.parseDouble(request.getParameter("kg"));
    Double cm=Double.parseDouble(request.getParameter("cm"));
    
	Double bmi=kg/(cm/100*cm/100);    
	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	이름:<%=name%><br>
	키:<%=cm%><br>
	몸무게:<%=kg%><br>
	BMI지수:<%=bmi%><br>
	
	BMI지수 체중:
	<%if(bmi>=25){%>
	<%="과체중"%>
	<%}else if(bmi>18){%>
	<%="정상"%>
	<%}else{ %>
	<%="저체중"%>
	<%} %>

</body>
</html>