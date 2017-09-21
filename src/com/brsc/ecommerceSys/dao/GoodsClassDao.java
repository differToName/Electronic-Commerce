/**
 * 
 */
package com.brsc.ecommerceSys.dao;

import java.util.List;

import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;

/**
 * @author YuTian
 *
 */
public interface GoodsClassDao {
	
	/**添加父商品类别*/
	void addGoodsClass(GoodsClass goodsClass);
	
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
	
	/**通过条件查询类别*/
	List<GoodsClass> loadAllByHelper(GoodsClassHelper helper);
	
	List<GoodsClass> loadScopedGoodsClassByHelper(GoodsClassHelper helper,int beginIdx,int fetchSize);
	
	Long cntGoodsClassByHelper(GoodsClassHelper helper);
	
	/**通过编号获取商品类别*/
	GoodsClass getGoodsClassByNo(Integer goodsClassNo);
	
	/**删除商品类别*/
	void deleteGoodsClassByNo(Integer goodsClassNo);
	
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
