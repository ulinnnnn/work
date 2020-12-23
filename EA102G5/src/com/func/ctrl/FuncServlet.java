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

		// 新增功能
		if ("add".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcName = req.getParameter("funcName").trim();

				if (funcName == null || funcName.trim().length() == 0) {
					errMessages.add("功能名稱不得空白");
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

		// 取得單筆欲修改之功能
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
				errMessages.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
				failureView.forward(req, res);
			}
		}

		// 傳送確認修改資料
		if ("update".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcNo = req.getParameter("funcNo");

				String funcName = req.getParameter("funcName").trim();

				if (funcName == null || funcName.trim().length() == 0) {
					errMessages.add("功能名稱不得空白");
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

				// 成功更新
				req.setAttribute("funcVO", funcVO);
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
				rd.forward(req, res);

			} catch (Exception e) {
				errMessages.add("那個...資料修改失敗:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneUpdateFunc.jsp");
				rd.forward(req, res);
			}

		}

		// 查詢單筆功能
		if ("getOne".equals(action)) {

			List<String> errMessages = new LinkedList<String>();
			req.setAttribute("errMessages", errMessages);

			try {
				String funcNo = req.getParameter("funcNo");
				if (funcNo == null || (funcNo.trim().length() == 0)) {
					errMessages.add("請輸入功能編號");
				}
				if (!errMessages.isEmpty()) {
					RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/func.jsp");
					rd.forward(req, res);
					return;
				}

				FuncService funcSvc = new FuncService();
				FuncVO funcVO = funcSvc.getOneFunc(funcNo);

				if (funcVO == null) {
					errMessages.add("查無資料");
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
				errMessages.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/func.jsp");
				rd.forward(req, res);
			}
		}

		// 刪除功能
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
//						errMessages.add("刪除資料失敗:" + e.getMessage());
//						RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllFunc.jsp");
//						failureView.forward(req, res);
//					}
//
//				}

		// 首頁鍵
		if ("homepage".equals(action)) {
			RequestDispatcher homepage = req.getRequestDispatcher("/backEndG5/func.jsp");
			homepage.forward(req, res);
		}

	}

}