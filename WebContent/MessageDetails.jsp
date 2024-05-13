

<%--
Document : Message details 
Created on :05/04/2024
Author : Anju
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
<%@page import="com.mvc.beans.OpenMessageBean"%>
<%@page import="com.mvc.dao.OpenMessageDAO"%>
<%@page import="com.mvc.beans.ReplyBean"%>
<%@page import="com.mvc.dao.ReplyDAO"%>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Message Details</title>
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
</head>
<body>
				
	<div class="wrapper">
		<%@ include file="Header.jsp"%>
				<%
					int messageId=Integer.parseInt(request.getParameter("id"));
					OpenMessageBean messageObj=new OpenMessageBean();
					messageObj.setMessageID(messageId);
                    ArrayList <OpenMessageBean> messageslist = OpenMessageDAO.getMessageDetailsById(messageObj); 
                    
                    ArrayList <ReplyBean> replyList = ReplyDAO.getAllReplysForMessage(messageObj); 
    				int replyCount=	replyList.size();
                    
                 %>
		<div class="content">	
                <%
                    for (OpenMessageBean message : messageslist) {
                %>
                <div class="detailspage">
			<div class="post-details">
			    <h2 class="post-title"><%= message.getMessageTitle() %></h2>
			    <div class="post-content">
			        <p><%= message.getMessageDetails() %></p>
			        
			    </div>
			    <div class="post-meta">
			        <span class="post-author">Posted by <%= message.getUserName() %> </span>
			        <span class="post-date">Posted on <%= message.getMessageCreationDate() %></span>
			        <span class="post-comments"><%= replyCount %> comments</span>
			    </div>
			</div>
			</div>
			 <% } %>
			 
			<div class="reply-list">
			
				 <h3 class="section-title"><%= replyCount %> Answers</h3>
			    <!-- First Reply -->
			    
			    <%
                    for (ReplyBean reply : replyList) {
                %>
			    <div class="reply-item">
			        
			        <div class="reply-content">
			            <div class="reply-meta">
			                <span class="reply-author"><%= reply.getReplyUserName() %></span>
			                <span class="reply-date">Posted on <%= reply.getReplyCreationDate() %></span>
			            </div>
			            <div class="reply-body">
			                <p><%= reply.getReplyDetails() %></p>
			            </div>
			        </div>
			    </div>
			    <% } %>
			</div>
			
			
			<form action="PostReplyAction.jsp" method="POST" class="post-form">
				<h2>Your answer</h2>
				<input type='hidden' name='messageID' value='<%= messageId %>'/>
				<span class="message">Be specific </span></br>
				<textarea id="replyDetails" name="replyDetails" rows="4" required></textarea> <br> 
				<label for="details">Name:</label>
				<span class="message">Name to be displayed for question.</span></br>
				<input type="text" id="name"	name="name" required> <br>
				<label for="title">EmailId:</label> 
				<span class="message">Email ID of user. The same will not be disclosed .</span></br>
				<input type="text" id="emailId"	name="emailId" required> <br>
				<br>
				<br>
				<button type="submit">Post your answer</button>
			</form>
		</div>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>