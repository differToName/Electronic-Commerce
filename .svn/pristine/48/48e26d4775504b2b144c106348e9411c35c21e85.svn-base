/**
 * 
 */
package com.brsc.ecommerceSys.dao;

import java.util.List;

import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.helper.GoodsHelper;

/**
 * 商品信息
 * @author YuTian
 *
 */
public interface GoodsDao {
	
	/**添加商品信息*/
	void addGoods(Goods goods);
	
	/**通过商品Id获得商品信息
	 * 
	 * @param goodsNo
	 * @return
	 */
	Goods getGoodsByNo(Integer goodsNo);
	
	/**获得所有商品信息
	 * 
	 * @return 商品信息列表
	 */
	List<Goods> loadAll();
	
	List<Goods> loadAllByHelper(GoodsHelper helper);
	
	List<Goods> loadScopedGoodsByHelper(GoodsHelper helper,int beginIdx,int fetchSize);
	
	Long cntGoodsByHelper(GoodsHelper helper);
	
	/**通过商品Id删除商品信息
	 * 
	 * @param goodsNo
	 */
	void deleteGoodsByNo(Integer goodsNo);
	
	/**更新商品信息*/
	void updateGoods(Goods goods);

}
