package com.yq.manage.util;

/**
 * @author 作者: HuHua
 * @version 2016年12月22日
 * 类说明  ajax结果返回
 */
public class AjaxResult{
  private boolean success; //是否成功
  private boolean failure; //是否失败
  private String info;	   //自定义信息提示	
  private Object data;	   //返回对象

  public boolean isFailure()
  {
    return this.failure;
  }

  public void setFailure(boolean failure) {
    this.failure = failure;
    this.success = (!failure);
  }

  public String getInfo() {
    return this.info;
  }

  public void setInfo(String info) {
    this.info = info;
  }

  public boolean isSuccess() {
    return this.success;
  }

  public void setSuccess(boolean success) {
    this.success = success;
    this.failure = (!success);
  }

  public Object getData() {
    return this.data;
  }

  public void setData(Object data) {
    this.data = data;
  }
}