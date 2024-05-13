<%--
Document : CATEGORY ACTION
Created on :07/04/2024
Author : Anju
--%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="com.mvc.beans.ReplyBean"%>
<%@page import="com.mvc.dao.ReplyDAO"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.format.DateTimeFormatter"%>

<%
	//Step 1: getting values from  UI page 
	int messageId;
	String details;	
	String creationDate;
	String userName;
	String emailId;
	int status;

	messageId = Integer.parseInt(request.getParameter("messageID"));	
	details = request.getParameter("replyDetails");		
	userName = request.getParameter("name");
	emailId = request.getParameter("emailId");
	status = 1;

	LocalDateTime currentDateTime = LocalDateTime.now();
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
	creationDate = currentDateTime.format(formatter);

	ReplyBean replyBean = new ReplyBean();

	replyBean.setMessageID(messageId);
	replyBean.setReplyDetails(details.trim());		
	replyBean.setReplyCreationDate(creationDate.trim());
	replyBean.setReplyUserName(userName.trim());
	replyBean.setReplyUserEmailId(emailId.trim());
	replyBean.setReplyStatus(status);

	boolean flag = ReplyDAO.insertReplyForQuestion(replyBean);

	if (flag) { // if inserted
		
		response.sendRedirect("MessageDetails.jsp?id=" + messageId);
	} else {
		response.sendRedirect("Error.jsp");
	}
%>