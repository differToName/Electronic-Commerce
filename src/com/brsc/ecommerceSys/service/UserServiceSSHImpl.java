package com.brsc.ecommerceSys.service;

import java.util.List;

import com.brsc.ecommerceSys.dao.UserDao;
import com.brsc.ecommerceSys.domain.User;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.UserHelper;
import com.brsc.ecommerceSys.utils.Page;

public class UserServiceSSHImpl implements UserService {

	private UserDao userDao=null;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public void addUser(User user) {
		try {
			userDao.addUser(user);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			throw new ApplicationException("添加用户时出错");
		}
	}

	@Override
	public void deleteUser(String userNo) {
		userDao.deleteUser(userNo);
	}

	@Override
	public void modifyUser(User user) {
		userDao.updateUser(user);
	}

	@Override
	public User checkUser(String userName, String userPWD) {
		User user=userDao.checkUser(userName, userPWD);
		if(user==null)
			throw new ApplicationException("没有这个账号信息");
		else
			return user;
	}

	@Override
	public List<User> loadUsers() {
		// TODO Auto-generated method stub
		return userDao.loadUsers();
	}

	@Override
	public List<User> selectUsers(UserHelper userHelper) {
		
		return userDao.selectUsers(userHelper);
	}

	@Override
	public Page loadPageOfUsers(UserHelper userHelper, Page page) {
		page.setTotalRecNum(userDao.cntUsersByHelper(userHelper));
		page.setPageContent(userDao.loadScopeUsersByHelper(userHelper, page.getStartIndex(), page.getEndIndex()-page.getStartIndex()));
		return page;
	}

	@Override
	public User searchUserByNo(String userNo) {
		
		return userDao.searchUserByNo(userNo);
	}

}
