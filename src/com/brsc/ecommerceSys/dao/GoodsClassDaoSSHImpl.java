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

import com.brsc.ecommerceSys.domain.GoodsClass;
import com.brsc.ecommerceSys.helper.GoodsClassHelper;

/**
 * @author YuTian
 *
 */
public class GoodsClassDaoSSHImpl extends HibernateDaoSupport implements GoodsClassDao {
	
	/* (non-Javadoc)
	 * @see com.brsc.ecommerceSys.dao.GoodsClassDao#addGoodsClass(com.brsc.ecommerceSys.domain.GoodsClass)
	 */
	@Override
	public void addGoodsClass(GoodsClass goodsClass) {
		
		this.getHibernateTemplate().save(goodsClass);
		
	}

	@Override
	public List<GoodsClass> loadAllParentGoodsClass() {
		
		List<GoodsClass> goodsClassList = (List<GoodsClass>)this.getHibernateTemplate().find("from GoodsClass g where g.parentGoodsClass.goodsClassNo is null");
//		System.out.println(goodsClassList);
		return goodsClassList;
	}

	@Override
	public List<GoodsClass> loadAll() {
		return this.getHibernateTemplate().find("from GoodsClass g order by g.goodsClassNo desc");
	}

	@Override
	public void deleteGoodsClassByNo(Integer goodsClassNo) {
		
		GoodsClass goodsClass = (GoodsClass)this.getHibernateTemplate().load(GoodsClass.class, goodsClassNo);
		List<GoodsClass> goodsClassList = this.getHibernateTemplate().find("from GoodsClass g where g.parentGoodsClass.goodsClassNo="+goodsClassNo);
		this.getHibernateTemplate().delete(goodsClass);
		this.getHibernateTemplate().deleteAll(goodsClassList);
		
	}

	@Override
	public void updateGoodsClass(GoodsClass goodsClass) {
		
		this.getHibernateTemplate().update(goodsClass);
		
	}

	@Override
	public GoodsClass getGoodsClassByNo(Integer goodsClassNo) {
		return (GoodsClass)this.getHibernateTemplate().get(GoodsClass.class, goodsClassNo);
	}

	@Override
	public Boolean checkName(String goodsClassName, Integer pGoodsClassNo) {
		
		List<GoodsClass> goodsClassList=null;
		
		if(pGoodsClassNo!=0){
			goodsClassList = (List<GoodsClass>)this.getHibernateTemplate().find("from GoodsClass g where g.parentGoodsClass.goodsClassNo ="+pGoodsClassNo);
			
			for(GoodsClass goodsClass : goodsClassList){
				if(goodsClass.getGoodsClassName().equals(goodsClassName))
					return false;
			}
		}else{
			goodsClassList = (List<GoodsClass>)this.getHibernateTemplate().find("from GoodsClass g where g.parentGoodsClass.goodsClassNo =null");
			
			for(GoodsClass goodsClass : goodsClassList){
				if(goodsClass.getGoodsClassName().equals(goodsClassName))
					return false;
			}
		}
		
		return true;
	}

	@Override
	public List<GoodsClass> loadAllChildGoodsClassByParent(Integer goodsClassNo) {
		return this.getHibernateTemplate().find("from GoodsClass g where g.parentGoodsClass.goodsClassNo="+goodsClassNo);
	}

	@Override
	public List<GoodsClass> loadAllByHelper(GoodsClassHelper helper) {
		
		org.hibernate.Session session = this.getSession();
		Transaction trans = session.beginTransaction();
		List<GoodsClass> goodsClassList = null;
		try {
			DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			goodsClassList = criteria.list();
			trans.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.clear();
		}
		
		return goodsClassList;
	}
	
	private DetachedCriteria genCriteriaByHelper(GoodsClassHelper helper){
		
		DetachedCriteria criteria = DetachedCriteria.forClass(GoodsClass.class);
		
		if(StringUtils.isNotEmpty(helper.getGoodsClassName()))
			criteria.add(Restrictions.like("goodsClassName", "%"+helper.getGoodsClassName()+"%"));
		
		return criteria;
	}

	@Override
	public List<GoodsClass> loadScopedGoodsClassByHelper(
			GoodsClassHelper helper, int beginIdx, int fetchSize) {
		
		Session session = this.getSession();
		Transaction trans=session.beginTransaction();
		List<GoodsClass> goodsClassList = null;
		try {
			DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			goodsClassList=criteria.setFirstResult(beginIdx).setMaxResults(fetchSize).list();
			trans.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.clear();
		}
		return goodsClassList;
	}

	@Override
	public Long cntGoodsClassByHelper(GoodsClassHelper helper) {
		
		DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
		detachedCriteria.setProjection(Projections.rowCount());
		
		Session session=this.getSession();
		Transaction trans = session.beginTransaction();
		long cnt=0;
		try {
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			cnt=Long.parseLong(criteria.list().get(0).toString());
			System.out.println(criteria.list().get(0));
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
