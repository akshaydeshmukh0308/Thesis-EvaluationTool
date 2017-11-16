<%@page import="com.vissights.processmining.webservice.model.observer.Event"%>
<%@page import="java.util.List"%>
<%@page import="com.vissights.processmining.webservice.ProcessMining"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<ul>
<%

	List<Event> list = ProcessMining.getInstance().getDatabaseConnector().getEventList4Session("dasdaffafad243214");
	
	for(Event e : list) {
		out.println("<li>" + e.getId() + ": " + e.getType());
	}

%>

</ul>
</head>
<body>

</body>
</html>