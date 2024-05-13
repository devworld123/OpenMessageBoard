<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@page import="com.mvc.beans.OpenMessageBean"%>
<%@page import="com.mvc.dao.OpenMessageDAO"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link rel="icon" href="images/favicon.ico" type="image/x-icon">
    
 </head>
<body>
    <div class="wrapper">
        <%@ include file="Header.jsp" %>
        <div class="content">
	        <div class="post-list">
                <h2>Top Questions</h2>
                <%-- Iterate over a list of posts here --%>
                <%
	                int pageNum = 1; // Default page number
	                int recordsPerPage = 4; // Number of records per page
	                String pageNumStr = request.getParameter("page");
	                if (pageNumStr != null) {
	                    pageNum = Integer.parseInt(pageNumStr);
	                }
	                int startIndex = (pageNum - 1) * recordsPerPage;
	                ArrayList<OpenMessageBean> messageslist = OpenMessageDAO.getAllMessagesWithPagination(startIndex, recordsPerPage);
	                
                    //ArrayList <OpenMessageBean> messageslist = OpenMessageDAO.getAllMessages(); 
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
            
            <%-- Pagination Navigation --%>
            <div class="pagination">
                <%
                    int totalRecords = OpenMessageDAO.getTotalRecords();
                    int totalPages = (int) Math.ceil((double) totalRecords / recordsPerPage);
                    for (int i = 1; i <= totalPages; i++) {
                        if (i == pageNum) {
                %>
                <span class="current"><%= i %></span>
                <%
                        } else {
                %>
                <a href="?page=<%= i %>"><%= i %></a>
                <%
                        }
                    }
                %>
            </div>
		</div>
        <%@ include file="Footer.jsp" %>
    </div>
</body>
</html>