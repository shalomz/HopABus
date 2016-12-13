package com.bus.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveNotification
 */
@WebServlet("/SaveNotification")
public class SaveNotification extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveNotification() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp time = new java.sql.Timestamp(calendar
				.getTime().getTime());
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into Notifi values(?,?,?)");
			state.setString(1, subject);
			state.setString(2, content);
			state.setTimestamp(3, time);
			state.executeUpdate();
			request.setAttribute("message", true);
			getServletContext().getRequestDispatcher("/addnotification.jsp").forward(
					request, response);

		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("SQLException :" + e.getMessage());
			request.setAttribute("error", true);

			getServletContext()
					.getRequestDispatcher("/addnotification.jsp").forward(
							request, response);
		}
	}
	

}
