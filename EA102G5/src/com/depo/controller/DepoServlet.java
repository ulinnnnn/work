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
			System.out.println("��榨�\");
			System.out.println(action);
			
			//�|���x��
			if("memDeposit".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					System.out.println("1");
					HttpSession session=req.getSession();
					MemVO memVO=(MemVO)session.getAttribute("memVO");
					//���o�ӷ|���s��
					String mem_no=memVO.getMem_no();
					System.out.println(mem_no);
					//���o�I�ƥ�����O
					String depo_trans_type="TYPE1";
					//���o�x�Ȫ��B
					System.out.println("2");
					String  depositVal=req.getParameter("price");
					System.out.println(depositVal.trim().length()==0);
					if(!depositVal.trim().matches(depoReg)) {
						if(depositVal.substring(0,1).equals("0")) {
							errorMsgs.add("���B�}�Y���o���s");
						}
						errorMsgs.add("���B�ж�3~10�쪺�Ʀr! ");
					}
					
					//�N�x�Ȫ��B�ରInteger�A�ñN��Ȧs�J������B���
					Integer depo_amount=Integer.parseInt(depositVal);
					System.out.println("++++++========");
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						return;
					}
					System.out.println("3");
					DepoService depoSvc=new DepoService();
					//�H�|���s���d�߷|���{���I��
					DepoVO depoVO=depoSvc.memNowDepo(mem_no);
					Integer nowDepo=null;
					if(depoVO!=null)
						nowDepo=depoVO.getDepo_point();
					else
						nowDepo=0;
					//�N�{���I�ƻP������B�ۥ[
					Integer depo_point=nowDepo+depo_amount;
					//�]�w������A��0=>�D�f�֪��A
					String depo_tok_status="0";
					//�N��Ʒs�W���Ʈw
					depoVO=depoSvc.newTransAdd(mem_no, depo_amount, depo_point, depo_trans_type, depo_tok_status);
					System.out.println("4");
					//�ǳ����
					session.setAttribute("depoVO", depoVO);
					res.sendRedirect(req.getContextPath()+"/Front-mem/account-all-depo.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("�нT�{��J�榡");
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
			
			//�|�������I��
			if("memWithdraw".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
					MemVO memVO=(MemVO)session.getAttribute("memVO");
					//���o�ӷ|���s��
					String mem_no=memVO.getMem_no();
					System.out.println("~~~"+mem_no+"~~~");
					//���o�I�ƥ�����O
					String depo_trans_type="TYPE2";
					//���o������B
					String  depositVal=req.getParameter("price");
					//�N���O���B�୼Integer�A�ñN��Ȧs�J������B���
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					System.out.println("1");
					//�H�|���s���d�߷|���{���I��
					DepoVO depoVO=depoSvc.memNowDepo(mem_no);
					if(depoVO==null) {
						depoVO=new DepoVO();
						depoVO.setDepo_point(0);
					}
					System.out.println("2");
					Integer nowDepo=depoVO.getDepo_point();
					Integer depo_point=nowDepo;
					//�N�{���I�ƴ�h������B
					if(nowDepo>=depo_amount) {
						depo_point=nowDepo-depo_amount;
					}else {
						errorMsgs.add("������B���~!�Э��s�T�{");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						return;
					}
					
//					������O��TYPE4�A�h���A��1(�f��)�C
					String depo_tok_status="1";
					
					//�N��Ʒs�W���Ʈw
					depoVO=depoSvc.newTransAdd(mem_no, depo_amount, depo_point, depo_trans_type, depo_tok_status);

					//�N�|���ΥN�������]�JREQUEST�ǳ����
					session.setAttribute("depoVO", depoVO);
					res.sendRedirect(req.getContextPath()+"/Front-mem/account-all-depo.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("�нT�{��J�榡");
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
			//���u�f�֥ӽ�
			if("empCheckWithdraw".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					String depo_no=req.getParameter("depo_no");
					DepoService depoSvc=new DepoService();
					depoSvc.upDateDepoTokStatus(depo_no);
					res.sendRedirect(req.getContextPath()+"/Back-mem/empSelectAllWithdraw.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("�нT�{��J�榡");
					RequestDispatcher failureView = req.getRequestDispatcher("/Back-mem/empSelectAllWithdraw.jsp");
					failureView.forward(req, res);
				}
			}
				
			
			//���ʥ��
			if("memTransaction".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
					
					//���o�R��|���s��
					String buyMem_no=req.getParameter("buyMem_no");
					//���o���|���s��
					String sellMem_no=req.getParameter("sellMem_no");
					//���o���O���B
					String  depositVal=req.getParameter("price");
					
					//�N���O���B�୼Integer�A�ñN��Ȧs�J������B���
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					//�d�߶R��|���{���I��
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					if(buyDepoVO==null) {
						buyDepoVO=new DepoVO();
						buyDepoVO.setDepo_point(0);
					}
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//�P�_�R���I�ƬO�_�����A�N�{���I�ƴ�h������B
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("�z���I�Ƥ����A�Ыe���x��");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/bp-front/select_page.jsp");
						failureView.forward(req, res);
						 return;
					}
					//�d�߽��|���{���I��
					DepoVO sellDepoVO=depoSvc.memNowDepo(sellMem_no);
					if(sellDepoVO==null) {
						sellDepoVO=new DepoVO();
						sellDepoVO.setDepo_point(0);
					}
					Integer sellNowDepo=sellDepoVO.getDepo_point();
					//�N�{���I�ƥ[�W������B
					sellNowDepo+=depo_amount;
					
					
					//���洫�q�檺�q�檬�p
					String bp_no = req.getParameter("bp_no");
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					depoSvc.newTransAdd(sellMem_no, depo_amount, sellNowDepo, "TYPE3", "0");
					BpVO  bpVO = new BpVO(); 
					BpService bpSvc = new BpService();
					bpVO = bpSvc.update_status("�w�I��",bp_no);
					BpService bpSvc2 = new BpService();
					bpVO = bpSvc2.update_buymem(buyMem_no, bp_no);
					
					System.out.println(bpVO);
					
					session.removeAttribute("bpVO");
					//�N�|���ΥN�������]�Jsession�ǳ����
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/bp-front/mybp.jsp");
				}catch(Exception e) {
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
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
					//���o�R��|���s��
					System.out.println(bp_no);
					String buyMem_no=req.getParameter("buyMem_no");
					//���o���|���s��
					System.err.println(buyMem_no);
					String sellMem_no=req.getParameter("sellMem_no");
					//���o���O���B
					System.out.println(sellMem_no);
					String  depositVal=req.getParameter("price");
					//�N���O���B�୼Integer�A�ñN��Ȧs�J������B���
					System.out.println(depositVal);
					Integer depo_amount=Integer.parseInt(depositVal);
					DepoService depoSvc=new DepoService();
					//�d�߶R��|���{���I��
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//�P�_�R���I�ƬO�_�����A�N�{���I�ƴ�h������B
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("�z���I�Ƥ����A�Ыe���x��");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						 return;
					}
					//�d�߽��|���{���I��
					DepoVO sellDepoVO=depoSvc.memNowDepo(sellMem_no);
					Integer sellNowDepo=sellDepoVO.getDepo_point();
					//�N�{���I�ƥ[�W������B
					sellNowDepo+=depo_amount;
					
					//�N��Ʒs�W���Ʈw
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					depoSvc.newTransAdd(sellMem_no, depo_amount, sellNowDepo, "TYPE3", "0");
					
					Bid_commodityService bid_commoditySvc = new Bid_commodityService();
					Bid_commodityVO bid_commodityVO = bid_commoditySvc.updatetime(03,bp_no);
					
					//�N�|���ΥN�������]�Jsession�ǳ����
					req.setAttribute("bid_recordVO", bid_commodityVO);
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/bid_front_end/backBid.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/bid_front_end/Bid.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
			//�ӫ����
			if("shopMemTrans".equals(action)) {
				List<String> errorMsgs=new ArrayList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					HttpSession session=req.getSession();
			
					//���o�R��|���s��
					String buyMem_no=req.getParameter("buyMem_no");
					//���o���O���B
					String  price=req.getParameter("price");
					//���o�q��s���A�ק�q�檬�A
					String ord_no=req.getParameter("ord_no");
					//�N���O���B�୼Integer�A�ñN��Ȧs�J������B���
					Double depositVal = Double.parseDouble(price);
					int depo_amount= depositVal.intValue();
					DepoService depoSvc=new DepoService();
					//�d�߶R��|���{���I��
					DepoVO buyDepoVO=depoSvc.memNowDepo(buyMem_no);
					if(buyDepoVO==null) {
						buyDepoVO =new DepoVO();
						buyDepoVO.setDepo_point(0);
					}
					Integer buyNowDepo=buyDepoVO.getDepo_point();
					//�P�_�R���I�ƬO�_�����A�N�{���I�ƴ�h������B
					if(buyNowDepo>=depo_amount) {
						buyNowDepo-=depo_amount;
					}else {
							errorMsgs.add("�z���I�Ƥ����A�Ыe���x��");
					}
					if(!errorMsgs.isEmpty()) {
						RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
						failureView.forward(req, res);
						 return;
					}
					
					//�N��Ʒs�W���Ʈw
					buyDepoVO=depoSvc.newTransAdd(buyMem_no, depo_amount, buyNowDepo, "TYPE4", "0");
					//�ק�q�檬�A���w�I��
					OrdService ordSvc = new OrdService();
					String ord_status = "�w�I��";
					ordSvc.updateStatus(ord_no, ord_status);
					//�p�G�q�檬�A�����w�I�ڡ��A�H�X�q�榨��email
					if(ord_status.equals("�w�I��")) {
						String to = "denny0329denny0329@gmail.com";
						String subject = "ToyAllHot�q���G�A���q�榨���o";
						
						OrdVO ordVO = new OrdService().getOneOrd(ord_no);

						String messageText = "Hi " + ordVO.getMemNo()+",\n"
									+"�q��s���G"+ord_no+"\n"
									+"�q���`���B�GNT$ "+ordVO.getOrdPrice()+"��\n\n"
									+"����H\n"
									+"�m�W�G"+ordVO.getOrdName()+"\n"
									+"�q�ܡG"+ordVO.getOrdPhone()+"\n"
									+"����a�}�G"+ordVO.getOrdCode()+" "+ordVO.getOrdCity()
									+" "+ordVO.getOrdSection()+" "+ordVO.getOrdAddress()+"\n\n"
									+"�ӫ~�H�X�|�A�t��q���A\n"
									+"ToyAllHot �P�±z���ʶR��";
						
						MailService MailSvc = new MailService();
						MailSvc.sendMail(to, subject, messageText);
					}
					
					//�N�|���ΥN�������]�Jsession�ǳ����
					session.setAttribute("depoVO", buyDepoVO);
					res.sendRedirect(req.getContextPath()+"/shop_product/shopFinish.jsp");
					
				}catch(Exception e) {
					errorMsgs.add("�L�k���o�n�ק諸���:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/Front-mem/account-all-depo.jsp");
					failureView.forward(req, res);
				}
			}
	}

}
