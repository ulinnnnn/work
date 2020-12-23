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
		//這裡寄信以及改變訂單狀態 以下
		String ord_no = request.getParameter("ord_no");
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
		
		
		
		
		//這裡寄信以及改變訂單狀態 以上
		
		
		//下面是要傳到綠界的資料
		
		//套過訂單編號取得ordVO
//		String ord_no = request.getParameter("ord_no"); //上面已經取過訂單編號
		ordSvc = new OrdService();
		OrdVO ordVO = ordSvc.getOneOrd(ord_no);
		//將String透過轉型，去除掉後面的小數點
		String priceString = ordVO.getOrdPrice();
		Double priceDouble = Double.parseDouble(priceString);
		int priceInt = priceDouble.intValue();
		String price = Integer.toString(priceInt);
		//套過訂單編號取得itemVO
		ItemService itemSvc = new ItemService();
		List<ItemVO> itemList = itemSvc.getItem(ord_no);
		//製作setItemName
		String itemName = "";
		for(int i = 0; i < itemList.size(); i++) {
			ItemVO itemVO = itemList.get(i);
			ProdService prodSvc = new ProdService();
			ProdVO prodVO = prodSvc.getOneProd(itemVO.getProdNo());
			itemName += "#" + prodVO.getProdName() + "x" + itemVO.getItemQuantity();
		}
		//製作setTradeDesc
		String tradeDesc = "歡迎光臨Toy All Hot!! 感謝您的購買～～";
		//不知道在哪會顯示這個
		
		
		
		
		
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
