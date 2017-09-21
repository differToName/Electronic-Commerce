package com.brsc.ecommerceSys.service;

import java.util.Date;
import java.util.List;

import com.brsc.ecommerceSys.dao.OrderDao;
import com.brsc.ecommerceSys.domain.Order;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.OrderHelper;
import com.brsc.ecommerceSys.utils.Page;

public class OrderServiceImpl implements OrderService {
	
	private OrderDao orderDao = null;

	public void setOrderDao(OrderDao orderDao) {
		this.orderDao = orderDao;
	}

	@Override
	public void addOrder(Order order) {
		
		try {
			order.setOrderDate(new Date());//下单时间为当前系统时间
			order.setAuditStatu("N");//订单审核状态默认'N'-未审核状态
			orderDao.addOrder(order);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new ApplicationException("添加订单时出错");
		}

	}

	@Override
	public List<Order> loadOrders() {
		
		return orderDao.loadAll();
	}

	@Override
	public Page loadOrderPage(OrderHelper helper, Page page) {
		page.setTotalRecNum(orderDao.cntOrders(helper));
		page.setPageContent(orderDao.loadScopeOrders(helper, page.getStartIndex(), page.getEndIndex()-page.getStartIndex()));
		return page;
	}

	@Override
	public Order loadOrderById(Integer orderNo) {
		
		return orderDao.getOrderById(orderNo);
	}

	@Override
	public void updateOrder(Order order) {
		
		try{
			/** 将数据库中的订单日期和审核日期字段重新赋给该笔订单属性 */
			order.setOrderDate(orderDao.getOrderById(order.getOrderNo()).getOrderDate());
			order.setAuditDate(orderDao.getOrderById(order.getOrderNo()).getAuditDate());
			orderDao.updateOrder(order);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			throw new ApplicationException("修改订单时出错");
		}
	}

	@Override
	public void auditOrder(Order order) {
		
		try{
			/** 将数据库中的下单时间字段重新赋给该笔订单属性 */
			order.setOrderDate(orderDao.getOrderById(order.getOrderNo()).getOrderDate());
			/** 审核时间为当前系统时间 */
			order.setAuditDate(new Date());
			orderDao.updateOrder(order);
		}catch (Exception e) {
			System.out.println(e.getMessage());
			throw new ApplicationException("审核订单时出错");
		}
	}

}
