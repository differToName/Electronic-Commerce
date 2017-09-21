/**
 * 
 */
package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.dao.GoodsClassDao;
import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.utils.Page;

/**
 * @author YuTian
 *
 */
public class GoodsClassServiceSSHImpl implements GoodsClassService {
	
	private GoodsClassDao goodsClassDao;

	public void setGoodsClassDao(GoodsClassDao goodsClassDao) {
		this.goodsClassDao = goodsClassDao;
	}


	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.service.GoodsClassService#addGoodsClass(com.brsc.ecommerceSys.domain.GoodsClass)
	 */
	@Override
	public void addGoodsClass(GoodsClass goodsClass) throws ApplicationException {

		goodsClassDao.addGoodsClass(goodsClass);

	}


	@Override
	public List<GoodsClass> loadAllParentGoodsClass() {
		
		return goodsClassDao.loadAllParentGoodsClass();
	}


	@Override
	public List<GoodsClass> loadAll() {
		
		return goodsClassDao.loadAll();
	}


	@Override
	public void removeGoodsClassByNo(Integer goodsClassNo) {
		
		goodsClassDao.deleteGoodsClassByNo(goodsClassNo);
		
	}


	@Override
	public void updateGoodsClass(GoodsClass goodsClass) {
		
		goodsClassDao.updateGoodsClass(goodsClass);
	}


	@Override
	public GoodsClass getGoodsClassByNo(Integer goodsClassNo) {
		
		return goodsClassDao.getGoodsClassByNo(goodsClassNo);
	}


	@Override
	public Boolean checkName(String goodsClassName, Integer pGoodsClassNo) {
		return goodsClassDao.checkName(goodsClassName, pGoodsClassNo);
	}


	@Override
	public List<GoodsClass> loadAllChildGoodsClassByParent(Integer goodsClassNo) {
		return goodsClassDao.loadAllChildGoodsClassByParent(goodsClassNo);
	}


	@Override
	public List<GoodsClass> loadAll(GoodsClassHelper helper) {
		return goodsClassDao.loadAllByHelper(helper);
	}


	@Override
	public Page loadAll(GoodsClassHelper helper, Page page) {
		
		page.setTotalRecNum(goodsClassDao.cntGoodsClassByHelper(helper));
		page.setPageContent(goodsClassDao.loadScopedGoodsClassByHelper(helper, page.getStartIndex(), page.getEndIndex()-page.getStartIndex()));
		
		return page;
	}

}
