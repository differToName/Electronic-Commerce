package com.brsc.ecommerceSys.domain;

import java.util.Date;

/**
 * 订单类
 * @author wls
 *
 */
public class Order extends BaseOfValue {
	
	private Integer orderNo;  //订单编号
	private User user;  //用户
	private Date orderDate;  //下单时间
//	private Integer goodsNo;  //商品编号
	private Goods goods;  //商品
	private String auditStatu; //订单审核状态(N-未审核 P-审核已通过  X-审核未通过)
	private Date auditDate;  //审核日期
	private String payMethod;   //付款方式
	private String deliveryAddress;  //收货地址
	private String goodsConsignee;  //收货人姓名
	private String consigneePhone;  //收货人电话
	private Integer buyNumbers;  //购买数量
	private Double buyCounts;  //订单金额
	private String orderStatus;  //订单状态(G-收货 N-未收货 R-退货)
	
	public Integer getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(Integer orderNo) {
		this.orderNo = orderNo;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Date getOrderDate() {
        return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public String getAuditStatu() {
		return auditStatu;
	}
	public void setAuditStatu(String auditStatu) {
		this.auditStatu = auditStatu;
	}
	public Date getAuditDate() {
		return auditDate;
	}
	public void setAuditDate(Date auditDate) {
		this.auditDate = auditDate;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	public String getGoodsConsignee() {
		return goodsConsignee;
	}
	public void setGoodsConsignee(String goodsConsignee) {
		this.goodsConsignee = goodsConsignee;
	}
	public String getConsigneePhone() {
		return consigneePhone;
	}
	public void setConsigneePhone(String consigneePhone) {
		this.consigneePhone = consigneePhone;
	}
	public Integer getBuyNumbers() {
		return buyNumbers;
	}
	public void setBuyNumbers(Integer buyNumbers) {
		this.buyNumbers = buyNumbers;
	}
	public Double getBuyCounts() {
		return buyCounts;
	}
	public void setBuyCounts(Double buyCounts) {
		this.buyCounts = buyCounts;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	@Override
	public String toString() {
		return "Order [orderNo=" + orderNo + ", user=" + user + ", orderDate="
				+ orderDate + ", goods=" + goods + ", auditStatu=" + auditStatu
				+ ", auditDate=" + auditDate + ", payMethod=" + payMethod
				+ ", deliveryAddress=" + deliveryAddress + ", goodsConsignee="
				+ goodsConsignee + ", consigneePhone=" + consigneePhone
				+ ", buyNumbers=" + buyNumbers + ", buyCounts=" + buyCounts
				+ ", orderStatus=" + orderStatus + "]";
	}
	
}
