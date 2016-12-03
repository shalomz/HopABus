package com.bus.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Calendar;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SaveTransaction
 */
@WebServlet("/SaveTransaction")
public class SaveTransaction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveTransaction() {
		super();
		
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String BusID = request.getParameter("BusID");
		int id = 0;
		request.getParameter("origin");
		request.getParameter("destination");
		String time = request.getParameter("time");
		request.getParameter("category");
		request.getParameter("fare");
		request.getParameter("seatNumber");
		String customerName = request.getParameter("customerName");
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp TransactionTime = new java.sql.Timestamp(calendar
				.getTime().getTime());
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into Transactions values(?,?,?,?,?)");
			state.setString(2, BusID);
			state.setInt(1, id);
			state.setString(3, customerName);
			state.setTimestamp(4, TransactionTime);
			state.setString(5, time);
			state.executeUpdate();
			RequestDispatcher dispatcher = request
					.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);
			out.println("Registered Successfully");
			request.setAttribute("message", true);

		} catch (SQLException | ClassNotFoundException e) {
			out.println("SQLException :" + e.getMessage());
		}
	}
}
