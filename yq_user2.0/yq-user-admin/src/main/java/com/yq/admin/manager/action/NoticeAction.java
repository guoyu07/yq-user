package com.yq.admin.manager.action;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.exception.ServiceException;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Dgag;
import com.yq.user.service.ManagerService;

public class NoticeAction extends ALDAdminPageActionSupport<Dgag> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	/**
	 * 新闻列表
	 * @return
	 */
	public String showList(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }
		AdminService adminService = ServiceCacheFactory.getService(AdminService.class);
		super.initPage(adminService.getNoticePageList(super.getToPage(), 20));
		return SUCCESS;
	}
	
	private int noticeId;
	private Dgag dgag;
	public String showContent(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }

		ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
		dgag = managerService.getDgag(noticeId);
		return SUCCESS;
	}
	private int status;
	private String title;
	private String content;
	public String add(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }

		if(status==0){
			return SUCCESS;
		}
		if(Strings.isNullOrEmpty(title)){
			throw new ServiceException(1, "标题不能为空");
		}
		if(Strings.isNullOrEmpty(content)){
			throw new ServiceException(2, "内容不能为空");
		}
		ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
		managerService.addNotice(title, content);
		return "redirect";
	}
	
	private String ggdate;
	public String edit(){
        if(!super.getUserName().equals("admin1")){
            return INPUT;
        }

		if(status==0){
			ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
			dgag = managerService.getDgag(noticeId);
			return SUCCESS;
		}
		if(Strings.isNullOrEmpty(title)){
			throw new ServiceException(1, "标题不能为空");
		}
		if(Strings.isNullOrEmpty(content)){
			throw new ServiceException(2, "内容不能为空");
		}
		if(Strings.isNullOrEmpty(ggdate)){
			throw new ServiceException(3, "时间不能为空");
		}
		ManagerService managerService = ServiceCacheFactory.getService(ManagerService.class);
		managerService.editNotice(noticeId, title, content, ggdate);
		return "redirect";
	}

	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public Dgag getDgag() {
		return dgag;
	}

	public void setDgag(Dgag dgag) {
		this.dgag = dgag;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getGgdate() {
		return ggdate;
	}

	public void setGgdate(String ggdate) {
		this.ggdate = ggdate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
}
