/**
 * 
 */
package com.brsc.ecommerceSys.dao;

import java.util.List;

import org.apache.commons.lang.xwork.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.brsc.ecommerceSys.domain.Goods;
import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;
import com.brsc.ecommerceSys.helper.GoodsHelper;

/**
 * @author YuTian
 *
 */
public class GoodsDaoSSHImpl extends HibernateDaoSupport implements GoodsDao {

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.dao.GoodsDao#addGoods(com.brsc.ecommerceSys.domain.Goods)
	 */
	@Override
	public void addGoods(Goods goods) {
		
		this.getHibernateTemplate().save(goods);

	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.dao.GoodsDao#getGoodsByNo(java.lang.Integer)
	 */
	@Override
	public Goods getGoodsByNo(Integer goodsNo) {
		
		return (Goods)this.getHibernateTemplate().get(Goods.class, goodsNo);
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.dao.GoodsDao#loadAll()
	 */
	@Override
	public List<Goods> loadAll() {
		
		return this.getHibernateTemplate().find("from Goods g order by g.goodsNo desc");
	}

	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.dao.GoodsDao#deleteGoodsByNo(java.lang.Integer)
	 */
	@Override
	public void deleteGoodsByNo(Integer goodsNo) {
		
		Goods goods = (Goods)this.getHibernateTemplate().load(Goods.class, goodsNo);
		this.getHibernateTemplate().delete(goods);
	}

	@Override
	public void updateGoods(Goods goods) {
		
		this.getHibernateTemplate().update(goods);
	}

	@Override
	public List<Goods> loadAllByHelper(GoodsHelper helper) {
		Session session = this.getSession();
		Transaction trans = session.beginTransaction();
		List<Goods> goodsList = null;
		
		try{
			DetachedCriteria detachedCriteria = this.genCriteriaByHelper(helper);
			Criteria criteria = detachedCriteria.getExecutableCriteria(session);
			goodsList = criteria.list();
			trans.commit();
		}catch(HibernateException e){
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.close();
		}	
		return goodsList;
	}
	
	private DetachedCriteria genCriteriaByHelper(GoodsHelper helper){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(Goods.class);
		
//		if(helper.getQryParentGoodsClassNo()!=null)
//			criteria.createCriteria("goodsClass").add(Restrictions.eq("goodsClassNo", helper.getQryParentGoodsClassNo()));
		
		if(StringUtils.isNotEmpty(helper.getQryChildGoodsClassNo())){
//			if(helper.getQryChildGoodsClassNo()!=0)
				Integer g = Integer.valueOf(helper.getQryChildGoodsClassNo());
				criteria.createCriteria("goodsClass").add(Restrictions.eq("goodsClassNo", g));
		}
		if(StringUtils.isNotEmpty(helper.getQryGoodsName()))
			criteria.add(Restrictions.like("goodsName", "%"+helper.getQryGoodsName()+"%"));
		
		return criteria;
	}

	@Override
	public List<Goods> loadScopedGoodsByHelper(GoodsHelper helper,
			int beginIdx, int fetchSize) {
		
		Session session = this.getSession();
		Transaction trans=session.beginTransaction();
		List<Goods> goodsList = null;
		try {
			DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			goodsList=criteria.setFirstResult(beginIdx).setMaxResults(fetchSize).list();
			trans.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.clear();
		}
		return goodsList;
	}

	@Override
	public Long cntGoodsByHelper(GoodsHelper helper) {
		
		DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
		detachedCriteria.setProjection(Projections.rowCount());
		
		Session session=this.getSession();
		Transaction trans = session.beginTransaction();
		long cnt=0;
		try {
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			cnt=Long.parseLong(criteria.list().get(0).toString());
//			System.out.println(criteria.list().get(0));
			trans.commit();
		} catch (HibernateException e) {
			// TODO: handle exception
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.close();
		}
		return cnt;
	}
}
