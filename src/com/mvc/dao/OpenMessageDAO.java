package com.mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.mvc.beans.OpenMessageBean;

public class OpenMessageDAO {

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

	public static boolean insertOpenMessage(OpenMessageBean messageBean) throws SQLException {
		boolean flag = false;
		try {
			con = getDbConnection();
			String query = "INSERT INTO openmessage (msg_title, msg_details, msg_creation_date, msg_user_name, msg_user_email, msg_status, msg_tags) VALUES (?, ?, ?, ?, ?, ?, ?)";
			pst = con.prepareStatement(query);

			pst.setString(1, messageBean.getMessageTitle());
			pst.setString(2, messageBean.getMessageDetails());
			pst.setString(3, messageBean.getMessageCreationDate());
			pst.setString(4, messageBean.getUserName());
			pst.setString(5, messageBean.getUserEmail());
			pst.setInt(6, messageBean.getMessageStatus());
			pst.setString(7, messageBean.getMessageTags());
			;

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

	// ---------------------------------list all messages----------------------------------------
	public static ArrayList<OpenMessageBean> getAllMessages() throws SQLException {
		ArrayList<OpenMessageBean> message = new ArrayList<OpenMessageBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement(
					"SELECT msg_id, msg_title, msg_details, msg_creation_date, msg_user_name, msg_user_email, msg_status, msg_tags FROM openmessage where msg_status>0");
			rs = pst.executeQuery();
			while (rs.next()) {
				OpenMessageBean messageobj = new OpenMessageBean();
				messageobj.setMessageID(rs.getInt("msg_id"));
				messageobj.setMessageTitle(rs.getString("msg_title"));
				messageobj.setMessageDetails(rs.getString("msg_details"));
				messageobj.setMessageCreationDate(rs.getString("msg_creation_date"));
				messageobj.setUserName(rs.getString("msg_user_name"));
				messageobj.setUserEmail(rs.getString("msg_user_email"));
				messageobj.setMessageStatus(rs.getInt("msg_status"));
				messageobj.setMessageTags("msg_tags");
				message.add(messageobj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}

	// --------------END----------------------------------------------------------------
	
	
	// ---------------------------------list all messages----------------------------------------
	public static ArrayList<OpenMessageBean> getSearchMessages(String searchText) throws SQLException {
		ArrayList<OpenMessageBean> message = new ArrayList<OpenMessageBean>();
		con = getDbConnection();
		try {
			String query = "SELECT "
					+ " msg_id, msg_title, msg_details, msg_creation_date, msg_user_name, msg_user_email, msg_status, msg_tags "
					+ " FROM " + "  openmessage " + "WHERE " + "    msg_status > 0 " + "    AND ("
					+ "       msg_title LIKE CONCAT('%', ?, '%') " + "       OR msg_details LIKE CONCAT('%', ?, '%') "
					+ "       OR msg_tags LIKE CONCAT('%', ?, '%') " + "  )" + " ORDER BY " + "msg_details ," + "CASE "
					+ "        WHEN msg_title LIKE CONCAT('%', ?, '%') THEN 0 "
					+ "        WHEN msg_tags LIKE CONCAT('%', ?, '%') THEN 1 " + "        ELSE 2 " + "    END, "

					+ "    msg_title, " + "   msg_tags;";
			pst = con.prepareStatement(query);
			pst.setString(1, searchText);
			pst.setString(2, searchText);
			pst.setString(3, searchText);
			pst.setString(4, searchText);
			pst.setString(5, searchText);

			rs = pst.executeQuery();
			while (rs.next()) {
				OpenMessageBean messageobj = new OpenMessageBean();
				messageobj.setMessageID(rs.getInt("msg_id"));
				messageobj.setMessageTitle(rs.getString("msg_title"));
				messageobj.setMessageDetails(rs.getString("msg_details"));
				messageobj.setMessageCreationDate(rs.getString("msg_creation_date"));
				messageobj.setUserName(rs.getString("msg_user_name"));
				messageobj.setUserEmail(rs.getString("msg_user_email"));
				messageobj.setMessageStatus(rs.getInt("msg_status"));
				messageobj.setMessageTags("msg_tags");
				message.add(messageobj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}

	// --------------END----------------------------------------------------------------

	// ---------------------------------list Open messages----------------------------------------
	public static ArrayList<OpenMessageBean> getMessageDetailsById(OpenMessageBean messageBean) throws SQLException {
		ArrayList<OpenMessageBean> message = new ArrayList<OpenMessageBean>();
		con = getDbConnection();
		try {
			pst = con.prepareStatement(
					"SELECT msg_id, msg_title, msg_details, msg_creation_date, msg_user_name, msg_user_email, msg_status, msg_tags FROM openmessage where msg_id=?");
			pst.setInt(1, messageBean.getMessageID());
			rs = pst.executeQuery();
			while (rs.next()) {
				OpenMessageBean messageobj = new OpenMessageBean();
				messageobj.setMessageID(rs.getInt("msg_id"));
				messageobj.setMessageTitle(rs.getString("msg_title"));
				messageobj.setMessageDetails(rs.getString("msg_details"));
				messageobj.setMessageCreationDate(rs.getString("msg_creation_date"));
				messageobj.setUserName(rs.getString("msg_user_name"));
				messageobj.setUserEmail(rs.getString("msg_user_email"));
				messageobj.setMessageStatus(rs.getInt("msg_status"));
				messageobj.setMessageTags("msg_tags");
				message.add(messageobj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return message;
	}

	// --------------END----------------------------------------------------------------

	public static ArrayList<OpenMessageBean> getAllMessagesWithPagination(int startIndex, int recordsPerPage)
			throws SQLException {
		ArrayList<OpenMessageBean> messageList = new ArrayList<>();
		con = getDbConnection();
		try {
			String query = "SELECT msg_id, msg_title, msg_details, msg_creation_date, msg_user_name, msg_user_email, msg_status, msg_tags "
					+ "FROM openmessage WHERE msg_status > 0 " + " ORDER BY msg_creation_date DESC "
					+ "LIMIT ? OFFSET ?";
			pst = con.prepareStatement(query);
			pst.setInt(1, recordsPerPage);
			pst.setInt(2, startIndex);
			rs = pst.executeQuery();
			while (rs.next()) {
				OpenMessageBean messageobj = new OpenMessageBean();
				messageobj.setMessageID(rs.getInt("msg_id"));
				messageobj.setMessageTitle(rs.getString("msg_title"));
				messageobj.setMessageDetails(rs.getString("msg_details"));
				messageobj.setMessageCreationDate(rs.getString("msg_creation_date"));
				messageobj.setUserName(rs.getString("msg_user_name"));
				messageobj.setUserEmail(rs.getString("msg_user_email"));
				messageobj.setMessageStatus(rs.getInt("msg_status"));
				messageobj.setMessageTags(rs.getString("msg_tags"));
				messageList.add(messageobj);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messageList;
	}

	public static int getTotalRecords() throws SQLException {
	    int totalRecords = 0;
	    con = getDbConnection();
	    try {
	        String query = "SELECT COUNT(*) AS total FROM openmessage WHERE msg_status > 0";
	        pst = con.prepareStatement(query);
	        rs = pst.executeQuery();
	        if (rs.next()) {
	            totalRecords = rs.getInt("total");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }
	    return totalRecords;
	}
}
