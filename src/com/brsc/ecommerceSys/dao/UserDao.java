package com.brsc.ecommerceSys.dao;

import java.util.List;

import com.brsc.ecommerceSys.domain.User;
import com.brsc.ecommerceSys.helper.UserHelper;

public interface UserDao {

	/** 添加员工用户 */
	void addUser(User user);

	/** 删除员工 */
	void deleteUser(String userNo);

	/** 更新员工 */
	void updateUser(User user);

	/**根据员工的账户查询*/
	User searchUserByNo(String userNo);
	
	List<User> loadUsers();
	
 	/**
	 * 根据姓名查询是否存在员工
	 * 
	 * @param emName
	 * @return
	 */
	User checkUser(String userName, String userPWD);

	/** 组合查询员工查询员工 */
	 List<User> selectUsers(UserHelper userHelper);
	
	 /**在当前条件下有多少条*/
	 public Long cntUsersByHelper(UserHelper helper);
	
	 /**获取范围User结果*/
	 public List<User> loadScopeUsersByHelper(UserHelper helper,int beginIdx,int fetchSize);
}

