package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.domain.Order;
import com.brsc.ecommerceSys.helper.OrderHelper;
import com.brsc.ecommerceSys.utils.Page;

public interface OrderService {
	
	/** 添加一笔订单 */
	void addOrder(Order order);
	/** 根据订单编号加载某笔订单 */
	Order loadOrderById(Integer orderNo);
	/** 一次加载所有订单 */
	List<Order> loadOrders();
	/** 按条件分页加载订单 */
	Page loadOrderPage(OrderHelper helper,Page page);
	/** 修改 */
	void updateOrder(Order order);
	/** 审核订单 */
	void auditOrder(Order order);
}
