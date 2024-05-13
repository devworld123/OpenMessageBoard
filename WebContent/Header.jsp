<%--
Document : Page header
Created on :05/04/2024
Author : Anju
--%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/style.css" rel="stylesheet" type="text/css" />


</head>
<body>
<form action="SearchPost.jsp" method="POST">
	<header class="s-topbar">
	    <div class="s-container">
	        <div class="s-left">
	            <a href="#" class="s-logo">Open Message Board</a>
	        </div>
	        
		        <div class="s-search">
		            <input type="text" name="search-text" placeholder="Search..." required>                       
		            <button>Search</button>
		        </div>
	        
	        <div class="s-right">
	            <nav class="s-navigation">
	                <ul>
	                    <li><a href="index.jsp">Home</a></li>
	                    <li><a href="PostMessage.jsp">Ask Question</a></li>
	                    
	                    <!-- More menu items as needed -->
	                </ul>
	            </nav>
	        </div>
	    </div>
	</header>
</form>