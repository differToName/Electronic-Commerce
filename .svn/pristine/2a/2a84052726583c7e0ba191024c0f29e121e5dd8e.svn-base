package com.brsc.ecommerceSys.dao;

import java.util.List;

import com.brsc.ecommerceSys.domain.Manager;
import com.brsc.ecommerceSys.helper.ManagerHelper;

public interface ManagerDao {
	/** 添加管理员用户 */
	void addManager(Manager manager);

	/** 删除管理员 */
	void deleteManager(String managerNo);

	/** 更新管理员 */
	void updateManager(Manager manager);

	/**根据管理员的账户查询*/
	Manager searchManagerByNo(String managerNo);
	
	List<Manager> loadManagers();
	
	/**登陆验证*/
	Manager checkManager(String managerName, String managerPWD);

	/** 组合查询员工查询管理员 */
	 List<Manager> selectManagers(ManagerHelper managerHelper);
	
	 /**在当前条件下有多少条*/
	 public Long cntManagersByHelper(ManagerHelper helper);
	
	 /**获取范围管理员结果*/
	 public List<Manager> loadScopeManagersByHelper(ManagerHelper helper,int beginIdx,int fetchSize);
}
