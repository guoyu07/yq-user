package com.yq.common.utils;

import java.io.InputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

//会员中心签名
public class SignUtils {
	
	//编码格式UTF-8
	public static final String CHARSET 			= "UTF-8";
	
	//private static Configuration merchantInfo	= null;
	//private static String merchantaccount		= "";
	//private static String merchantPrivateKey	= "";
	//private static String yeepayPublicKey		= "";
	
	static {
		//初始化merchantInfo
		//merchantInfo		= Configuration.getInstance(CONFIG_FILE_PATH);
		//从配置文件中获取商户编号
		//merchantaccount 	= merchantInfo.getValue("merchantaccount");
		//从配置文件中获取商户私钥
		//merchantPrivateKey 	= merchantInfo.getValue("merchantPrivateKey");
		//从配置文件中获取易宝公钥
		//yeepayPublicKey		= merchantInfo.getValue("yeepayPublicKey");
	}
	//获取请求地址
	/*public static String getRequestUrl(String apiName) {
		return merchantInfo.getValue(apiName);
	}*/
	
	//生成AESKey: 16位的随机串
	public static String buildAESKey() {
		return PayRandomUtil.getRandom(16);
	}
	
	//使用易宝公钥将AESKey加密生成encryptkey
	public static String buildEncryptkey(String AESKey, String publicKey) {
		String encryptkey	= "";
		try {
			encryptkey = RSA.encrypt(AESKey, publicKey);
		} catch(Exception e) {
			e.printStackTrace();
			return null;
		}
		return encryptkey;
	}
	
	//使用易宝公钥将AESKey加密生成encryptkey
	public static String buildEncyptkey(String AESKey, String easyPayPublicKey) {
		return buildEncryptkey(AESKey, easyPayPublicKey);
	}
	
	//生成RSA签名：sign
	public static String buildSign(TreeMap<String, Object> treeMap,String privateKey) {
		
		String sign				= "";
		StringBuffer buffer		= new StringBuffer();
		for (Map.Entry<String, Object> entry : treeMap.entrySet()) {
			buffer.append(entry.getValue());
		}
		String signTemp = buffer.toString();

		if (StringUtils.isNotEmpty(privateKey)) {
			sign = RSA.sign(signTemp, privateKey);
		}
		return sign;
	}
	
	//使用商户私钥生成RSA签名：sign
	/*public static String buildSign(TreeMap<String, Object> treeMap, String merchantPrivateKey) {
		return buildSign(treeMap, merchantPrivateKey);
	}*/

	//生成密文：data
	public static String buildData(TreeMap<String, Object> treeMap, String AESKey, String merchantaccount, String merchantPrivateKey) {
		
		String data 		= "";
		
		//将商户编号放入treeMap
		treeMap.put("appId", merchantaccount);
		
		//生成sign，并将其放入treeMap
		String sign			= buildSign(treeMap, merchantPrivateKey);
		treeMap.put("sign", sign);
		
		String jsonStr		= JSON.toJSONString(treeMap);
		data				= AES.encryptToBase64(jsonStr, AESKey);
		
		return data;
	}
	/*
	//一键支付post请求
	public static TreeMap<String, String> httpPost(String url, String merchantaccount, String data, String encryptkey) {
		
		TreeMap<String, String> result		= null;
		
		//请求参数为如下三者：merchantaccount、data、enrcyptkey
		Map<String, String> paramMap	= new HashMap<String, String>();
		paramMap.put("data", data);
		paramMap.put("encryptkey", encryptkey);
		paramMap.put("appId", merchantaccount);
		
		String responseBody	= HttpClient4Utils.sendHttpRequest(url, paramMap, CHARSET, true);
		if(StringUtils.isBlank(responseBody)){
			result = new TreeMap<String, String>();
			result.put("code", "-1");
			result.put("msg", "连接超时");
			return result;
		}
		System.out.println("响应主体： " + responseBody);
		result				= JSON.parseObject(responseBody, new TypeReference<TreeMap<String, String>>() {});
		
		return result;
	}
	
	public static String httpPostForString(String url, String merchantaccount, String data, String encryptkey) {
		
		TreeMap<String, String> result		= null;
		
		//请求参数为如下三者：merchantaccount、data、enrcyptkey
		Map<String, String> paramMap	= new HashMap<String, String>();
		paramMap.put("data", data);
		paramMap.put("encryptkey", encryptkey);
		paramMap.put("appId", merchantaccount);
		
		String responseBody	= HttpClient4Utils.sendHttpRequest(url, paramMap, CHARSET, true);
		return responseBody;
	}
	*/
/*	//get请求
	public static TreeMap<String, String> httpGet(String url, String merchantaccount, String data, String encryptkey) {
		
		TreeMap<String, String> result		= null;
		
		//请求参数为如下三者：merchantaccount、data、enrcyptkey
		Map<String, String> paramMap	= new HashMap<String, String>();
		paramMap.put("data", data);
		paramMap.put("encryptkey", encryptkey);
		paramMap.put("appId", merchantaccount);
		
		String responseBody	= HttpClient4Utils.sendHttpRequest(url, paramMap, CHARSET, false);
		result				= JSON.parseObject(responseBody, new TypeReference<TreeMap<String, String>>() {});
		
		return result;
	}*/
	
	//解密data，获得明文参数
	public static TreeMap<String, String> decrypt(String data, String encryptkey, String privateKey) {
		
		TreeMap<String, String> result	= null;
		
		//1.使用商户密钥解密encryptKey。
		String AESKey 	= "";
		try {
			AESKey = RSA.decrypt(encryptkey, privateKey);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}

		//2.使用AESKey解开data，取得明文参数；解密后格式为json
		String jsonStr	= AES.decryptFromBase64(data, AESKey);
		
		//3.将JSON格式数据转换成TreeMap格式
		result			= JSON.parseObject(jsonStr,new TypeReference<TreeMap<String, String>>() {});
		
		return result;
	}
	
	//解密data，获得明文参数
	/*public static TreeMap<String, String> decrypt(String data, String encryptkey, String merchantPrivateKey) {
		return decrypt(data, encryptkey, merchantPrivateKey);
	}*/
	//sign验签
	public static boolean checkSign(String params, String signYeepay, String publicKey) {
		return RSA.checkSign(params, signYeepay, publicKey);
	}
	
	// sign验签
	public static boolean checkSign(TreeMap<String, String> dataMap, String easyPayPublicKey) {

		//获取明文参数中的sign。
		String signYeepay	= StringUtils.trimToEmpty(dataMap.get("sign"));

		//将明文参数中sign之外的其他参数，拼接成字符串
		StringBuffer buffer	= new StringBuffer();
		for(Map.Entry<String, String> entry : dataMap.entrySet()) {
			String key		= formatStr(entry.getKey());
			String value	= formatStr(entry.getValue());
			if("sign".equals(key)) {
				continue;
			}
			buffer.append(value);
		}
		
		//result为true时表明验签通过
		boolean result = checkSign(buffer.toString(), signYeepay, easyPayPublicKey);

		return result;
	}
/*
	public static InputStream clearDataHttpGet(String url, String merchantaccount, String data, String encryptkey) {
		return ClearDataUtils.httpGet(url, merchantaccount, data, encryptkey);
	}*/
	
	/*//getter
	public static String getMerchantaccount() {
		return merchantaccount;
	}
	
	//getter
	public static String getMerchantPrivateKey() {
		return merchantPrivateKey;
	}
	
	//getter
	public static String getYeepayPublicKey() {
		return yeepayPublicKey;
	}*/
	
	//字符串格式化
	public static String formatStr(String text) {
		return (text == null) ? "" : text.trim();
	}

	//test
	public static void main(String[] args) {
	        
	}
	
}
