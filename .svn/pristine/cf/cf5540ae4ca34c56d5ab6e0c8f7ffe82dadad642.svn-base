package com.brsc.ecommerceSys.action;

import java.util.List;

import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.domain.Order;
import com.brsc.ecommerceSys.domain.User;
import com.brsc.ecommerceSys.helper.OrderHelper;
import com.brsc.ecommerceSys.service.GoodsService;
import com.brsc.ecommerceSys.service.OrderService;
import com.brsc.ecommerceSys.service.UserService;
import com.brsc.ecommerceSys.utils.Page;

public class OrderAction extends BaseOfAction {
	
	private Order order = null;
	private List<User> userList = null;
	private List<Goods> goodsList = null;
	private List<Order> orderList = null;
	private OrderHelper helper = null;
	
	private Page page = new Page();
	
	private OrderService orderService = null;
	private UserService userService = null;
	private GoodsService goodsService = null;
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public List<User> getUserList() {
		return userList;
	}
	public void setUserList(List<User> userList) {
		this.userList = userList;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public OrderHelper getHelper() {
		return helper;
	}
	public void setHelper(OrderHelper helper) {
		this.helper = helper;
	}
	
	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	
	
	/** 去模拟添加订单界面 */
	public String toReg() throws Exception{
		userList = userService.loadUsers();
		goodsList = goodsService.loadAll();
		return "to_reg_order";
	}
	
	/** 模拟添加一笔订单 */
	public String createOrder() throws Exception{
		orderService.addOrder(order);
		return "load_order_action";
	}
	
	/** 去订单信息列表页面 */
	public String loadOrders() throws Exception{
		userList = userService.loadUsers();
		goodsList = goodsService.loadAll();
		page = orderService.loadOrderPage(helper, page);
		return "list_order_page";
	}
	
	/** 去查看某订单详细页面 */
	public String showOrderInfo() throws Exception{
		order = orderService.loadOrderById(order.getOrderNo());
		return "show_orderInfo_page";
	}
	
	/** 去修改某订单页面 */
	public String preUpdateOrder() throws Exception{
		order = orderService.loadOrderById(order.getOrderNo());
		return "update_order_page";
	}
	
	/** 修改订单 */
	public String updateOrder() throws Exception{
		orderService.updateOrder(order);
		order = orderService.loadOrderById(order.getOrderNo());//修改后展示该笔订单详细
		return "show_orderInfo_page";
	}
	
	/** 去审核某笔订单页面 */
	public String preAuditOrder() throws Exception{
		order = orderService.loadOrderById(order.getOrderNo());
		return "audit_order_page";
	}
	
	/** 审核某笔订单 */
	public String auditOrder() throws Exception{
		orderService.auditOrder(order);
		order = orderService.loadOrderById(order.getOrderNo());//审核后展示该笔订单详细
		return "show_orderInfo_page";
	}
	
}





















