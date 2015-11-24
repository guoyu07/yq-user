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
import com.sr178.common.jdbc.bean.IPage;
import com.sr178.game.framework.context.ServiceCacheFactory;
import com.sr178.game.framework.log.LogSystem;
import com.yq.common.action.ALDAdminPageActionSupport;
import com.yq.common.utils.ExportExcel;
import com.yq.common.utils.FileCreatUtil;
import com.yq.user.bo.Datepay;
import com.yq.user.service.LogService;

public class AdminDatePayAction extends ALDAdminPageActionSupport<Datepay> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer beizhu;
	
	public String execute(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		
		IPage<Datepay> page = logService.getAdminDatePayListPage((beizhu==null||beizhu==0)?null:beizhu, super.getToPage(), 50);
		
		super.initPage(page);
		
		return SUCCESS;
	}

	private String zuser;
	private String startDate1;
	private String endDate1;
	public String datepayByDateAndUserName(){
		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);
		super.initPage(logService.getAdminDatePayListPageByUserNameAndDate(zuser, queryStartDate, queryEndDatet,(beizhu==null||beizhu==0)?null:beizhu, super.getToPage(), 30));
		return SUCCESS;
	}
	
	
	public String outDpExcel(){
		LogService logService = ServiceCacheFactory.getServiceCache().getService(LogService.class);

		String queryStartDate = null;
		String queryEndDatet = null;
		if(!Strings.isNullOrEmpty(startDate1)&&!Strings.isNullOrEmpty(endDate1)){
			queryStartDate = startDate1+" 00:00:00";
			queryEndDatet = endDate1 + " 23:59:59";
		}
		HttpServletResponse response = ServletActionContext.getResponse();
		ExportExcel<Datepay> export = new ExportExcel<Datepay>();
		String path = ServletActionContext.getServletContext().getRealPath("/");
		String descDirectoryPath = path + "/temp/"+zuser+"-yb.xls";
		
		String[] headers =
		{ "id", "会员名", "一币收入", "一币支出", "金币收入","金币支出","zff","剩余一币", "剩余金币", "更新时间","备注","kjqi","bz","newbz","txbz"};
		List<Datepay> data = logService.getAdminDatePayLisByUserNameAndDate(zuser, queryStartDate, queryEndDatet,(beizhu==null||beizhu==0)?null:beizhu);
		try
		{
			File file = FileCreatUtil.creatNewFile(descDirectoryPath);
			OutputStream out = new FileOutputStream(file);
			export.exportExcel("用户"+zuser+"的一币和金币明细",headers, data, out,"yyyy-MM-dd hh:mm:ss");
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
	public Integer getBeizhu() {
		return beizhu;
	}

	public void setBeizhu(Integer beizhu) {
		this.beizhu = beizhu;
	}
	
	
	
}
