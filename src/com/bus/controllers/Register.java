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
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
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
		PrintWriter out = response.getWriter();
		int phonenumber = Integer.parseInt(request.getParameter("phonenumber"));
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email =request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		Calendar calendar = Calendar.getInstance();
		java.sql.Timestamp dateregistered = new java.sql.Timestamp(calendar
				.getTime().getTime());
		request.getParameter("seatNumber");
		String customerName = request.getParameter("customerName");
		
		Connection conn = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.println("Connected successfully to DB");
			PreparedStatement state = conn
					.prepareStatement("insert into Customers values(?,?,?,?,?,?,?)");
			state.setString(1,firstname );
			state.setInt(3, phonenumber);
			state.setString(2, lastname);
			state.setString(4, email);
			state.setString(5, username);
			state.setString(6, password);
			state.setTimestamp(7, dateregistered);
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
