package com.brsc.ecommerceSys.action;

import java.util.List;

import com.brsc.ecommerceSys.domain.Manager;
import com.brsc.ecommerceSys.exception.ApplicationException;
import com.brsc.ecommerceSys.helper.ManagerHelper;
import com.brsc.ecommerceSys.service.ManagerService;
import com.brsc.ecommerceSys.utils.Page;

public class ManagerAction extends BaseOfAction {

	private Manager manager=null;
	private List<Manager> managerList=null;
	private ManagerHelper managerHelper=new ManagerHelper();
	private Page page=new Page();
	private ManagerService managerService=null;
	
	public Manager getManager() {
		return manager;
	}
	public void setManager(Manager manager) {
		this.manager = manager;
	}
	public List<Manager> getManagerList() {
		return managerList;
	}
	public void setManagerList(List<Manager> managerList) {
		this.managerList = managerList;
	}
	public ManagerHelper getManagerHelper() {
		return managerHelper;
	}
	public void setManagerHelper(ManagerHelper managerHelper) {
		this.managerHelper = managerHelper;
	}
	public Page getPage() {
		return page;
	}
	public void setPage(Page page) {
		this.page = page;
	}
	public void setManagerService(ManagerService managerService) {
		this.managerService = managerService;
	}
	
	/**去输入界面*/
	public String toReg() throws Exception{
		return "to_reg_manager";
	}
	
	/**加载所有管理员*/
	public String loadManagers() throws Exception{
		System.out.println("managerHelper:"+managerHelper);
		page=managerService.loadPageOfManagers(managerHelper, page);
		return "to_list_manager";
	}
	
	/**创建manager*/
	public String createManager()throws Exception{
		try {
			managerService.addManager(manager);
		} catch (ApplicationException e) {
			this.addActionError("添加失败，请检查您的昵称，可能已经存在。");
			return "to_reg_manager";
		}
		return "to_list_manager";
	}
	
	/**删除管理员*/
	public String deleteManager()throws Exception{
		managerService.deleteManager(manager.getManagerNo());
		return "to_list_manager";
	}
	
	/**去修改页面*/
	public String toUpdateManager() throws Exception{
		
		manager=managerService.searchManagerByNo(manager.getManagerNo());
		
		return "to_update_page";
	}
	
	//修改管理员基本信息
	public String updateManager() throws Exception{
		Manager oldManager=managerService.searchManagerByNo(manager.getManagerNo());
		manager.setManagerPWD(oldManager.getManagerPWD());
		System.out.println("Modify manager:"+manager);
		managerService.modifyManager(manager);
		return "to_list_manager";
	}
	
	//修改管理员密码
	public String showManager() throws Exception{
		
		return "show_manager";
	}
}
