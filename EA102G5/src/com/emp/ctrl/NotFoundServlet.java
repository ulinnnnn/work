package com.emp.ctrl;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/backEndG5/notFound")
public class NotFoundServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		List<String> messageList = new LinkedList<String>();
		req.setAttribute("messageList", messageList);

		try {
			String textContent = req.getParameter("textContent").trim();

			if (textContent.equals("«ô°U°ÕQQ")) {
				messageList.add("¨S¸Û·N¡A¸÷¤U!!");
			}

			if (!messageList.isEmpty()) {
				req.setAttribute("textContent", textContent);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/notFound2.jsp");
				rd.forward(req, res);
				return;
			}

			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/addEmp.jsp");
			rd.forward(req, res);

		} catch (Exception e) {
			messageList.add(e.getMessage());
			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/notFound2.jsp");
			rd.forward(req, res);
		}

	}
}
