package com.brsc.ecommerceSys.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.brsc.ecommerceSys.domain.Manager;

import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.ManagerHelper;


public class ManagerDaoSSHImpl extends HibernateDaoSupport implements ManagerDao {

	@Override
	public void addManager(Manager manager) {
		try {
			this.getHibernateTemplate().save(manager);
		}catch(RuntimeException r){
			throw new ApplicationException("该管理员账号名已经存在！");
		}
		catch (Exception e) {
			throw new ApplicationException("该管理员账号名已经存在！");
		}
	}

	@Override
	public void deleteManager(String managerNo) {
		Manager manager=(Manager)this.getHibernateTemplate().load(Manager.class,managerNo);
		this.getHibernateTemplate().delete(manager);
	}

	@Override
	public void updateManager(Manager manager) {
		this.getHibernateTemplate().update(manager);
	}

	@Override
	public Manager searchManagerByNo(String managerNo) {
		
		return (Manager)this.getHibernateTemplate().find("from Manager where managerNo="+managerNo).get(0);
	}

	@Override
	public List<Manager> loadManagers() {
		return this.getHibernateTemplate().find("from Manager");
	}

	@Override
	public Manager checkManager(String managerName, String managerPWD) {
		Manager manager=new Manager();
		try {
			manager=(Manager)this.getHibernateTemplate().find("from Manager m where m.managerName='"+managerName+"' and m.managerPWD='"+managerPWD+"'").get(0);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new ApplicationException("登陆失败，请检查您的用户名和密码!");
		}
		return manager;
	}

	@Override
	public List<Manager> selectManagers(ManagerHelper managerHelper) {
		Session session=this.getSession();
		Transaction trans=session.beginTransaction();
		List<Manager> managerList=new ArrayList<Manager>();
		try {
			DetachedCriteria detachedCriteria=this.genCriteriaByHelper(managerHelper);
			Criteria criteria = detachedCriteria.getExecutableCriteria(session);
			managerList=criteria.list();
			trans.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			trans.rollback();
		}
		finally{
			if(session.isOpen())
				session.close();
		}
		return managerList;
	}

	@Override
	public Long cntManagersByHelper(ManagerHelper helper) {
		DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
		detachedCriteria.setProjection(Projections.rowCount());
		
		Session session=this.getSession();
		Transaction trans = session.beginTransaction();
		long cnt=0;
		try {
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			cnt=Long.parseLong(criteria.list().get(0).toString());
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
	
	@Override
	public List<Manager> loadScopeManagersByHelper(ManagerHelper helper, int beginIdx, int fetchSize) {
		Session session = this.getSession();
		Transaction trans=session.beginTransaction();
		List<Manager> managerList=new ArrayList<Manager>();

		try {
			DetachedCriteria detachedCriteria=this.genCriteriaByHelper(helper);
			Criteria criteria=detachedCriteria.getExecutableCriteria(session);//绑定session
			managerList=criteria.setFirstResult(beginIdx).setMaxResults(fetchSize).list();
			trans.commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			trans.rollback();
		}finally{
			if(session.isOpen())
				session.clear();
		}
		return managerList;
	}

	
	//获取离线DetachedCriteria组合查询
		private DetachedCriteria genCriteriaByHelper(ManagerHelper helper){
			DetachedCriteria criteria = DetachedCriteria.forClass(Manager.class);
			
			if(StringUtils.isNotEmpty(helper.getManagerName())){
				criteria.add(Restrictions.like("managerName", "%"+helper.getManagerName()+"%"));
			}
			if(StringUtils.isNotEmpty(helper.getManagerSex())){
				criteria.add(Restrictions.eq("managerSex", helper.getManagerSex()));
			}
			
			criteria.addOrder(Order.desc("managerNo"));
			return criteria;
		}
}
