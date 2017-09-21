package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.domain.User;
import com.brsc.ecommerceSys.helper.UserHelper;
import com.brsc.ecommerceSys.utils.Page;

public interface UserService {
	/** 添加员工用户 */
	void addUser(User user);
	/** 删除员工 */
	void deleteUser(String userNo);

	/** 更新员工 */
	void modifyUser(User user);

	/**
	 * 加载所有已注册用户
	 * @return
	 */
	List<User> loadUsers();
	/**
	 * 根据姓名查询是否存在员工
	 * 
	 * @param emName
	 * @return
	 */
	User checkUser(String userName, String userPWD);
	
	/**组合查询已注册用户*/
	List<User> selectUsers(UserHelper userHelper);
	
	/**获取查找分页*/
	public Page loadPageOfUsers(UserHelper userHelper,Page page);
	
	/**根据userNo查user*/
	public User searchUserByNo(String userNo);
	
}
