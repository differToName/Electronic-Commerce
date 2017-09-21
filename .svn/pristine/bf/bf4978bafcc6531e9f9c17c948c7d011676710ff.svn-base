/**
 * 
 */
package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.utils.Page;

/**
 * @author YuTian
 *
 */
public interface GoodsClassService {
	
	/**添加商品类别*/
	void addGoodsClass(GoodsClass goodsClass) throws ApplicationException;
	
	/**加载所有父类别
	 * 
	 * @return 父类别列表
	 */
	List<GoodsClass> loadAllParentGoodsClass();
	
	/**加载所有子类*/
	List<GoodsClass> loadAllChildGoodsClassByParent(Integer goodsClassNo);
	
	/**加载所有类别
	 * 
	 * @return 所有类别列表
	 */
	List<GoodsClass> loadAll();
	
	List<GoodsClass> loadAll(GoodsClassHelper helper);
	
	Page loadAll(GoodsClassHelper helper, Page page);
	
	/**通过商品编号获取商品类别*/
	GoodsClass getGoodsClassByNo(Integer goodsClassNo);
	
	/**删除商品类别*/
	void removeGoodsClassByNo(Integer goodsClassNo);
	
	/**修改商品类别*/
	void updateGoodsClass(GoodsClass goodsClass);
	
	/**检查类别名称是否重复
	 * 
	 * @param goodsClassName 名称
	 * @param pGoodsClassNo 父类别编号
	 * @return 重复false否则true
	 */
	Boolean checkName(String goodsClassName,Integer pGoodsClassNo);

}
