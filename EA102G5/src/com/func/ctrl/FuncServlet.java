package com.func.ctrl;

import java.io.IOException;

import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.func.model.*;

public class FuncServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		// �s�W�\��
		if ("add".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcName = req.getParameter("funcName").trim();

				if (funcName == null || funcName.trim().length() == 0) {
					errMessages.add("�\��W�٤��o�ť�");
				}

				String funcDesc = req.getParameter("funcDesc").trim();

				FuncVO funcVO = new FuncVO();
				funcVO.setFuncName(funcName);
				funcVO.setFuncDesc(funcDesc);

				if (!errMessages.isEmpty()) {
					req.setAttribute("funcVO", funcVO);
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/addFunc.jsp");
					rd.forward(req, res);
					return;
				}

				FuncService funcSvc = new FuncService();
				funcVO = funcSvc.addFunc(funcName, funcDesc);

				req.setAttribute("funcVO", funcVO);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add(e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/addFunc.jsp");
				rd.forward(req, res);
			}

		}

		// ���o�浧���ק蠟�\��
		if ("getOneUpdate".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcNo = req.getParameter("funcNo");

				FuncService funcSvc = new FuncService();
				FuncVO funcVO = funcSvc.getOneFunc(funcNo);

				req.setAttribute("funcVO", funcVO);

				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateFunc.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
				failureView.forward(req, res);
			}
		}

		// �ǰe�T�{�ק���
		if ("update".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcNo = req.getParameter("funcNo");

				String funcName = req.getParameter("funcName").trim();

				if (funcName == null || funcName.trim().length() == 0) {
					errMessages.add("�\��W�٤��o�ť�");
				}

				String funcDesc = req.getParameter("funcDesc").trim();

				FuncVO funcVO = new FuncVO();
				funcVO.setFuncNo(funcNo);
				funcVO.setFuncName(funcName);
				funcVO.setFuncDesc(funcDesc);

				if (!errMessages.isEmpty()) {
					req.setAttribute("funcVO", funcVO);
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateFunc.jsp");
					rd.forward(req, res);
					return;
				}

				FuncService funcSvc = new FuncService();
				funcVO = funcSvc.updateFunc(funcNo, funcName, funcDesc);

				// ���\��s
				req.setAttribute("funcVO", funcVO);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("����...��ƭק異��:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateFunc.jsp");
				rd.forward(req, res);
			}

		}

		// �d�߳浧�\��
		if ("getOne".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcNo = req.getParameter("funcNo");
				if (funcNo == null || (funcNo.trim().length() == 0)) {
					errMessages.add("�п�J�\��s��");
				}
				if (!errMessages.isEmpty()) {
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/func.jsp");
					rd.forward(req, res);
					return;
				}

				FuncService funcSvc = new FuncService();
				FuncVO funcVO = funcSvc.getOneFunc(funcNo);

				if (funcVO == null) {
					errMessages.add("�d�L���");
				}
				if (!errMessages.isEmpty()) {
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/func.jsp");
					rd.forward(req, res);
					return;
				}

				req.setAttribute("funcVO", funcVO);

				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOne.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("�L�k���o�n�ק諸���:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/func.jsp");
				rd.forward(req, res);
			}
		}

		// �R���\��
//				if ("delete".equals(action)) {
//
//					List<String> errMessages = new LinkedList<String>();
//					req.setAttribute("errMessages", errMessages);
//
//					try {
//						String funcNo = req.getParameter("funcNo");
//
//						FuncService funcSvc = new FuncService();
//						funcSvc.deleteFunc(funcNo);
//
//						RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
//						rd.forward(req, res);
//					} catch (Exception e) {
//						errMessages.add("�R����ƥ���:" + e.getMessage());
//						RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
//						failureView.forward(req, res);
//					}
//
//				}

		// ������
		if ("homepage".equals(action)) {
			RequestDispatcher homepage = req.getRequestDispatcher("/backEndG5/func.jsp");
			homepage.forward(req, res);
		}

	}

}