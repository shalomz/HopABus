package com.bus.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddBus
 */
@WebServlet("/AddBus")
public class AddBus extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBus() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String BusID = request.getParameter("BusID");
		int id = 0;
		String origin = request.getParameter("origin");
		String destination = request.getParameter("destination");
		String time = request.getParameter("time");

		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into AvailableBuses values(?,?,?,?)");
			state.setString(1, BusID);
			state.setString(2, origin);
			state.setString(3, destination);
			state.setString(4, time);
			state.executeUpdate();
			request.setAttribute("message", true);
			getServletContext().getRequestDispatcher("/admin.jsp").forward(
					request, response);

		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("SQLException :" + e.getMessage());
			request.setAttribute("error", true);

			getServletContext()
					.getRequestDispatcher("/book.jsp?BusID=" + BusID).forward(
							request, response);
		}
	}

}
