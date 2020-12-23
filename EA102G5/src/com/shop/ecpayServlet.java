package com.shop;


import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop_item.model.*;
import com.shop_order.model.*;
import com.shop_product.model.*;

import ecpay.payment.integration.*;
import ecpay.payment.integration.domain.*;


@WebServlet("/ecpayServlet")
public class ecpayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//�o�̱H�H�H�Χ��ܭq�檬�A �H�U
		String ord_no = request.getParameter("ord_no");
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
		
		
		
		
		//�o�̱H�H�H�Χ��ܭq�檬�A �H�W
		
		
		//�U���O�n�Ǩ��ɪ����
		
		//�M�L�q��s�����oordVO
//		String ord_no = request.getParameter("ord_no"); //�W���w�g���L�q��s��
		ordSvc = new OrdService();
		OrdVO ordVO = ordSvc.getOneOrd(ord_no);
		//�NString�z�L�૬�A�h�����᭱���p���I
		String priceString = ordVO.getOrdPrice();
		Double priceDouble = Double.parseDouble(priceString);
		int priceInt = priceDouble.intValue();
		String price = Integer.toString(priceInt);
		//�M�L�q��s�����oitemVO
		ItemService itemSvc = new ItemService();
		List<ItemVO> itemList = itemSvc.getItem(ord_no);
		//�s�@setItemName
		String itemName = "";
		for(int i = 0; i < itemList.size(); i++) {
			ItemVO itemVO = itemList.get(i);
			ProdService prodSvc = new ProdService();
			ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo());
			itemName += "#" + prodVO.getProdName() + "x" + itemVO.getItemQuantity();
		}
		//�s�@setTradeDesc
		String tradeDesc = "�w����{Toy All Hot!! �P�±z���ʶR���";
		//�����D�b���|��ܳo��
		
		
		
		
		
		AllInOne allInOne = new AllInOne("");
		AioCheckOutALL checkoutVO = new AioCheckOutALL();
		
		String merchantTradeNo = UUID.randomUUID().toString().substring(0,5);
		
		checkoutVO.setMerchantTradeNo(merchantTradeNo);
		checkoutVO.setMerchantTradeDate("2020/02/02 02:20:20");
		checkoutVO.setTotalAmount(price);
		checkoutVO.setTradeDesc(tradeDesc);
		checkoutVO.setItemName(itemName);
//		checkoutVO.setReturnURL("http://localhost:8081/EA102G5/shop_product/shopFinish.jsp");
		checkoutVO.setReturnURL("http://toyallhot.tk/EA102G5/shop_product/shopFinish.jsp");
		checkoutVO.setNeedExtraPaidInfo("N");
		checkoutVO.setClientBackURL("http://toyallhot.tk/EA102G5/shop_product/shopFinish.jsp");
//		checkoutVO.setClientBackURL("http://localhost:8081/EA102G5/shop_product/shopFinish.jsp");
		
		String form = allInOne.aioCheckOut(checkoutVO, null);
		System.out.println(form);
		
		request.setAttribute("form",form);
		String url = "/shop_product/ecpay.jsp";
		RequestDispatcher successView = request.getRequestDispatcher(url);
		successView.forward(request, response);
		
	}

}
