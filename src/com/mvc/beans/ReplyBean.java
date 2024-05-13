package com.mvc.beans;

public class ReplyBean {
	
	int replyId;
	int messageID;
	String replyDetails;
	String replyUserName;
	String replyUserEmailId;
	String replyCreationDate;
	int replyStatus;
	
	public int getReplyId() {
		return replyId;
	}
	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}
	public int getMessageID() {
		return messageID;
	}
	public void setMessageID(int messageID) {
		this.messageID = messageID;
	}
	public String getReplyDetails() {
		return replyDetails;
	}
	public void setReplyDetails(String replyDetails) {
		this.replyDetails = replyDetails;
	}
	public String getReplyUserName() {
		return replyUserName;
	}
	public void setReplyUserName(String replyUserName) {
		this.replyUserName = replyUserName;
	}
	public String getReplyUserEmailId() {
		return replyUserEmailId;
	}
	public void setReplyUserEmailId(String replyUserEmailId) {
		this.replyUserEmailId = replyUserEmailId;
	}
	public String getReplyCreationDate() {
		return replyCreationDate;
	}
	public void setReplyCreationDate(String replyCreationDate) {
		this.replyCreationDate = replyCreationDate;
	}
	public int getReplyStatus() {
		return replyStatus;
	}
	public void setReplyStatus(int replyStatus) {
		this.replyStatus = replyStatus;
	}

}
