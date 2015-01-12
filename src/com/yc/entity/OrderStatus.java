package com.yc.entity;

public enum OrderStatus {
	//拒绝接受货物, 缺乏,       在仓库,         下拍,   取消,     交付，           婚姻,    支持,    派送,   买方没有支付, 在格子, 丢失,         手工加工,        在转发,       送货到仓库，        打包， 已付,     API处理,     删除,          等待的追踪,   没有变化
	refuse  ,   lack,inWarehouse,inAuctionlose,cancel,delivery,marriage,support,sendOut,buyerNotPay,inCell,lose,manualProcessing,inForwarding,senToWarehouse,packing,paid,apiProcessing,delete,waitingForTracking,unchanged
}
