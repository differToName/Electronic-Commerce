package com.brsc.ecommerceSys.helper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 订单查找工具
 * @author wls
 *
 */
public class OrderHelper {
	
	private String qryUserNo;//用户账号查询条件
	private Date qryMaxOrderDate;//下单最晚日期
	private Date qryMinOrderDate;//下单最早日期
	private Integer qryGoodsNo;//商品编号查询条件
	private String qryAuditStatu;//是否审核查询条件
	
	private String qryMaxDateString;
	private String qryMinDateString;
	
	public String getQryMaxDateString() {
		return qryMaxDateString;
	}
	public void setQryMaxDateString(String qryMaxDateString) {
		if(qryMaxDateString.length()==0||qryMaxDateString==""){
			this.qryMaxOrderDate = null;
		}
		else{
			this.qryMaxDateString = qryMaxDateString;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			try {
				this.qryMaxOrderDate = (Date)sdf.parseObject(qryMaxDateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	public String getQryMinDateString() {
		return qryMinDateString;
	}
	public void setQryMinDateString(String qryMinDateString) {
		if(qryMinDateString.length()==0||qryMinDateString==""){
			this.qryMinOrderDate = null;
		}
		else{
			this.qryMinDateString = qryMinDateString;
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			
			try {
				this.qryMinOrderDate = (Date)sdf.parseObject(qryMinDateString);
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	public String getQryUserNo() {
		return qryUserNo;
	}
	public void setQryUserNo(String qryUserNo) {
		this.qryUserNo = qryUserNo;
	}
	public Date getQryMaxOrderDate() {
		return qryMaxOrderDate;
	}
	public void setQryMaxOrderDate(Date qryMaxOrderDate) {
		this.qryMaxOrderDate = qryMaxOrderDate;
	}
	public Date getQryMinOrderDate() {
		return qryMinOrderDate;
	}
	public void setQryMinOrderDate(Date qryMinOrderDate) {
		this.qryMinOrderDate = qryMinOrderDate;
	}
	public Integer getQryGoodsNo() {
		return qryGoodsNo;
	}
	public void setQryGoodsNo(Integer qryGoodsNo) {
		this.qryGoodsNo = qryGoodsNo;
	}
	public String getQryAuditStatu() {
		return qryAuditStatu;
	}
	public void setQryAuditStatu(String qryAuditStatu) {
		this.qryAuditStatu = qryAuditStatu;
	}
	
}
