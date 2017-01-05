package com.yq.user.bo;

import java.util.Date;
   /**
    * fcxt 实体类
    */ 


public class Fcxt{
	private int id;						//作为adminId,唯一值
	private String ncjud;
	private String adminusername;
	private String password;
	private double dqgj;
	private double jygj;				//交易价格	
	private long fsjygsl;
	private long syjygsl;
	private long jygsl;
	private long jy5w;
	private double zgj;
	private double zdj;
	private String lname;
	private int payadd;
	private Date jsdate;
	private String cz01;
	private String cz02;
	private String cz03;
	private String cz04;
	private String cz05;
	
	//为整合权限系统管理用户表所添加的字段
	private int            isOverdue;	//是否是海外用户
	private Date			  createDate;	//创建日期
	private String			  createName;	//创建者
	private Date			  updateDate;	//修改日期
	private String			  updateName;	//修改者
	private int				  staffId;		//职员id
	
	
	//是否涉及功能控制账号，设计目的：为不影响之前的功能模块，加入此判断
	private int function;					//用于区分整合前后功能与用户名的字段  0表示否，1表示是，如之前的admin1，admin2,admin5... 得须设值为：1
	
	private String 			  roleName;
	
	private String 			  fullName;
	
	public void setId(int id){
	this.id=id;
	}
	public int getId(){
		return id;
	}
	public void setNcjud(String ncjud){
	this.ncjud=ncjud;
	}
	public String getNcjud(){
		return ncjud;
	}
	public void setAdminusername(String adminusername){
	this.adminusername=adminusername;
	}
	public String getAdminusername(){
		return adminusername;
	}
	public void setPassword(String password){
	this.password=password;
	}
	public String getPassword(){
		return password;
	}
	public void setDqgj(double dqgj){
	this.dqgj=dqgj;
	}
	public double getDqgj(){
		return dqgj;
	}


	public double getJygj() {
		return jygj;
	}
	public void setJygj(double jygj) {
		this.jygj = jygj;
	}
	public long getFsjygsl() {
		return fsjygsl;
	}
	public void setFsjygsl(long fsjygsl) {
		this.fsjygsl = fsjygsl;
	}
	public long getSyjygsl() {
		return syjygsl;
	}
	public void setSyjygsl(long syjygsl) {
		this.syjygsl = syjygsl;
	}
	public long getJygsl() {
		return jygsl;
	}
	public void setJygsl(long jygsl) {
		this.jygsl = jygsl;
	}
	public long getJy5w() {
		return jy5w;
	}
	public void setJy5w(long jy5w) {
		this.jy5w = jy5w;
	}
	public void setZgj(double zgj){
	this.zgj=zgj;
	}
	public double getZgj(){
		return zgj;
	}
	public void setZdj(double zdj){
	this.zdj=zdj;
	}
	public double getZdj(){
		return zdj;
	}
	public void setLname(String lname){
	this.lname=lname;
	}
	public String getLname(){
		return lname;
	}
	public void setPayadd(int payadd){
	this.payadd=payadd;
	}
	public int getPayadd(){
		return payadd;
	}
	public void setJsdate(Date jsdate){
	this.jsdate=jsdate;
	}
	public Date getJsdate(){
		return jsdate;
	}
	public void setCz01(String cz01){
	this.cz01=cz01;
	}
	public String getCz01(){
		return cz01;
	}
	public void setCz02(String cz02){
	this.cz02=cz02;
	}
	public String getCz02(){
		return cz02;
	}
	public void setCz03(String cz03){
	this.cz03=cz03;
	}
	public String getCz03(){
		return cz03;
	}
	public void setCz04(String cz04){
	this.cz04=cz04;
	}
	public String getCz04(){
		return cz04;
	}
	public void setCz05(String cz05){
	this.cz05=cz05;
	}
	public String getCz05(){
		return cz05;
	}
	
	public int getIsOverdue() {
		return isOverdue;
	}
	public void setIsOverdue(int isOverdue) {
		this.isOverdue = isOverdue;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateName() {
		return createName;
	}
	public void setCreateName(String createName) {
		this.createName = createName;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateName() {
		return updateName;
	}
	public void setUpdateName(String updateName) {
		this.updateName = updateName;
	}
	public int getStaffId() {
		return staffId;
	}
	public void setStaffId(int staffId) {
		this.staffId = staffId;
	}
	public String getRoleName() {
		return roleName;
	}
	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}
	public String getFullName() {
		return fullName;
	}
	public void setFullName(String fullName) {
		this.fullName = fullName;
	}
	public int getFunction() {
		return function;
	}
	public void setFunction(int function) {
		this.function = function;
	}
	
	
}

