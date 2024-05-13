package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.ReplyBean;
import com.mvc.beans.OpenMessageBean;

public class ReplyDAO {

	static Connection con = null;
	static PreparedStatement pst = null;
	static ResultSet rs = null;
	static boolean flag = false;

	// --------------START------get connection---------------
	/**
	 *
	 * @author : anju
	 * @date :
	 * @version: 1.0
	 * @purpose: connection
	 * @param :
	 *            Nothing
	 * @throws :
	 * @return : Nothing
	 */
	public static Connection getDbConnection() throws SQLException {

		try {
			DBDAO.connect();
			con = DBDAO.getDbCon();

		} catch (ClassNotFoundException ex) {

			ex.printStackTrace();

		} catch (SQLException e) {

			e.printStackTrace();
		}

		return con;
	}

	// ------------------END-------------database connection---------
	// --------------START------insert details-------------------------

	public static boolean insertReplyForQuestion(ReplyBean replyBean) throws SQLException {
		boolean flag=false;
		try {
			con = getDbConnection();
			String query = "INSERT INTO postreply (msg_id, reply_details, reply_user_name, reply_user_email, reply_creation_date, reply_status) VALUES (?, ?, ?, ?, ?, ?)";
            pst = con.prepareStatement(query);
           
            pst.setInt(1, replyBean.getMessageID());
            pst.setString(2, replyBean.getReplyDetails());
            pst.setString(3, replyBean.getReplyUserName());
            pst.setString(4, replyBean.getReplyUserEmailId());
            pst.setString(5, replyBean.getReplyCreationDate());
            pst.setInt(6, replyBean.getReplyStatus());
            
            			
            int rowsAffected = pst.executeUpdate();
            if (rowsAffected > 0) {
                flag = true;
            }
		} catch (SQLException sql) {
			sql.printStackTrace();
		}
		return flag;
	}
	// --------------END------insert details-------------------------

	// ---------------------------------list all reply for a message----------------------------------------
	public static ArrayList<ReplyBean> getAllReplysForMessage(OpenMessageBean messageBean) throws SQLException {
		ArrayList<ReplyBean> replyList = new ArrayList<ReplyBean>();
		con = getDbConnection();
		try {
			String query= "SELECT reply_id, msg_id, reply_details, reply_user_name, reply_user_email, reply_creation_date, reply_status FROM postreply where msg_id="+messageBean.getMessageID();
			pst = con.prepareStatement(query);
			rs = pst.executeQuery();
			while (rs.next()) {
				ReplyBean reply = new ReplyBean();
				reply.setReplyId(rs.getInt("reply_id"));
				reply.setMessageID(rs.getInt("msg_id"));
				reply.setReplyDetails(rs.getString("reply_details"));
				reply.setReplyUserName(rs.getString("reply_user_name"));
				reply.setReplyUserEmailId(rs.getString("reply_user_email"));
				reply.setReplyCreationDate(rs.getString("reply_creation_date"));
				reply.setReplyStatus(rs.getInt("reply_status"));
				
				replyList.add(reply);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return replyList;
	}

	// --------------END----------------------------------------------------------------
	
	
		
		}
