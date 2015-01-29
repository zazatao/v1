package com.yc.entity;

public enum OrderStatus {
	//初始化，  	等待验收，		            等待支付，                     在转发,      等待发货，		在途货物，	                      收货人签单，		            完成交易，				关闭交易，			自动关闭交易
	initializa, waitAcceptance, waitPayment,inForwarding, waitDelivery, transitGoods, consigneeSigning, completionTransaction, closeTransaction, autoCloseTransaction
}
