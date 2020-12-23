package com.shop_product.controller;

import java.io.*;
import java.util.*;

import javax.servlet.*;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;
import com.shop_product.model.*;

@MultipartConfig
public class ProdServlet extends HttpServlet {

	public void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		
//		System.out.println(action);
		
		if ("getOne_For_Display".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String str = req.getParameter("prod_no");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入商品編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				String prod_no = null;
				try {
					prod_no = new String(str);
				} catch (Exception e) {
					errorMsgs.add("商品編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************2.開始查詢資料*****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_no);
				if (prodVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/shop.jsp");
					failureView.forward(req, res);
					return;//程式中斷
				}
				
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // 資料庫取出的prodVO物件,存入req
				String url = "/shop_product/shopProd.jsp";
				//用來判斷是前台還是後台的請求
				String back_end = req.getParameter("back_end");		
				if("back_end".equals(back_end)) {
					url = "/shop_product/listProdDetail.jsp";
				}
				
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/shop.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("getOne_For_Update".equals(action)) { // 來自listAllProd.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				/***************************1.接收請求參數****************************************/
				String prod_no = new String(req.getParameter("prod_no"));
				
				/***************************2.開始查詢資料****************************************/
				ProdService prodSvc = new ProdService();
				ProdVO prodVO = prodSvc.getOneProd(prod_no);
								
				/***************************3.查詢完成,準備轉交(Send the Success view)************/
				req.setAttribute("prodVO", prodVO);         // 資料庫取出的prodVO物件,存入req
				String url = "/shop_product/updateProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 updateProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("update".equals(action)) { // 來自updateProd.jsp的請求
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
		
			try {
				/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
				String prod_no = req.getParameter("prod_no").trim();
				
				String prod_name = req.getParameter("prod_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if(!prod_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				Double prod_price = null;
				try {
					prod_price = new Double(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0.0;
					errorMsgs.add("價格請填數字");
				}
				
				String prod_brand = req.getParameter("prod_brand").trim();
				if (prod_brand == null || prod_brand.trim().length() == 0) {
					errorMsgs.add("品牌請勿空白");
				}	

				String prod_intro = req.getParameter("prod_intro").trim();
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("介紹請勿空白");
				}	

				String category_no = req.getParameter("category_no").trim();
				if (category_no == null || category_no.trim().length() == 0) {
					errorMsgs.add("商種類請勿空白");
				}	

				String prod_status = req.getParameter("prod_status").trim();
				if (prod_status == null || prod_status.trim().length() == 0) {
					errorMsgs.add("狀態請勿空白");
				}
				
				byte[] prod_photo = null;
				Part part = req.getPart("prod_photo");
				InputStream in = part.getInputStream();
				if(in.available()!=0) {
					prod_photo = getPictureByteArray(part);
				}else {
					prod_photo = new ProdService().getOneProd(prod_no).getProdPhoto();
				}

				
				ProdVO prodVO = new ProdVO();
				prodVO.setProdNo(prod_no);
				prodVO.setProdName(prod_name);
				prodVO.setProdPrice(prod_price);
				prodVO.setProdBrand(prod_brand);
				prodVO.setProdIntro(prod_intro);
				prodVO.setCategoryNo(category_no);
				prodVO.setProdStatus(prod_status);
				prodVO.setProdPhoto(prod_photo);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/updateProd.jsp");
					failureView.forward(req, res);
					return; //程式中斷
				}
				
				/***************************2.開始修改資料*****************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.updateProd(prod_no, prod_name, prod_price, prod_brand,
						prod_intro, category_no, prod_status, prod_photo);
				
				/***************************3.修改完成,準備轉交(Send the Success view)*************/
				req.setAttribute("prodVO", prodVO); // 資料庫update成功後,正確的的prodVO物件,存入req
				String url = "/shop_product/listProdDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneProd.jsp
				successView.forward(req, res);

				/***************************其他可能的錯誤處理*************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/updateProd.jsp");
				failureView.forward(req, res);
			}
		}

        if ("insert".equals(action)) { // 來自addProd.jsp的請求  
			
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
				String prod_name = req.getParameter("prod_name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (prod_name == null || prod_name.trim().length() == 0) {
					errorMsgs.add("商品名稱: 請勿空白");
				} else if(!prod_name.trim().matches(nameReg)) { //以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("商品名稱: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
	            }
				
				Double prod_price = null;
				try {
					prod_price = new Double(req.getParameter("prod_price").trim());
				} catch (NumberFormatException e) {
					prod_price = 0.0;
					errorMsgs.add("價格請填數字");
				}
				
				String prod_brand = req.getParameter("prod_brand").trim();
				if (prod_brand == null || prod_brand.trim().length() == 0) {
					errorMsgs.add("品牌請勿空白");
				}
				
				String prod_intro = req.getParameter("prod_intro").trim();
				if (prod_intro == null || prod_intro.trim().length() == 0) {
					errorMsgs.add("介紹請勿空白");
				}
				
				String category_no = req.getParameter("category_no").trim();
				if (category_no == null || category_no.trim().length() == 0) {
					errorMsgs.add("商品種類請勿空白");
				}
				
				String prod_status = req.getParameter("prod_status").trim();
				if (prod_status == null || prod_status.trim().length() == 0) {
					errorMsgs.add("商品狀態請勿空白");
				}
				
				Part part = req.getPart("prod_photo");
				byte[] prod_photo = getPictureByteArray(part);
				

				ProdVO prodVO = new ProdVO();
				prodVO.setProdName(prod_name);
				prodVO.setProdPrice(prod_price);
				prodVO.setProdBrand(prod_brand);
				prodVO.setProdIntro(prod_intro);
				prodVO.setCategoryNo(category_no);
				prodVO.setProdStatus(prod_status);
				prodVO.setProdPhoto(prod_photo);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("prodVO", prodVO); // 含有輸入格式錯誤的prodVO物件,也存入req
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/addProd.jsp");
					failureView.forward(req, res);
					return;
				}
				
				/***************************2.開始新增資料***************************************/
				ProdService prodSvc = new ProdService();
				prodVO = prodSvc.addProd(prod_name, prod_price, prod_brand, prod_intro,
											category_no, prod_status, prod_photo);
				
				/***************************3.新增完成,準備轉交(Send the Success view)***********/
				String url = "/shop_product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
				successView.forward(req, res);				
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/addProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		if ("delete".equals(action)) { // 來自listAllProd.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				String prod_no = new String(req.getParameter("prod_no"));
//				System.out.println(prod_no);
				/***************************2.開始刪除資料***************************************/
				ProdService prodSvc = new ProdService();
				prodSvc.deleteProd(prod_no);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/shop_product/listAllProd.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/shop_product/listAllProd.jsp");
				failureView.forward(req, res);
			}
		}
		
		 
		 
		 if ("updateStatus".equals(action)) { // 來自updateProd.jsp的請求
				
				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
			
				try {
					/***************************1.接收請求參數 - 輸入格式的錯誤處理**********************/
					String prod_no = req.getParameter("prod_no").trim();
					
					String prod_status = req.getParameter("prod_status").trim();

					
					/***************************2.開始修改資料*****************************************/
					ProdService prodSvc = new ProdService();
					prodSvc.updateStatus(prod_no, prod_status);
					
					/***************************3.修改完成,準備轉交(Send the Success view)*************/
					String url = "/shop_product/listAllProd.jsp";
					RequestDispatcher failureView = req.getRequestDispatcher(url);
					failureView.forward(req, res);
					/***************************其他可能的錯誤處理*************************************/
				} catch (Exception e) {
					errorMsgs.add("修改資料失敗:"+e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/listAllProd.jsp");
					failureView.forward(req, res);
				}
			}
		 
		 if ("insert_pchome".equals(action)) { // 來自addProd.jsp的請求  

				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String prod_name = req.getParameter("prod_name");
					
					Double prod_price = new Double(req.getParameter("prod_price").trim());
				
					
					String prod_brand = req.getParameter("prod_brand").trim();
					
					
					String prod_intro = req.getParameter("prod_intro").trim();
					
					
					String category_no = req.getParameter("category_no").trim();

					String prod_status = req.getParameter("prod_status").trim();
			
					ProdVO prodVO = new ProdVO();
					prodVO.setProdName(prod_name);
					prodVO.setProdPrice(prod_price);
					prodVO.setProdBrand(prod_brand);
					prodVO.setProdIntro(prod_intro);
					prodVO.setCategoryNo(category_no);
					prodVO.setProdStatus(prod_status);
					
					/***************************2.開始新增資料***************************************/
					ProdService prodSvc = new ProdService();
					prodVO = prodSvc.addProdPchome(prod_name, prod_price, prod_brand, 
												   prod_intro,category_no, prod_status);
					
					/***************************3.新增完成,準備轉交(Send the Success view)***********/
					String url = "/shop_product/pchomeProd.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllProd.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					RequestDispatcher failureView = req
							.getRequestDispatcher("/shop_product/pchomeProd.jsp");
					failureView.forward(req, res);
				}
			}

	}
	
	//使用byte[]方式
	 public static byte[] getPictureByteArray(Part part) throws IOException{
			InputStream in = part.getInputStream();
			ByteArrayOutputStream out = new ByteArrayOutputStream();
			byte[] buffer = new byte[1024];
			int i = -1;
			while((i = in.read(buffer)) != -1) {
				out.write(buffer, 0, i);
			}
			out.close();
			in.close();
			
			return out.toByteArray();
	}
}
