<%--
Document : CATEGORY ACTION
Created on :04/04/2024
Author : Anju
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.mvc.beans.OpenMessageBean"%>
<%@page import="com.mvc.dao.OpenMessageDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
	//Step 1: getting values from  UI page 
	String title;
	String details;
	String tags;
	String creationDate;
	String userName;
	String emailId;
	int status;

	title = request.getParameter("title");
	details = request.getParameter("details");
	tags = request.getParameter("tags");	
	userName = request.getParameter("name");
	emailId = request.getParameter("emailId");
	status = 1;

	LocalDateTime currentDateTime = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	creationDate = currentDateTime.format(formatter);

	OpenMessageBean messageBean = new OpenMessageBean();

	messageBean.setMessageTitle(title.trim());
	messageBean.setMessageDetails(details.trim());
	messageBean.setMessageTags(tags.trim());
	messageBean.setMessageDetails(details.trim());
	messageBean.setMessageCreationDate(creationDate.trim());
	messageBean.setUserName(userName.trim());
	messageBean.setUserEmail(emailId.trim());
	messageBean.setMessageStatus(status);

	boolean flag = OpenMessageDAO.insertOpenMessage(messageBean);

	if (flag) { // if inserted
		response.sendRedirect("index.jsp"); //redirect to
	} else {
		response.sendRedirect("Error.jsp");
	}
%>