/**
 * 
 */
package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.helper.GoodsHelper;
import com.brsc.ecommerceSys.utils.Page;

/**
 * @author YuTian
 *
 */
public interface GoodsService {
	
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
	
	List<Goods> loadAll(GoodsHelper helper);
	
	Page loadAll(GoodsHelper helper, Page page);
	
	/**通过商品Id删除商品信息
	 * 
	 * @param goodsNo
	 */
	void removeGoodsByNo(Integer goodsNo);

	/**通过编号获取商品图片*/
	byte[] getGoodsPicByNo(Integer goodsNo);
	
	/**更新商品信息*/
	void updateGoods(Goods goods);

}
