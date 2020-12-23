package com.auth.ctrl;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.mail.Session;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.auth.model.AuthService;
import com.auth.model.AuthVO;
import com.emp.model.EmpService;
import com.emp.model.EmpVO;
import com.func.model.FuncService;
import com.func.model.FuncVO;


public class AuthServlet extends HttpServlet{

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}
	
	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");		
		String action = req.getParameter("action");
		
		//修改單筆權限
		if("update".equals(action)) {
//			List<AuthVO> authList = new ArrayList<AuthVO>();			
			
		try {					
			String empNo = req.getParameter("empNo");			
			
			FuncService funcSvc = new FuncService();
			List<FuncVO> funcList = funcSvc.getAll();
			
			AuthService authSvc = new AuthService();
			
			authSvc.deleteEmp(empNo);
			
			EmpService empSvc = new EmpService();
			String empName = empSvc.getOneEmp(empNo).getEmpName();
			
			EmpVO empVO = new EmpVO();
			
			
			AuthVO authVO = new AuthVO();
			
			for (FuncVO funcVO : funcList) {
				String funcNo = funcVO.getFuncNo();
				String funcName = funcVO.getFuncName();
				String funcNoString = req.getParameter(funcNo);
				
				if(funcNoString != null) {
//					authVO.setEmpNo(empNo);
//					
//					authVO.setFuncNo(funcNoString);
//					authVO.setFuncName(funcName);
					authSvc.updateAuth(empNo, empName, funcNoString, funcName);					
				}
				
			}
			
//			String cb1 =req.getParameter("cb1");
//			String cb2 =req.getParameter("cb2");
//			String cb3 =req.getParameter("cb3");
						
			
//			if(cb1 == null) {
//				authVO.getFuncNo();
//				authSvc.deleteEmpFunc(empNo,cb1);
//				
//			}
						
//			if (cb1 != null) {
//				authVO.setEmpNo(empNo);
//				authVO.setFuncNo(cb1);
////				authList.add(authVO);
//				authSvc.addAuth(empNo, cb1);
//			}
//			
//			if(cb2 != null) {
//				authVO.setEmpNo(empNo);
//				authVO.setFuncNo(cb2);
////				authList.add(authVO);
//				authSvc.addAuth(empNo, cb2);
//				
//			}
//			if (cb3 != null) {
//				authVO.setEmpNo(empNo);
//				authVO.setFuncNo(cb3);
////				authList.add(authVO);
//				authSvc.addAuth(empNo, cb3);
//			}														
//			List<AuthVO> list = authSvc.getOneEmp(empNo);			
//			req.setAttribute("authList", authList);
			
			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showAllAuth.jsp");
			rd.forward(req, res);
		}
			catch (Exception e) {
//				errMessages.add("呃...那個...無法更新資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/backEndG5/showAllAuth.jsp");
				failureView.forward(req, res);
			}
		
		}
		
		if("getOneEmp".equals(action)) {
			String empNo = req.getParameter("empNo");
//			System.out.println(empNo);			
			AuthService authSvc = new AuthService();
			AuthVO authVO = authSvc.getOneEmpNo(empNo);
			List<AuthVO> oneEmpList = authSvc.getOneEmp(empNo);
//			List<AuthVO> oneEmpFuncsList = authSvc.getOneEmpFuncs(empNo);
			
			EmpService empSvc = new EmpService();
			EmpVO empVO = empSvc.getOneEmp(empNo);
			req.setAttribute("empVO", empVO); //已讓標頭顯示${empVO.empNo}，不然不在Authority表格裡的empNO會取不到
 			
			//在servlet先把VO list轉為String list(用foreach)，在拿到前面使用list.contains
			
			req.setAttribute("authVO", authVO);
			req.setAttribute("oneEmpList", oneEmpList);
//			req.setAttribute("oneEmpFuncsList", oneEmpFuncsList);
		
			
			
//			List<String> oneEmpFuncsList= new ArrayList<String>() ;
//			
//			for(AuthVO authVO2 : oneEmpList) {
//				oneEmpFuncsList.add(authVO2.getFuncNo());
//			}
			List<String> oneEmpFuncsList = authSvc.getOneEmpFuncs(empNo);						
			req.setAttribute("oneEmpFuncsList", oneEmpFuncsList);
			
			HttpSession session = req.getSession();
			session.setAttribute("oneEmpFuncsList", oneEmpFuncsList);
						
			RequestDispatcher rd = req.getRequestDispatcher("/backEndG5/showOneEmpAuth.jsp");
			rd.forward(req, res);	
			
			
		}
		
	
	}
}
