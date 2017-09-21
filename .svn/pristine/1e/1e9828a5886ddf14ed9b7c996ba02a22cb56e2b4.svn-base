/**
 * 
 */
package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.dao.GoodsDao;
import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.helper.GoodsHelper;
import com.brsc.ecommerceSys.utils.Page;

/**
 * @author YuTian
 *
 */
public class GoodsServiceSSHImpl implements GoodsService {
	
	private GoodsDao goodsDao;

	public void setGoodsDao(GoodsDao goodsDao) {
		this.goodsDao = goodsDao;
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.service.GoodsService#addGoods(com.brsc.ecommerceSys.domain.Goods)
	 */
	@Override
	public void addGoods(Goods goods) {
		goodsDao.addGoods(goods);
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.service.GoodsService#getGoodsByNo(java.lang.Integer)
	 */
	@Override
	public Goods getGoodsByNo(Integer goodsNo) {
		return goodsDao.getGoodsByNo(goodsNo);
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.service.GoodsService#loadAll()
	 */
	@Override
	public List<Goods> loadAll() {
		return goodsDao.loadAll();
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.service.GoodsService#removeGoodsByNo(java.lang.Integer)
	 */
	@Override
	public void removeGoodsByNo(Integer goodsNo) {
		goodsDao.deleteGoodsByNo(goodsNo);
	}

	@Override
	public byte[] getGoodsPicByNo(Integer goodsNo) {
		return goodsDao.getGoodsByNo(goodsNo).getPicture();
	}

	@Override
	public void updateGoods(Goods goods) {
		goodsDao.updateGoods(goods);
	}

	@Override
	public List<Goods> loadAll(GoodsHelper helper) {
		return goodsDao.loadAllByHelper(helper);
	}

	@Override
	public Page loadAll(GoodsHelper helper, Page page) {
		
		page.setTotalRecNum(goodsDao.cntGoodsByHelper(helper));
		page.setPageContent(goodsDao.loadScopedGoodsByHelper(helper, page.getStartIndex(), page.getEndIndex()-page.getStartIndex()));
		
		return page;
	}

}
