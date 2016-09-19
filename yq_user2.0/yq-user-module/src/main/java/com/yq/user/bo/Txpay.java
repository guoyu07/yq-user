package com.yq.user.bo;

import java.util.Date;
   /**
    * txpay 实体类
    */ 


public class Txpay{
	private int payid;
	private int jyid;
	private int pdid;
	private String payusername;
	private int cxt;
	private String vipname;
	private int paynum;
	private int paynum9;
	private String payname;
	private String paybank;
	private String paycard;
	private Integer dqu;
	private String bankbz;
	private Date paytime;
	private Date zftime;
	private String openonoff;
	private int ep;
	private Date rgdate;
	private String dfuser;
	private int kjygid;
	private String bz;
	private int qlid;
	private String payonoff;
	private String txip;
	private String clip;
	private int txlb;
	private int txvip;
	private int tp;
	public void setPayid(int payid){
	this.payid=payid;
	}
	public int getPayid(){
		return payid;
	}
	public void setJyid(int jyid){
	this.jyid=jyid;
	}
	public int getJyid(){
		return jyid;
	}
	public void setPdid(int pdid){
	this.pdid=pdid;
	}
	public int getPdid(){
		return pdid;
	}
	public void setPayusername(String payusername){
	this.payusername=payusername;
	}
	public String getPayusername(){
		return payusername;
	}
	public void setCxt(int cxt){
	this.cxt=cxt;
	}
	public int getCxt(){
		return cxt;
	}
	public void setVipname(String vipname){
	this.vipname=vipname;
	}
	public String getVipname(){
		return vipname;
	}
	public void setPaynum(int paynum){
	this.paynum=paynum;
	}
	public int getPaynum(){
		return paynum;
	}
	public void setPaynum9(int paynum9){
	this.paynum9=paynum9;
	}
	public int getPaynum9(){
		return paynum9;
	}
	public void setPayname(String payname){
	this.payname=payname;
	}
	public String getPayname(){
		return payname;
	}
	public void setPaybank(String paybank){
	this.paybank=paybank;
	}
	public String getPaybank(){
		return paybank;
	}
	public void setPaycard(String paycard){
	this.paycard=paycard;
	}
	public String getPaycard(){
		return paycard;
	}
	public void setDqu(Integer dqu){
	this.dqu=dqu;
	}
	public Integer getDqu(){
		return dqu;
	}
	public void setBankbz(String bankbz){
	this.bankbz=bankbz;
	}
	public String getBankbz(){
		return bankbz;
	}
	public void setPaytime(Date paytime){
	this.paytime=paytime;
	}
	public Date getPaytime(){
		return paytime;
	}
	public void setZftime(Date zftime){
	this.zftime=zftime;
	}
	public Date getZftime(){
		return zftime;
	}
	public void setOpenonoff(String openonoff){
	this.openonoff=openonoff;
	}
	public String getOpenonoff(){
		return openonoff;
	}
	public void setEp(int ep){
	this.ep=ep;
	}
	public int getEp(){
		return ep;
	}
	public void setRgdate(Date rgdate){
	this.rgdate=rgdate;
	}
	public Date getRgdate(){
		return rgdate;
	}
	public void setDfuser(String dfuser){
	this.dfuser=dfuser;
	}
	public String getDfuser(){
		return dfuser;
	}
	public void setKjygid(int kjygid){
	this.kjygid=kjygid;
	}
	public int getKjygid(){
		return kjygid;
	}
	public void setBz(String bz){
	this.bz=bz;
	}
	public String getBz(){
		return bz;
	}
	public void setQlid(int qlid){
	this.qlid=qlid;
	}
	public int getQlid(){
		return qlid;
	}
	public void setPayonoff(String payonoff){
	this.payonoff=payonoff;
	}
	public String getPayonoff(){
		return payonoff;
	}
	public void setTxip(String txip){
	this.txip=txip;
	}
	public String getTxip(){
		return txip;
	}
	public void setClip(String clip){
	this.clip=clip;
	}
	public String getClip(){
		return clip;
	}
	public void setTxlb(int txlb){
	this.txlb=txlb;
	}
	public int getTxlb(){
		return txlb;
	}
	public void setTxvip(int txvip){
	this.txvip=txvip;
	}
	public int getTxvip(){
		return txvip;
	}
	public String getSimplePayid(){
		String str = String.valueOf(payid);
		if(payid<100){
			return str;
		}else{
			int lenght = str.length();
			return str.substring(lenght-2, lenght);
		}
	}
	public int getTp() {
		return tp;
	}
	public void setTp(int tp) {
		this.tp = tp;
	}
	@Override
	public String toString() {
		return "Txpay [payid=" + payid + ", jyid=" + jyid + ", pdid=" + pdid + ", payusername=" + payusername + ", cxt="
				+ cxt + ", vipname=" + vipname + ", paynum=" + paynum + ", paynum9=" + paynum9 + ", payname=" + payname
				+ ", paybank=" + paybank + ", paycard=" + paycard + ", dqu=" + dqu + ", bankbz=" + bankbz + ", paytime="
				+ paytime + ", zftime=" + zftime + ", openonoff=" + openonoff + ", ep=" + ep + ", rgdate=" + rgdate
				+ ", dfuser=" + dfuser + ", kjygid=" + kjygid + ", bz=" + bz + ", qlid=" + qlid + ", payonoff="
				+ payonoff + ", txip=" + txip + ", clip=" + clip + ", txlb=" + txlb + ", txvip=" + txvip + ", tp=" + tp
				+ "]";
	}
}

