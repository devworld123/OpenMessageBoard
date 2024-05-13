<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.mvc.beans.OpenMessageBean"%>
<%@page import="com.mvc.dao.OpenMessageDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    <title>Search Results</title>    
</head>
<body>
    <div class="wrapper">
        <%@ include file="Header.jsp" %>
        <div class="content">
	        <div class="post-list">
                <h2>Results</h2>
                <%-- Iterate over a list of posts here --%>
                <%
                	String searchText = request.getParameter("search-text");
                	
                    ArrayList <OpenMessageBean> messageslist = OpenMessageDAO.getSearchMessages( searchText);
                    for (OpenMessageBean messages : messageslist) {
                %>
                <div class="post">
                    <h3><a href="MessageDetails.jsp?id=<%= messages.getMessageID() %>"><%= messages.getMessageTitle() %></a></h3>
                    <p><%= messages.getMessageDetails() %></p>
                    <div class="post-details">
                        <span>Posted by <%= messages.getUserName() %> on <%= messages.getMessageCreationDate() %></span>
                                               
                    </div>
                </div>
                <% } %>
            </div>
		</div>
        <%@ include file="Footer.jsp" %>
    </div>
</body>
</html>