package com.yq.vip.bean;

import java.util.Date;
   /**
    * user_performance 实体类
    */ 


public class UserPerformance{
	private Integer id;
	private String userName;
	private int sigleAllPerformance;
	private int sigleTimeAllPerformance;
	private int sigleTheSameuserAllPerformance;
	private int sigleTimeTheSameuserAllPerformance;
	private int fiveLeftPerformance;
	private int fiveLeftTimePerformance;
	private int fiveRightPerformance;
	private int fiveRightTimePerformance;
	private int allTimeLeftPerformance;
	private int allTimeRightPerformance;
	private int fu;
	private Date addTime;
	private int zaq;
	private int zbq;
	private int db;
	private int step;
	private String description;
	public void setId(Integer id){
	this.id=id;
	}
	public Integer getId(){
		return id;
	}
	public void setUserName(String userName){
	this.userName=userName;
	}
	public String getUserName(){
		return userName;
	}
	public void setSigleAllPerformance(int sigleAllPerformance){
	this.sigleAllPerformance=sigleAllPerformance;
	}
	public int getSigleAllPerformance(){
		return sigleAllPerformance;
	}
	public void setSigleTimeAllPerformance(int sigleTimeAllPerformance){
	this.sigleTimeAllPerformance=sigleTimeAllPerformance;
	}
	public int getSigleTimeAllPerformance(){
		return sigleTimeAllPerformance;
	}
	public void setFiveLeftPerformance(int fiveLeftPerformance){
	this.fiveLeftPerformance=fiveLeftPerformance;
	}
	public int getFiveLeftPerformance(){
		return fiveLeftPerformance;
	}
	public void setFiveLeftTimePerformance(int fiveLeftTimePerformance){
	this.fiveLeftTimePerformance=fiveLeftTimePerformance;
	}
	public int getFiveLeftTimePerformance(){
		return fiveLeftTimePerformance;
	}
	public void setFiveRightPerformance(int fiveRightPerformance){
	this.fiveRightPerformance=fiveRightPerformance;
	}
	public int getFiveRightPerformance(){
		return fiveRightPerformance;
	}
	public void setFiveRightTimePerformance(int fiveRightTimePerformance){
	this.fiveRightTimePerformance=fiveRightTimePerformance;
	}
	public int getFiveRightTimePerformance(){
		return fiveRightTimePerformance;
	}
	public void setAllTimeLeftPerformance(int allTimeLeftPerformance){
	this.allTimeLeftPerformance=allTimeLeftPerformance;
	}
	public int getAllTimeLeftPerformance(){
		return allTimeLeftPerformance;
	}
	public void setAllTimeRightPerformance(int allTimeRightPerformance){
	this.allTimeRightPerformance=allTimeRightPerformance;
	}
	public int getAllTimeRightPerformance(){
		return allTimeRightPerformance;
	}
	public void setFu(int fu){
	this.fu=fu;
	}
	public int getFu(){
		return fu;
	}
	public void setAddTime(Date addTime){
	this.addTime=addTime;
	}
	public Date getAddTime(){
		return addTime;
	}
	public int getZaq() {
		return zaq;
	}
	public void setZaq(int zaq) {
		this.zaq = zaq;
	}
	public int getZbq() {
		return zbq;
	}
	public void setZbq(int zbq) {
		this.zbq = zbq;
	}
	public int getDb() {
		return db;
	}
	public void setDb(int db) {
		this.db = db;
	}
	public int getSigleTheSameuserAllPerformance() {
		return sigleTheSameuserAllPerformance;
	}
	public void setSigleTheSameuserAllPerformance(int sigleTheSameuserAllPerformance) {
		this.sigleTheSameuserAllPerformance = sigleTheSameuserAllPerformance;
	}
	public int getSigleTimeTheSameuserAllPerformance() {
		return sigleTimeTheSameuserAllPerformance;
	}
	public void setSigleTimeTheSameuserAllPerformance(int sigleTimeTheSameuserAllPerformance) {
		this.sigleTimeTheSameuserAllPerformance = sigleTimeTheSameuserAllPerformance;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = this.description+"|"+description;
	}
	
	public void resetDescription(){
		this.description = "";
	}
}

