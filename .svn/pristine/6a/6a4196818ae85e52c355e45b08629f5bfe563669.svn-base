package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.domain.Manager;
import com.brsc.ecommerceSys.helper.ManagerHelper;
import com.brsc.ecommerceSys.utils.Page;

public interface ManagerService {

	/** 添加员工用户 */
	void addManager(Manager manager);
	/** 删除员工 */
	void deleteManager(String managerNo);

	/** 更新员工 */
	void modifyManager(Manager manager);

	/**
	 * 加载所有已注册用户
	 * @return
	 */
	List<Manager> loadManagers();
	
	/**登陆使用方法*/
	Manager checkManagerByNameAndPWD(String managerName,String managerPWD);
	
	/**根据userNo查user*/
	public Manager searchManagerByNo(String managerNo);
	
	
	/**组合查询已注册用户*/
	List<Manager> selectManagers(ManagerHelper managerHelper);
	
	/**获取查找分页*/
	public Page loadPageOfManagers(ManagerHelper managerHelper,Page page);
	
}
