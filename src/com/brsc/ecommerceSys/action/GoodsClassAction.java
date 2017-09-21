/**
 * 
 */
package com.brsc.ecommerceSys.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.service.GoodsClassService;
import com.brsc.ecommerceSys.utils.Page;

/**
 * 商品类别
 * @author YuTian
 *
 */
public class GoodsClassAction extends BaseOfAction {
	
	private GoodsClassService goodsClassService = null;
	private GoodsClass goodsClass = null;
	private String goodsClassNo;
	private List<GoodsClass> goodsClassList = null;
	private Page page=new Page();
	private GoodsClassHelper helper = new GoodsClassHelper();
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public GoodsClassHelper getHelper() {
		return helper;
	}
	public void setHelper(GoodsClassHelper helper) {
		this.helper = helper;
	}
	public String getGoodsClassNo() {
		return goodsClassNo;
	}
	public void setGoodsClassNo(String goodsClassNo) {
		this.goodsClassNo = goodsClassNo;
	}
	public List<GoodsClass> getGoodsClassList() {
		return goodsClassList;
	}
	public void setGoodsClassList(List<GoodsClass> goodsClassList) {
		this.goodsClassList = goodsClassList;
	}
	public GoodsClass getGoodsClass() {
		return goodsClass;
	}
	public void setGoodsClass(GoodsClass goodsClass) {
		this.goodsClass = goodsClass;
	}
	public void setGoodsClassService(GoodsClassService goodsClassService) {
		this.goodsClassService = goodsClassService;
	}
	
	public String toReg() throws Exception{
		
		goodsClassList = goodsClassService.loadAllParentGoodsClass();
//		GoodsClass g = new GoodsClass();
//		g.setGoodsClassNo(1);
//		goodsClass.setParentGoodsClass(g);
		
		return "to_reg_goodsClass";
	}
	
	public String createGoodsClass() throws Exception{
		if(goodsClassNo.equals("0")){
			goodsClass.setParentGoodsClass(null);
		}
		else{
			GoodsClass g = new GoodsClass();
			g.setGoodsClassNo(Integer.valueOf(goodsClassNo));
			goodsClass.setParentGoodsClass(g);
		}
		goodsClassService.addGoodsClass(goodsClass);
		
		return "to_list_goodsClass_action";
	}
	
	public String listGoodsClass() throws Exception{
		
//		GoodsClass g = new GoodsClass();
//		g.setGoodsClassNo(1);
//		List<GoodsClass> goodsClassTemp = goodsClassService.loadAll();
//		goodsClassTemp.remove(g);
//		goodsClassList = goodsClassTemp;
		page = goodsClassService.loadAll(helper,page);
		
		return "to_list_goodsClass";
	}
	
	public String removeGoodsClass() throws Exception{
		
		goodsClassService.removeGoodsClassByNo(goodsClass.getGoodsClassNo());
		
		return "to_list_goodsClass_action";
	}
	
	public String preUpdateGoodsClass() throws Exception{
		
		goodsClass = goodsClassService.getGoodsClassByNo(goodsClass.getGoodsClassNo());
		goodsClassList = goodsClassService.loadAllParentGoodsClass();
		
		return "to_preUpdate_goodsClass";
	}
	
	public String updateGoodsClass() throws Exception{
		
		if(goodsClass.getParentGoodsClass().getGoodsClassNo()==0)
			goodsClass.setParentGoodsClass(null);
		goodsClassService.updateGoodsClass(goodsClass);
		
		return "to_list_goodsClass_action";
	}
	
	public String checkName() throws Exception{
		
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
//		System.out.println(goodsClass.getGoodsClassName());
//		System.out.println(goodsClass.getParentGoodsClass().getGoodsClassNo());
//		System.out.println(goodsClassService.checkName(goodsClass.getGoodsClassName(), goodsClass.getParentGoodsClass().getGoodsClassNo()));
		if(!(goodsClassService.checkName(goodsClass.getGoodsClassName(),Integer.valueOf(goodsClassNo))))
			response.getWriter().println("类别名已存在，请重新输入！");
		
		return NONE;
	}

}
