package com.yq.manager.action;


import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.google.common.base.Strings;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.ExportExcel;
import com.yq.common.utils.FileCreatUtil;
import com.yq.manager.service.AdminService;
import com.yq.user.bo.Bdbdate;

public class BdbDateAction extends ALDAdminPageActionSupport<Bdbdate> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public String execute(){
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getBdbdatePageList(super.getToPage(), 30));
		return SUCCESS;
	}

	private String zuser;
	private String startDate1;
	private String endDate1;
	public String bdbdateByDateAndUserName(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		super.initPage(ServiceCacheFactory.getService(AdminService.class).getBdbdatePageListByUserNameAndDate(zuser, queryStartDate, queryEndDatet, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String outExcel(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		ExportExcel<Bdbdate> export = new ExportExcel<Bdbdate>();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-bdb.xls";
		
		String[] headers =
		{ "id", "会员名", "报单币收入", "报单币支出", "剩余报单币","累积","左总计", "右总计", "左结余", "右结余", "更新时间","备注" };
		List<Bdbdate> data = ServiceCacheFactory.getService(AdminService.class).getBdbdateListByUserNameAndDate(zuser, queryStartDate, queryEndDatet);
		try
		{
			File file = FileCreatUtil.creatNewFile(descDirectoryPath);
			OutputStream out = new FileOutputStream(file);
			export.exportExcel("用户"+zuser+"的报单币明细",headers, data, out,"yyyy-MM-dd hh:mm:ss");
			out.close();
			LogSystem.info(zuser+"excel导出成功！");
		}
		catch (FileNotFoundException e)
		{
			LogSystem.error(e, "");
		}
		catch (IOException e)
		{
			LogSystem.error(e, "");
		}
		download(descDirectoryPath, response);
		return null;
	}
	
	private void download(String path, HttpServletResponse response) {  
        try {  
            // path是指欲下载的文件的路径。  
            File file = new File(path);  
            // 取得文件名。  
            String filename = file.getName();  
            // 以流的形式下载文件。  
            InputStream fis = new BufferedInputStream(new FileInputStream(path));  
            byte[] buffer = new byte[fis.available()];  
            fis.read(buffer);  
            fis.close();  
            // 清空response  
            response.reset();  
            // 设置response的Header  
            response.addHeader("Content-Disposition", "attachment;filename="  
                    + new String(filename.getBytes()));  
            response.addHeader("Content-Length", "" + file.length());  
            OutputStream toClient = new BufferedOutputStream(  
                    response.getOutputStream());  
            response.setContentType("application/vnd.ms-excel;charset=utf-8");  
            toClient.write(buffer);  
            toClient.flush();  
            toClient.close();  
        } catch (IOException ex) {  
            ex.printStackTrace();  
        }  
    }  
	public String getZuser() {
		return zuser;
	}
	public void setZuser(String zuser) {
		this.zuser = zuser;
	}
	public String getStartDate1() {
		return startDate1;
	}
	public void setStartDate1(String startDate1) {
		this.startDate1 = startDate1;
	}
	public String getEndDate1() {
		return endDate1;
	}
	public void setEndDate1(String endDate1) {
		this.endDate1 = endDate1;
	}
	
}
