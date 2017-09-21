package com.brsc.ecommerceSys.action;

import org.apache.struts2.ServletActionContext;

import com.brsc.ecommerceSys.domain.Manager;
import com.brsc.ecommerceSys.domain.User;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.service.ManagerService;
import com.brsc.ecommerceSys.service.UserService;

public class SecurityAction extends BaseOfAction{
	private Manager manager;
	private User user;
	private UserService userService;
	private ManagerService managerService;
	private String newManagerPassword;//新密码
	
	public String getNewManagerPassword() {
		return newManagerPassword;
	}
	public void setNewManagerPassword(String newManagerPassword) {
		this.newManagerPassword = newManagerPassword;
	}
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	//去管理员登陆界面
	public String toLoginManager() throws Exception{
		System.out.println("123456");
		return "login_page";
	}
	
	//管理员登陆
	public String managerLogin() throws Exception{
		try {
			System.out.println(manager);
			manager=managerService.checkManagerByNameAndPWD(manager.getManagerName(), manager.getManagerPWD());
			System.out.println("manager:"+manager);
			ServletActionContext.getRequest().getSession().setAttribute("loginManager", manager);
			
		} catch (ApplicationException e) {
			this.addActionError("用户名或密码错误！");
			System.out.println(e.getMessage());
			return "login_page";
		}
		return "to_index_page";
	}
	
	//管理员登出
	public String managerLogout() throws Exception{
		
		ServletActionContext.getRequest().getSession().removeAttribute("loginManager");
		ServletActionContext.getRequest().getSession().invalidate();
		return "login_page";
	}
	
	//去密码修改页面
	public String toModifyPWD()throws Exception{
		
		return "to_modifyPWD_page";
	}
	
	//密码修改
	public String modifyManagerPWD()throws Exception{
		System.out.println("manager:"+manager);
		System.out.println("newPWD:"+newManagerPassword);
		try {
			if(managerService.checkManagerByNameAndPWD(manager.getManagerName(), manager.getManagerPWD())==null)
				throw new ApplicationException("密码错误！");
			Manager oldManager=managerService.searchManagerByNo(manager.getManagerNo());
			oldManager.setManagerPWD(newManagerPassword);
			managerService.modifyManager(oldManager);
		} catch (ApplicationException e) {
			this.addActionError("输入旧密码错误");
			return "to_modifyPWD_page";
		}
		ServletActionContext.getRequest().getSession().removeAttribute("loginManager");
		ServletActionContext.getRequest().getSession().invalidate();
		ServletActionContext.getRequest().getSession().setAttribute("modifyPWDInfo", "密码修改完成！即将跳转到登陆界面");
		return "to_modify_info_page";
	}
	
	
	//去用户登陆界面
	public String toLoginUser()throws Exception{
		return "user_login_page";
	}
	
	//用户登陆
	public String userLogin() throws Exception{
		try {
			user=userService.checkUser(user.getUserName(), user.getUserPWD());
			ServletActionContext.getRequest().getSession().setAttribute("loginUser", user);
			
		} catch (ApplicationException e) {
			this.addActionError(e.getMessage());
			return "user_login_page";
		}
		return "to_reception_page";//前台
	}
	
	//用户登出
	public String userLogout() throws Exception{		
		ServletActionContext.getRequest().getSession().removeAttribute("loginUser");
		ServletActionContext.getRequest().getSession().invalidate();
		return "user_login_page";
	}
}
