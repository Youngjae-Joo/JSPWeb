<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	Integer k = Integer.parseInt(request.getParameter("kor"));
	Integer e = Integer.parseInt(request.getParameter("eng"));
	Integer m = Integer.parseInt(request.getParameter("math"));
	
	Double d = ((double)(k+e+m)/3);
	String format="0.00";
	java.text.DecimalFormat df = new java.text.DecimalFormat(format);
	String avg=df.format(d);
	
	if(d>=60){
		request.setAttribute("avg", avg);
		request.getRequestDispatcher("forward_quiz01_ok.jsp").forward(request, response);
	}else{
		request.getRequestDispatcher("forward_quiz01_no.jsp").forward(request, response);
	}

%>
