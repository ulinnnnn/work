package com.Bid_commodity.controller;

import java.io.*;
import java.util.*;
import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import com.Bid_record.model.*;
import com.Bid_commodity.model.Bid_commodityService;
import com.Bid_commodity.model.Bid_commodityVO;
import com.Bid_record.model.Bid_recordService;
import com.Bid_record.model.Bid_recordVO;
import com.depo.model.DepoService;
import com.depo.model.DepoVO;

@MultipartConfig
public class Bid_commodityServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("bp_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				String bp_no = null;
				try {
					bp_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("員工編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				Bid_commodityService bid_commoditySvc = new Bid_commodityService();
				Bid_commodityVO bid_commodityVO = bid_commoditySvc.getOneBid(bp_no);
				if (bid_commodityVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bid_commodityVO", bid_commodityVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/listOneBid_commodity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOnebc_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String bc_no = req.getParameter("bc_no");


				/*************************** 2.開始查詢資料 *****************************************/
				Bid_commodityService bid_commoditySvc = new Bid_commodityService();
				List<Bid_commodityVO> list= bid_commoditySvc.getOnebc_no(bc_no);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("list", list); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/listOneBid_commodity.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/Bid.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				String bp_no = new String(req.getParameter("bp_no"));

				/*************************** 2.開始查詢資料 ****************************************/
				Bid_commodityService bid_commoditySvc = new Bid_commodityService();
				Bid_commodityVO bid_commodityVO = bid_commoditySvc.getOneBid(bp_no);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("bid_commodityVO", bid_commodityVO); // 資料庫取出的empVO物件,存入req
				String url = "/bid_front_end/update.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/listAllEmp.jsp");
				failureView.forward(req, res);
			}
		}
		if ("Bidinsert".equals(action)) { // 來自addEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			String b_name = req.getParameter("b_name");
			String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
			if (b_name == null || b_name.trim().length() == 0) {
				errorMsgs.add("商品名稱: 請勿空白");
			} 
			Integer bs_price = null;
			try {
				bs_price = new Integer(req.getParameter("bs_price").trim());
			} catch (NumberFormatException e) {
				bs_price = 0;
				errorMsgs.add("價錢請填數字.");
			}
			String b_intro = req.getParameter("b_intro");
			if (b_intro == null || b_intro.trim().length() == 0) {
				errorMsgs.add("商品介紹:請勿空白");
			}
			String mem_no = req.getParameter("mem_no");

			Integer bplus_price = null;
			try {
				bplus_price = new Integer(req.getParameter("bplus_price").trim());
			} catch (NumberFormatException e) {
				bplus_price = 0;
				errorMsgs.add("加價請填數字.");
			}
			String bc_no = req.getParameter("bc_no");
			if (bc_no == null || bc_no.trim().length() == 0) {
				errorMsgs.add("選擇類別編號");
			}

			java.sql.Timestamp b_startime = null;
			try {
				b_startime = java.sql.Timestamp.valueOf(req.getParameter("b_startime").trim());
			} catch (IllegalArgumentException e) {
				b_startime = new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
			}
			java.sql.Timestamp b_endtime = null;
			try {
				b_endtime = java.sql.Timestamp.valueOf(req.getParameter("b_endtime").trim());
			} catch (IllegalArgumentException e) {
				b_endtime = new java.sql.Timestamp(System.currentTimeMillis());
				errorMsgs.add("請輸入日期!");
			}

			byte[] b_picture = null;
			Part part = req.getPart("myFile");
			if(part!=null) {
			InputStream in = part.getInputStream();			
			byte[] buf = new byte[in.available()];			
			in.read(buf);
			b_picture = buf;
			in.close();
			}		
			
			byte[] b_picture2 = null;
			Part part2 = req.getPart("myFile2");
			if(part2!=null) {
			InputStream in2 = part2.getInputStream();			
			byte[] buf2 = new byte[in2.available()];		
			in2.read(buf2);
			b_picture2 = buf2;
			in2.close();
			}
			
			Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
			bid_commodityVO.setMem_no(mem_no);
			bid_commodityVO.setBs_price(bs_price);
			bid_commodityVO.setB_intro(b_intro);
			bid_commodityVO.setBplus_price(bplus_price);
			bid_commodityVO.setB_startime(b_startime);
			bid_commodityVO.setB_endtime(b_endtime);
			bid_commodityVO.setBc_no(bc_no);
			bid_commodityVO.setB_name(b_name);
			bid_commodityVO.setB_picture(b_picture);
			bid_commodityVO.setB_picture2(b_picture2);
			

				
			// Send the use back to the form, if there were errors
			if (!errorMsgs.isEmpty()) {
				req.setAttribute("bid_commodityVO", bid_commodityVO); // 含有輸入格式錯誤的empVO物件,也存入req
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_1.jsp");
				failureView.forward(req, res);
				return;
			}

			/*************************** 2.開始新增資料 ***************************************/
			if(req.getSession().getAttribute("key")	!=null) {
			Bid_commodityService bid_commoditySvc = new Bid_commodityService();
			bid_commodityVO = bid_commoditySvc.addBid_commodity(mem_no,bs_price, b_intro, b_startime, b_endtime, bplus_price,
					bc_no, b_name, b_picture, b_picture2);}
			req.getSession().removeAttribute("key");
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			String url = "/bid_front_end/backBid.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
			successView.forward(req, res);

			/*************************** 其他可能的錯誤處理 **********************************/
//			} catch (Exception e) {
//				errorMsgs.add(e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/addBid_commodity.jsp");
//				failureView.forward(req, res);
//				
//			}
		}
		
		if("getOne_Update".equals(action)) {
			List<String> errorMsgs=new ArrayList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {	
				String bp_no=req.getParameter("bp_no");
				Integer b_times=new Integer(req.getParameter("b_times"));

					Bid_commodityService bid_commoditySvc = new Bid_commodityService();
					Bid_commodityVO bid_commodityVO = bid_commoditySvc.updatetime(b_times,bp_no);
					req.setAttribute("bid_commodityVO", bid_commodityVO);
				//將會員及代幣紀錄設入session準備轉交
				 // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/EA102G5/bid_front_end/backBid.jsp"; // 修改成功後,轉交listOneEmp.jsp
				res.sendRedirect(url);
			}catch(Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				String url = "/EA102G5/bid_front_end/backBid.jsp"; // 修改成功後,轉交listOneEmp.jsp
				res.sendRedirect(url);
			}
		}

		if ("update".equals(action)) { // 來自update.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String bp_no = new String(req.getParameter("bp_no").trim());
				String b_name = req.getParameter("b_name").trim();
				String enameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,20}$";
				if (b_name == null || b_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} 

				Integer bs_price = null;
				try {
					bs_price = new Integer(req.getParameter("bs_price"));
				} catch (NumberFormatException e) {
					bs_price = 0;
					errorMsgs.add("薪水請填數字.");
				}
				String b_intro = req.getParameter("b_intro").trim();
				if (b_intro == null || b_intro.trim().length() == 0) {
					errorMsgs.add("商品介紹:請勿空白");
				}
				Integer bplus_price = null;
				try {
					bplus_price = new Integer(req.getParameter("bplus_price").trim());
				} catch (NumberFormatException e) {
					bplus_price = 0;
					errorMsgs.add("加價請填數字.");
				}
				String bc_no = req.getParameter("bc_no");
				if (bc_no == null || bc_no.trim().length() == 0) {
					errorMsgs.add("選擇類別編號");
				}

				java.sql.Timestamp b_startime = null;
				try {
					b_startime = java.sql.Timestamp.valueOf(req.getParameter("b_startime").trim());
				} catch (IllegalArgumentException e) {
					b_startime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入開始日期!");
				}
				java.sql.Timestamp b_endtime = null;
				try {
					b_endtime = java.sql.Timestamp.valueOf(req.getParameter("b_endtime").trim());
				} catch (IllegalArgumentException e) {
					b_endtime = new java.sql.Timestamp(System.currentTimeMillis());
					errorMsgs.add("請輸入結束日期!");
				}
				
				byte[] b_picture = null;
				
					Part part = req.getPart("myFile");
					InputStream in = part.getInputStream();			
					byte[] buf = new byte[in.available()];
					if(in.available()==0) {				
						b_picture=((Bid_commodityVO)session.getAttribute("bid_commodityVO")).getB_picture();
					}else {
					in.read(buf);
					b_picture = buf;
					in.close();
					}
				
						
				byte[] b_picture2 = null;
					
				Part part2 = req.getPart("myFile2");
				InputStream in2 = part2.getInputStream();			
				byte[] buf2 = new byte[in2.available()];
				if(in2.available()==0) {				
					b_picture2=((Bid_commodityVO)session.getAttribute("bid_commodityVO")).getB_picture2();
				}else {
				in2.read(buf2);
				b_picture2 = buf2;
				in2.close();
				}
			
				Bid_commodityVO bid_commodityVO = new Bid_commodityVO();
				
				bid_commodityVO.setBs_price(bs_price);
				bid_commodityVO.setB_intro(b_intro);
				bid_commodityVO.setBplus_price(bplus_price);
				bid_commodityVO.setB_startime(b_startime);
				bid_commodityVO.setB_endtime(b_endtime);
				bid_commodityVO.setBc_no(bc_no);
				bid_commodityVO.setB_name(b_name);	
				bid_commodityVO.setB_picture(b_picture);
				bid_commodityVO.setB_picture2(b_picture2);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("bid_commodityVO", bid_commodityVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/update.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				Bid_commodityService bid_commoditySvc = new Bid_commodityService();
				bid_commodityVO = bid_commoditySvc.updateBid(bs_price, b_intro, b_startime, b_endtime, bplus_price,
						bc_no, b_name, b_picture,b_picture2, bp_no);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("bid_commodityVO", bid_commodityVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/bid_front_end/backBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/update.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 ***************************************/
				String bp_no = req.getParameter("bp_no");

				/*************************** 2.開始刪除資料 ***************************************/
				Bid_commodityService bid_commoditySvc = new Bid_commodityService();
				bid_commoditySvc.deleteBid(bp_no);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/bid_front_end/backBid.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/backBid.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
