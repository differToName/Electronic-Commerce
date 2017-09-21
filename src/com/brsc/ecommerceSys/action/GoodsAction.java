/**
 * 
 */
package com.brsc.ecommerceSys.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;

import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsHelper;
import com.brsc.ecommerceSys.service.GoodsClassService;
import com.brsc.ecommerceSys.service.GoodsService;
import com.brsc.ecommerceSys.utils.Page;

/**
 * @author YuTian
 *
 */
public class GoodsAction extends BaseOfAction {
	
	private Goods goods;
	private String parentGoodsClassNo;
	private GoodsService goodsService;
	private GoodsClassService goodsClassService;
	private File picture;
	private Map<Integer, List<GoodsClass>> goodsClassMap;  
	private List<Goods> goodsList;
	private List<GoodsClass> parentGoodsClassList;
	private List<GoodsClass> goodsClassList;
	private List<GoodsClass> childGoodsClassList;
	private Page page = new Page();
	private GoodsHelper helper = new GoodsHelper();
	
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public GoodsHelper getHelper() {
		return helper;
	}
	public void setHelper(GoodsHelper helper) {
		this.helper = helper;
	}
	public List<GoodsClass> getChildGoodsClassList() {
		return childGoodsClassList;
	}
	public void setChildGoodsClassList(List<GoodsClass> childGoodsClassList) {
		this.childGoodsClassList = childGoodsClassList;
	}
	public Map<Integer, List<GoodsClass>> getGoodsClassMap() {
		return goodsClassMap;
	}
	public void setGoodsClassMap(Map<Integer, List<GoodsClass>> goodsClassMap) {
		this.goodsClassMap = goodsClassMap;
	}
	public String getParentGoodsClassNo() {
		return parentGoodsClassNo;
	}
	public void setParentGoodsClassNo(String parentGoodsClassNo) {
		this.parentGoodsClassNo = parentGoodsClassNo;
	}
	public List<GoodsClass> getParentGoodsClassList() {
		return parentGoodsClassList;
	}
	public void setParentGoodsClassList(List<GoodsClass> parentGoodsClassList) {
		this.parentGoodsClassList = parentGoodsClassList;
	}
	public List<Goods> getGoodsList() {
		return goodsList;
	}
	public void setGoodsList(List<Goods> goodsList) {
		this.goodsList = goodsList;
	}
	public Goods getGoods() {
		return goods;
	}
	public void setGoods(Goods goods) {
		this.goods = goods;
	}
	public File getPicture() {
		return picture;
	}
	public void setPicture(File picture) {
		this.picture = picture;
	}
	public void setGoodsService(GoodsService goodsService) {
		this.goodsService = goodsService;
	}
	public void setGoodsClassService(GoodsClassService goodsClassService) {
		this.goodsClassService = goodsClassService;
	}
	
	public String toReg() throws Exception{
		
		parentGoodsClassList = goodsClassService.loadAllParentGoodsClass();
		
//		ServletActionContext.getRequest().getSession().setAttribute("parentGoodsClassList",parentGoodsClassList);
		goodsClassMap = new HashMap<Integer, List<GoodsClass>>();
		for(int i=0;i<parentGoodsClassList.size();i++){
			goodsClassList = new ArrayList<GoodsClass>();
			Integer parentGoodsClassNo = parentGoodsClassList.get(i).getGoodsClassNo();
			List<GoodsClass> childGoodsClassList = goodsClassService.loadAllChildGoodsClassByParent(parentGoodsClassNo);
			
			for(int j=0;j<childGoodsClassList.size();j++){
				goodsClassList.add(childGoodsClassList.get(j));
			}
			
			goodsClassMap.put(parentGoodsClassNo, goodsClassList);
		}
		
		goods = new Goods();
		goods.setStatus("N");
		goods.setInventory(0);
		
		return "to_reg_goods";
	}
	
	public String loadChildGoodsClass() throws Exception{
		String goodsClassNo = "";
		String goodsClassName = "";
		String selectNo = "";
		Integer pNo = Integer.valueOf(parentGoodsClassNo);
		
		goodsClassList = goodsClassService.loadAllChildGoodsClassByParent(pNo);
		
		 selectNo = String.valueOf(ServletActionContext.getRequest().getSession().getAttribute("selectedNo"));//被选中的子类编号

		 for (int i = 0; i < goodsClassList.size(); i++) {  
		        GoodsClass goodsClass = (GoodsClass) goodsClassList.get(i);  
		        goodsClassNo += goodsClass.getGoodsClassNo() + "_";  
		        goodsClassName += goodsClass.getGoodsClassName() + "_";  
		    }  
		String code = goodsClassNo + "|" + goodsClassName + "|"+selectNo;
		
		System.out.println(code);
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		
		response.getWriter().print(code);
        response.getWriter().close();
		
		return NONE;
	}
	
	public String createGoods() throws Exception{
		
		if(picture!=null){
			
			FileInputStream fis = new FileInputStream(picture);
			
			byte[] data = new byte[fis.available()];
			fis.read(data);
	
			this.goods.setPicture(data);
			
		}
		
		goodsService.addGoods(goods);
		
		return "to_list_goods_action";
	}
	
	public String loadPic() throws Exception{
		
		byte[] fileData = goodsService.getGoodsPicByNo(goods.getGoodsNo());
		
		if(fileData==null || fileData.length==0){
			String defaultPicPath = ServletActionContext.getRequest().getRealPath("/pics/default.jpg");
			FileInputStream fis = new FileInputStream(defaultPicPath);
			fileData = new byte[fis.available()];
			fis.read(fileData);
			fis.close();
		}
		
		OutputStream writer = ServletActionContext.getResponse().getOutputStream();
		ServletActionContext.getResponse().setContentType("image/jpeg");
		writer.write(fileData);
		writer.flush();
		writer.close();
		
		return null;
	}
	
	public String listGoods() throws Exception{
		
		parentGoodsClassList = goodsClassService.loadAllParentGoodsClass();
		page = goodsService.loadAll(helper,page);
		ServletActionContext.getRequest().getSession().setAttribute("selectedNo",helper.getQryChildGoodsClassNo());
		
		return "to_list_goods";
	}
	
	public String removeGoods() throws Exception{
		
		goodsService.removeGoodsByNo(goods.getGoodsNo());
		
		return "to_list_goods_action";
	}
	
	public String preUpdateGoods() throws Exception{
		
		parentGoodsClassList = goodsClassService.loadAllParentGoodsClass();
		
//		ServletActionContext.getRequest().getSession().setAttribute("parentGoodsClassList",parentGoodsClassList);
		goodsClassMap = new HashMap<Integer, List<GoodsClass>>();
		for(int i=0;i<parentGoodsClassList.size();i++){
			goodsClassList = new ArrayList<GoodsClass>();
			Integer parentGoodsClassNo = parentGoodsClassList.get(i).getGoodsClassNo();
			List<GoodsClass> childGoodsClassList = goodsClassService.loadAllChildGoodsClassByParent(parentGoodsClassNo);
			
			for(int j=0;j<childGoodsClassList.size();j++){
				goodsClassList.add(childGoodsClassList.get(j));
			}
			
			goodsClassMap.put(parentGoodsClassNo, goodsClassList);
		}
		goods = goodsService.getGoodsByNo(goods.getGoodsNo());
		
		return "to_update_goods";
	}
	
	public String updateGoods() throws Exception{
		
		if(picture!=null){
			FileInputStream fis = new FileInputStream(picture);
			
			byte[] data = new byte[fis.available()];
			fis.read(data);
			
			this.goods.setPicture(data);
		}
		
		if(goods.getPicture()==null||goods.getPicture().length==0){
			goods.setPicture(goodsService.getGoodsPicByNo(goods.getGoodsNo()));
		}
		
		goodsService.updateGoods(goods);
		
		return "to_list_goods_action";
	}

}
