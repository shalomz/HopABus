package com.bus.controllers;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bus.models.Gender;
import com.bus.models.Passenger;

/**
 * Servlet implementation class AddPassenger
 */
@WebServlet("/AddPassenger")
public class AddPassenger extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPassenger() {
		super();

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("firstName", "");
		request.setAttribute("lastName", "");
		RequestDispatcher dispatcher = request
				.getRequestDispatcher("addpassenger.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setAttribute("errors", false);
		
		Passenger passenger = new Passenger();
		String firstName = request.getParameter("firstName");

		// If the passenger's first name is empty, we set an attribute for an
		// empty firstname error
		if (firstName.length() == 0) {
			request.setAttribute("errors", true);
			request.setAttribute("firstName", "");
		} else {
			passenger.setFirstName(firstName);
			request.setAttribute("firstName", firstName);
		}

		String lastName = request.getParameter("lastName");
		if (lastName.length() == 0) {
			request.setAttribute("errors", true);
			request.setAttribute("lastName", "");
		} else {
			passenger.setLastName(lastName);
			request.setAttribute("lastName", lastName);
		}
//		String gender = request.getParameter("gender");
//		passenger.setGender(Gender.valueOf(gender));
		RequestDispatcher dispatcher = request.getRequestDispatcher("addpassenger.jsp");
		dispatcher.forward(request, response);
	}

}
