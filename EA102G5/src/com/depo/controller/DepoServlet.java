package com.depo.controller;

import java.io.IOException;
import java.util.*;

import com.Bid_commodity.model.Bid_commodityService;
import com.Bid_commodity.model.Bid_commodityVO;
import com.bp.model.*;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.bp.model.BpService;
import com.bp.model.BpVO;
import com.depo.model.DepoService;
import com.depo.model.DepoVO;

import com.mem.model.MemService;
import com.mem.model.MemVO;
import com.shop.MailService;
import com.shop_order.model.OrdService;
import com.shop_order.model.OrdVO;

@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 4 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
@WebServlet("/DepoServlet2")
public class DepoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doPost(req,res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			req.setCharacterEncoding("UTF-8");
			res.setHeader("Cache","no-store");
			res.setHeader("Pragma","no-cache");
			res.setDateHeader("Expires",0);
			
			String action=req.getParameter("action");
			String depoReg="^[1-9][0-9][0-9][0-9]{0,7}$";
			System.out.println("轉交成功");
			System.out.println(action);
			
			//會員儲值
			if("memDeposit".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					System.out.println("1");
					HttpSession session=req.getSession();
					MemVO memVO=(MemVO)session.getAttribute("memVO");
					//取得該會員編號
					String mem_no=memVO.getMem_no();
					System.out.println(mem_no);
					//取得點數交易類別
					String depo_trans_type="TYPE1";
					//取得儲值金額
					System.out.println("2");
					String  depositVal=req.getParameter("price");
					System.out.println(depositVal.trim().length()==0);
					if(!depositVal.trim().matches(depoReg)) {
						if(depositVal.substring(0,1).equals("0")) {
							errorMsgs.add("金額開頭不得為零");
						}
						errorMsgs.add("金額請填3~10位的數字! ");
					}
					
					//將儲值金額轉為Integer，並將其值存入交易金額欄位
					Integer depo_amount=Integer.parseInt(depositVal);
					System.out.println("++++++========");
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("3");
					DepoService depoSvc=new DepoService();
					//以會員編號查詢會員現有點數
					DepoVO depoVO=depoSvc.memNowDepo(mem_no);
					Integer nowDepo=null;
					if(depoVO!=null)
						nowDepo=depoVO.getDepo_point();
					else
						nowDepo=0;
					//將現有點數與交易金額相加
					Integer depo_point=nowDepo+depo_amount;
					//設定交易狀態為0=>非審核狀態
					String depo_tok_status="0";
					//將資料新增到資料庫
					depoVO=depoSvc.newTransAdd(mem_no, depo_amount, depo_point, depo_trans_type, depo_tok_status);
					System.out.println("4");
					//準備轉交
					session.setAttribute("depoVO", depoVO);
					res.sendRedirect(req.getContextPath()+"/Front-mem/account-all-depo.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("請確認輸入格式");
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
			
			//會員提領點數
			if("memWithdraw".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
					MemVO memVO=(MemVO)session.getAttribute("memVO");
					//取得該會員編號
					String mem_no=memVO.getMem_no();
					System.out.println("~~~"+mem_no+"~~~");
					//取得點數交易類別
					String depo_trans_type="TYPE2";
					//取得提領金額
					String  depositVal=req.getParameter("price");
					//將消費金額轉乘Integer，並將其值存入交易金額欄位
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					System.out.println("1");
					//以會員編號查詢會員現有點數
					DepoVO depoVO=depoSvc.memNowDepo(mem_no);
					if(depoVO==null) {
						depoVO=new DepoVO();
						depoVO.setDepo_point(0);
					}
					System.out.println("2");
					Integer nowDepo=depoVO.getDepo_point();
					Integer depo_point=nowDepo;
					//將現有點數減去交易金額
					if(nowDepo>=depo_amount) {
						depo_point=nowDepo-depo_amount;
					}else {
						errorMsgs.add("提領金額有誤!請重新確認");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						return;
					}
					
//					交易類別為TYPE4，則狀態為1(審核)。
					String depo_tok_status="1";
					
					//將資料新增到資料庫
					depoVO=depoSvc.newTransAdd(mem_no, depo_amount, depo_point, depo_trans_type, depo_tok_status);

					//將會員及代幣紀錄設入REQUEST準備轉交
					session.setAttribute("depoVO", depoVO);
					res.sendRedirect(req.getContextPath()+"/Front-mem/account-all-depo.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("請確認輸入格式");
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
			//員工審核申請
			if("empCheckWithdraw".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					String depo_no=req.getParameter("depo_no");
					DepoService depoSvc=new DepoService();
					depoSvc.upDateDepoTokStatus(depo_no);
					res.sendRedirect(req.getContextPath()+"/Back-mem/empSelectAllWithdraw.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("請確認輸入格式");
					RequestDispatcher failureView = req.getRequestDispatcher("/Back-mem/empSelectAllWithdraw.jsp");
					failureView.forward(req, res);
				}
			}
				
			
			//直購交易
			if("memTransaction".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
					
					//取得買方會員編號
					String buyMem_no=req.getParameter("buyMem_no");
					//取得賣方會員編號
					String sellMem_no=req.getParameter("sellMem_no");
					//取得消費金額
					String  depositVal=req.getParameter("price");
					
					//將消費金額轉乘Integer，並將其值存入交易金額欄位
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					//查詢買方會員現有點數
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					if(buyDepoVO==null) {
						buyDepoVO=new DepoVO();
						buyDepoVO.setDepo_point(0);
					}
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//判斷買方點數是否足夠，將現有點數減去交易金額
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("您的點數不足，請前往儲值");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/bp-front/select_page.jsp");
						failureView.forward(req, res);
						 return;
					}
					//查詢賣方會員現有點數
					DepoVO sellDepoVO=depoSvc.memNowDepo(sellMem_no);
					if(sellDepoVO==null) {
						sellDepoVO=new DepoVO();
						sellDepoVO.setDepo_point(0);
					}
					Integer sellNowDepo=sellDepoVO.getDepo_point();
					//將現有點數加上交易金額
					sellNowDepo+=depo_amount;
					
					
					//更改交換訂單的訂單狀況
					String bp_no = req.getParameter("bp_no");
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					depoSvc.newTransAdd(sellMem_no, depo_amount, sellNowDepo, "TYPE3", "0");
					BpVO  bpVO = new BpVO(); 
					BpService bpSvc = new BpService();
					bpVO = bpSvc.update_status("已付款",bp_no);
					BpService bpSvc2 = new BpService();
					bpVO = bpSvc2.update_buymem(buyMem_no, bp_no);
					
					System.out.println(bpVO);
					
					session.removeAttribute("bpVO");
					//將會員及代幣紀錄設入session準備轉交
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/bp-front/mybp.jsp");
				}catch(Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/bp-front/select_page.jsp");
					failureView.forward(req, res);
				}
			}
	
	
			if("bidMemTrans".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
					String bp_no=req.getParameter("bp_no");
					//取得買方會員編號
					System.out.println(bp_no);
					String buyMem_no=req.getParameter("buyMem_no");
					//取得賣方會員編號
					System.err.println(buyMem_no);
					String sellMem_no=req.getParameter("sellMem_no");
					//取得消費金額
					System.out.println(sellMem_no);
					String  depositVal=req.getParameter("price");
					//將消費金額轉乘Integer，並將其值存入交易金額欄位
					System.out.println(depositVal);
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					//查詢買方會員現有點數
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//判斷買方點數是否足夠，將現有點數減去交易金額
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("您的點數不足，請前往儲值");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						 return;
					}
					//查詢賣方會員現有點數
					DepoVO sellDepoVO=depoSvc.memNowDepo(sellMem_no);
					Integer sellNowDepo=sellDepoVO.getDepo_point();
					//將現有點數加上交易金額
					sellNowDepo+=depo_amount;
					
					//將資料新增到資料庫
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					depoSvc.newTransAdd(sellMem_no, depo_amount, sellNowDepo, "TYPE3", "0");
					
					Bid_commodityService bid_commoditySvc = new Bid_commodityService();
					Bid_commodityVO bid_commodityVO = bid_commoditySvc.updatetime(03,bp_no);
					
					//將會員及代幣紀錄設入session準備轉交
					req.setAttribute("bid_recordVO", bid_commodityVO);
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/bid_front_end/backBid.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
			//商城交易
			if("shopMemTrans".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
			
					//取得買方會員編號
					String buyMem_no=req.getParameter("buyMem_no");
					//取得消費金額
					String  price=req.getParameter("price");
					//取得訂單編號，修改訂單狀態
					String ord_no=req.getParameter("ord_no");
					//將消費金額轉乘Integer，並將其值存入交易金額欄位
					Double depositVal = Double.parseDouble(price);
					int depo_amount= depositVal.intValue();
					DepoService depoSvc=new DepoService();
					//查詢買方會員現有點數
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					if(buyDepoVO==null) {
						buyDepoVO =new DepoVO();
						buyDepoVO.setDepo_point(0);
					}
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//判斷買方點數是否足夠，將現有點數減去交易金額
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("您的點數不足，請前往儲值");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						 return;
					}
					
					//將資料新增到資料庫
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					//修改訂單狀態為已付款
					OrdService ordSvc = new OrdService();
					String ord_status = "已付款";
					ordSvc.updateStatus(ord_no, ord_status);
					//如果訂單狀態為“已付款”，寄出訂單成立email
					if(ord_status.equals("已付款")) {
						String to = "denny0329denny0329@gmail.com";
						String subject = "ToyAllHot通知：你的訂單成立囉";
						
						OrdVO ordVO = new OrdService().getOneOrd(ord_no);

						String messageText = "Hi " + ordVO.getMemNo()+",\n"
									+"訂單編號："+ord_no+"\n"
									+"訂單總金額：NT$ "+ordVO.getOrdPrice()+"元\n\n"
									+"收件人\n"
									+"姓名："+ordVO.getOrdName()+"\n"
									+"電話："+ordVO.getOrdPhone()+"\n"
									+"收件地址："+ordVO.getOrdCode()+" "+ordVO.getOrdCity()
									+" "+ordVO.getOrdSection()+" "+ordVO.getOrdAddress()+"\n\n"
									+"商品寄出會再另行通知，\n"
									+"ToyAllHot 感謝您的購買～";
						
						MailService MailSvc = new MailService();
						MailSvc.sendMail(to, subject, messageText);
					}
					
					//將會員及代幣紀錄設入session準備轉交
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/shop_product/shopFinish.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
	}

}
