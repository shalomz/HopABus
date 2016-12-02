package com.bus.controllers;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ShowAvailableBuses
 */
@WebServlet("/ShowAvailableBuses")
public class ShowAvailableBuses extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShowAvailableBuses() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("errors", null);
		RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String origin = request.getParameter("origin");
		
		String destination = request.getParameter("destination");
		
		String time = request.getParameter("time");
		
		String category = request.getParameter("category");
		
		Connection conn = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost/Bus",
					"root", " ");
			System.out.print("Successfully Connected");
			
			// We extract the value of the column "Role" from the DB, based on the Username and Password Combination entered in by the user
			PreparedStatement state = conn
					.prepareStatement("select * from AvailableBuses where Origin=? and destination=? and time=? and category=?");

			state.setString(1, origin);
			state.setString(2, destination);
			state.setString(3, time);
			state.setString(4, category);
			
			ResultSet rs = state.executeQuery();
			
		if(rs.next()){
			request.setAttribute("errors", false);
			RequestDispatcher dispatcher = request.getRequestDispatcher("available.jsp");
			dispatcher.forward(request, response);	
			//response.sendRedirect("available.jsp");
		}
		else{
			request.setAttribute("errors", true);
			RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
			dispatcher.forward(request, response);		
		}
		} catch (SQLException | ClassNotFoundException e) {
			System.out.println("SQL EXCETION :" + e.getMessage());
		}
		
	}

}
