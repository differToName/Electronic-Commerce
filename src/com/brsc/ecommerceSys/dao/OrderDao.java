package com.brsc.ecommerceSys.dao;

import java.util.List;

import com.brsc.ecommerceSys.domain.Order;
import com.brsc.ecommerceSys.helper.OrderHelper;

public interface OrderDao {
	
	/** 增加一笔订单 */
	void addOrder(Order order);
	/** 根据订单编号查找订单 */
	Order getOrderById(Integer orderNo);
	/** 取出所有订单 */
	List<Order> loadAll();
	
	/** 统计满足条件的订单数量 */
	Long cntOrders(OrderHelper helper);
	/** 分页查询订单信息  */
	List<Order> loadScopeOrders(OrderHelper helper,int startInd,int size);
	/** 修改订单 */
	void updateOrder(Order order);
}
