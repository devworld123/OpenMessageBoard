

<%--
Document : Post mesage or Ask question form 
Created on :04/04/2024
Author : Anju
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<title>Post Question</title>
</head>
<body>
	<div class="wrapper">
		<%@ include file="Header.jsp"%>

		<div class="content">
			
			<form action="PostMessageAction.jsp" method="POST" class="post-form">
				<h2>Ask Your Question</h2>
				<label for="title">Title:</label> 
				<span class="message">Be specific and imagine you are asking a question to another person.</span></br>
				<input type="text" id="title"	name="title" required> <br> 
				<label for="details">What are the details of your problem:</label>
				<span class="message">Introduce the problem and expand on what you put in the title.</span>
				</br>
				<textarea id="details" name="details" rows="4" required></textarea>
				<label for="title">Tags:</label> 
				<span class="message">Add tags to describe what question is about.</span></br>
				<input type="text" id="tags"	name="tags" required> <br>
				<label for="title">Name:</label> 
				<span class="message">Name to be displayed for question.</span></br>
				<input type="text" id="name"	name="name" required> <br>
				<label for="title">EmailId:</label> 
				<span class="message">Email ID of user. The same will not be disclosed .</span></br>
				<input type="text" id="emailId"	name="emailId" required> <br>
				<br>
				<br>
				<button type="submit">Post</button>
			</form>
		</div>

		<%@ include file="Footer.jsp"%>
	</div>
</body>
</html>