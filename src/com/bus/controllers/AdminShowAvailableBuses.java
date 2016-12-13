package com.bus.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AdminShowAvailableBuses
 */
@WebServlet("/AdminShowAvailableBuses")
public class AdminShowAvailableBuses extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdminShowAvailableBuses() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		Connection conn = null;

		try {
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.print("Successfully Connected using doGet Method");
			Statement state = conn.createStatement();
			ResultSet result = state
					.executeQuery("Select count(*) from Transactions");
			if (result.next()) {
				int bookedSeats = result.getInt(1);
				int availableSeats = 60 - bookedSeats;
				System.out.println("Available number of seats is"
						+ availableSeats);
				request.setAttribute("availableSeats", availableSeats);
				request.getServletContext()
						.getRequestDispatcher("/adminavailable.jsp")
						.forward(request, response);
			} else {
				request.setAttribute("errors", true);
				response.sendRedirect("adminindex.jsp");
			}

		} catch (SQLException e) {
			System.out.println("SQLException :" + e.getMessage());
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String origin = request.getParameter("origin");

		String destination = request.getParameter("destination");

		String time = request.getParameter("time");

		Connection conn = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.print("Successfully Connected");

			PreparedStatement state = conn
					.prepareStatement("select * from AvailableBuses where Origin=? and destination=? and time = ? ");

			state.setString(1, origin);
			state.setString(2, destination);
			state.setString(3, time);

			ResultSet rs = state.executeQuery();

			if (rs.next()) {

				// Counting the number of entries in the DB, to check if all the
				// seats have been occupied.
				ResultSet result = state
						.executeQuery("Select count(*) from Transactions");
				result.next();

				// Here we set the variable bookedSeats to the number of
				// entries(rows) in the Transactions Table
				int bookedSeats = result.getInt(1);

				// We then assign the value of 60 - bookedSeats to the number of
				// availableSeats
				int availableSeats = 60 - bookedSeats;

				System.out.println("Available number of seats is"
						+ availableSeats);

				// We then set an attribute to the number of available seats. We
				// will use this attribute to display total number of available
				// seats 
				// on the available buses template
				request.setAttribute("availableSeats", availableSeats);
				request.setAttribute("errors", false);
				getServletContext().getRequestDispatcher("/adminavailable.jsp")
						.forward(request, response);

			} else {
				request.setAttribute("errors", true);
				getServletContext().getRequestDispatcher("/adminindex.jsp")
						.forward(request, response);

			}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("SQL EXCETION :" + e.getMessage());
		}

	}

}
