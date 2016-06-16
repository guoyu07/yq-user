package com.yq.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
public class MD5Security {
	private final static char[] hexDigits = { '0', '1', '2', '3', '4', '5',
			'6', '7', '8', '9', 'A', 'B', 'C', 'D', 'E', 'F' };
	private static String bytesToHex(byte[] bytes) {
		StringBuffer sb = new StringBuffer();
		int t;
		for (int i = 0; i < 16; i++) {
			t = bytes[i];
			if (t < 0)
				t += 256;
			sb.append(hexDigits[(t >>> 4)]);
			sb.append(hexDigits[(t % 16)]);
		}
		return sb.toString();
	}
	public static String md5(String input) throws Exception {
		return code(input, 16);
	}
	public static String code(String input, int bit) throws Exception {
		try {
			MessageDigest md = MessageDigest.getInstance(System.getProperty(
					"MD5.algorithm", "MD5"));
			if (bit == 16)
				return bytesToHex(md.digest(input.getBytes("utf-8")))
						.substring(8, 24);
			return bytesToHex(md.digest(input.getBytes("utf-8")));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			throw new Exception("Could not found MD5 algorithm.", e);
		}
	}
	public static String md5_3(String b) throws Exception{
		MessageDigest md = MessageDigest.getInstance(System.getProperty(
				"MD5.algorithm", "MD5"));
		byte[] a = md.digest(b.getBytes());
		a = md.digest(a);
		a = md.digest(a);
		
		return bytesToHex(a);
	}
	
	public static String md5_16(String str){
		try {
			return code(str,16).toLowerCase();
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println("admin1  =="+MD5Security.md5_16("adm15payxt"));
		System.out.println("admin2(原来的admin)  =="+MD5Security.md5_16("gcgl06ok"));
		System.out.println("admin3  =="+MD5Security.md5_16("syyk365xc"));
		System.out.println("admin4  =="+MD5Security.md5_16("jkoi43ia"));
		System.out.println("admin5  =="+MD5Security.md5_16("ykoj50un"));
		System.out.println("cfhkf01  =="+MD5Security.md5_16("jsz69aak"));
		System.out.println("cfhkf02  =="+MD5Security.md5_16("zggl65sk"));
		System.out.println("root  =="+MD5Security.md5_16("252493618"));
		System.out.println("sam  =="+MD5Security.md5_16("mcdogdog"));
		System.out.println("tomcat  =="+MD5Security.md5_16("tomcat"));
		System.out.println("tomcat  =="+MD5Security.md5_16("www.abc123.com"));
	}
}

