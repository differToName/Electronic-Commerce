/**
 * 
 */
package com.brsc.ecommerceSys.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 商品类别类
 * @author YuTian
 *
 */
public class GoodsClass extends BaseOfValue {
	
	/**类别编号*/
	private Integer goodsClassNo;
//	private Integer parentGoodsClassNo;
	/**父类别*/
	private GoodsClass parentGoodsClass;
	/**类别名称*/
	private String goodsClassName;
	/**保存子类*/
	private Set<GoodsClass> categories = new HashSet<GoodsClass>();

	public Integer getGoodsClassNo() {
		return goodsClassNo;
	}
	public void setGoodsClassNo(Integer goodsClassNo) {
		this.goodsClassNo = goodsClassNo;
	}
	public GoodsClass getParentGoodsClass() {
		return parentGoodsClass;
	}
	public void setParentGoodsClass(GoodsClass parentGoodsClass) {
		this.parentGoodsClass = parentGoodsClass;
	}
    public String getGoodsClassName() {
		return goodsClassName;
	}
	public void setGoodsClassName(String goodsClassName) {
		this.goodsClassName = goodsClassName;
	}
	//	public Integer getParentGoodsClassNo() {
//		return parentGoodsClassNo;
//	}
//	public void setParentGoodsClassNo(Integer parentGoodsClassNo) {
//		this.parentGoodsClassNo = parentGoodsClassNo;
//	}
	public Set<GoodsClass> getCategories() {
		return categories;
	}
	public void setCategories(Set<GoodsClass> categories) {
		this.categories = categories;
	}
	@Override
	public boolean equals(Object obj) {
	    if(obj == null)  
	        return false;  
	    if(this == obj)  
	        return true; 
	    if(!(obj instanceof GoodsClass))
	    	return false;
	    GoodsClass goodsClass = (GoodsClass)obj;
		return this.goodsClassNo.equals(goodsClass.goodsClassNo);
	}
	
	@Override
	public String toString() {
		return "GoodsClass [goodsClassNo=" + goodsClassNo
				+ ", parentGoodsClass=" + parentGoodsClass
				+ ", goodsClassName=" + goodsClassName + ", categories="
				+ categories + "]";
	}
	
	
}
