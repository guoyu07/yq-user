


import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.Date;
import java.util.Map;

import com.sr178.common.jdbc.BeanToSQL;
import com.sr178.common.jdbc.util.SqlUtil;
import com.yq.user.bo.Datepay;

public class GenEntityMysql {
	
	private String packageOutPath = "com.yq.agent.bo";//指定实体生成所在包的路径
	private String[] colnames; // 列名数组
	private String[] colTypes; //列名类型数组
	private int[] colSizes; //列名大小数组
	private boolean f_util = false; // 是否需要导入包java.util.*
	private boolean f_sql = false; // 是否需要导入包java.sql.*
    
    //数据库连接
	private static final String URL ="jdbc:mysql://localhost:3306/yq_user";
	private static final String NAME = "yquser";
	private static final String PASS = "yquser@123";
	private static final String DRIVER ="com.mysql.jdbc.Driver";
	/*
	 * 构造函数
	 */
	public GenEntityMysql(String tableName){
    	//创建连接
    	Connection con;
		//查要生成实体类的表
    	String sql = "select * from " + tableName;
    	PreparedStatement pStemt = null;
    	try {
    		try {
				Class.forName(DRIVER);
			} catch (ClassNotFoundException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
    		con = DriverManager.getConnection(URL,NAME,PASS);
			pStemt = con.prepareStatement(sql);
			ResultSetMetaData rsmd = pStemt.getMetaData();
			int size = rsmd.getColumnCount();	//统计列
			colnames = new String[size];
			colTypes = new String[size];
			colSizes = new int[size];
			for (int i = 0; i < size; i++) {
				colnames[i] = rsmd.getColumnName(i + 1);
				colTypes[i] = rsmd.getColumnTypeName(i + 1);
				
				if(colTypes[i].equalsIgnoreCase("datetime")||colTypes[i].equalsIgnoreCase("date")){
					f_util = true;
				}
				if(colTypes[i].equalsIgnoreCase("image") || colTypes[i].equalsIgnoreCase("text")){
					f_sql = true;
				}
				colSizes[i] = rsmd.getColumnDisplaySize(i + 1);
			}
			
			String content = parse(colnames,colTypes,colSizes,tableName);
			
			try {
				File directory = new File("");
				//System.out.println("绝对路径："+directory.getAbsolutePath());
				//System.out.println("相对路径："+directory.getCanonicalPath());
				String path=this.getClass().getResource("").getPath();
				
				System.out.println(path);
//				System.out.println("src/?/"+path.substring(path.lastIndexOf("/com/", path.length())) );
//				String outputPath = directory.getAbsolutePath()+ "/src/"+path.substring(path.lastIndexOf("/com/", path.length()), path.length()) + initcap(tablename) + ".java";
				String outputPath = directory.getAbsolutePath()+ "/src/main/java/"+this.packageOutPath.replace(".", "/")+"/"+initcap(colNameToFieldName(tableName)) + ".java";
				FileWriter fw = new FileWriter(outputPath);
				PrintWriter pw = new PrintWriter(fw);
				pw.println(content);
				pw.flush();
				pw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
//			try {
//				con.close();
//			} catch (SQLException e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
		}
    }

	/**
	 * 功能：生成实体类主体代码
	 * @param colnames
	 * @param colTypes
	 * @param colSizes
	 * @return
	 */
	private String parse(String[] colnames, String[] colTypes, int[] colSizes,String tableName) {
		StringBuffer sb = new StringBuffer();
		sb.append("package " + this.packageOutPath + ";\r\n");
		sb.append("\r\n");
		//判断是否导入工具包
		if(f_util){
			sb.append("import java.util.Date;\r\n");
		}
		if(f_sql){
			sb.append("import java.sql.*;\r\n");
		}

		//注释部分
		sb.append("   /**\r\n");
		sb.append("    * "+tableName+" 实体类\r\n");
		sb.append("    */ \r\n");
		//实体部分
		sb.append("\r\n\r\npublic class " + initcap(colNameToFieldName(tableName)) + "{\r\n");
		processAllAttrs(sb);//属性
		processAllMethod(sb);//get set方法
		sb.append("}\r\n");
		
    	//System.out.println(sb.toString());
		return sb.toString();
	}
	
	/**
	 * 功能：生成所有属性
	 * @param sb
	 */
	private void processAllAttrs(StringBuffer sb) {
		
		for (int i = 0; i < colnames.length; i++) {
			sb.append("\tprivate " + sqlType2JavaType(colTypes[i]) + " " + colNameToFieldName(colnames[i]) + ";\r\n");
		}
		
	}

	private String colNameToFieldName(String colName){
		 String result = "";
		 String[] array = colName.split("_");
		 if(array.length>1){
			 result = result+array[0];
			 for(int i=1;i<array.length;i++){
				 result = result + array[i].substring(0, 1).toUpperCase() + array[i].substring(1, array[i].length());
			 }
		 }else{
			 result = colName;
		 }
		 return result;
	}
	/**
	 * 功能：生成所有方法
	 * @param sb
	 */
	private void processAllMethod(StringBuffer sb) {
		
		for (int i = 0; i < colnames.length; i++) {
			sb.append("\tpublic void set" + initcap(colNameToFieldName(colnames[i])) + "(" + sqlType2JavaType(colTypes[i]) + " " + 
					colNameToFieldName(colnames[i]) + "){\r\n");
			sb.append("\tthis." + colNameToFieldName(colnames[i]) + "=" + colNameToFieldName(colnames[i]) + ";\r\n");
			sb.append("\t}\r\n");
			sb.append("\tpublic " + sqlType2JavaType(colTypes[i]) + " get" + initcap(colNameToFieldName(colnames[i])) + "(){\r\n");
			sb.append("\t\treturn " + colNameToFieldName(colnames[i]) + ";\r\n");
			sb.append("\t}\r\n");
		}
		
	}
	
	/**
	 * 功能：将输入字符串的首字母改成大写
	 * @param str
	 * @return
	 */
	private String initcap(String str) {
		
		char[] ch = str.toCharArray();
		if(ch[0] >= 'a' && ch[0] <= 'z'){
			ch[0] = (char)(ch[0] - 32);
		}
		
		return new String(ch);
	}

	/**
	 * 功能：获得列的数据类型
	 * @param sqlType
	 * @return
	 */
	private String sqlType2JavaType(String sqlType) {
		
		if(sqlType.equalsIgnoreCase("bit")){
			return "boolean";
		}else if(sqlType.equalsIgnoreCase("tinyint")){
			return "byte";
		}else if(sqlType.equalsIgnoreCase("smallint")){
			return "short";
		}else if(sqlType.equalsIgnoreCase("int")){
			return "int";
		}else if(sqlType.equalsIgnoreCase("bigint")){
			return "long";
		}else if(sqlType.equalsIgnoreCase("float")){
			return "float";
		}else if(sqlType.equalsIgnoreCase("decimal") || sqlType.equalsIgnoreCase("numeric") 
				|| sqlType.equalsIgnoreCase("real") || sqlType.equalsIgnoreCase("money") 
				|| sqlType.equalsIgnoreCase("smallmoney")){
			return "double";
		}else if(sqlType.equalsIgnoreCase("varchar") || sqlType.equalsIgnoreCase("char") 
				|| sqlType.equalsIgnoreCase("nvarchar") || sqlType.equalsIgnoreCase("nchar") 
				|| sqlType.equalsIgnoreCase("text")){
			return "String";
		}else if(sqlType.equalsIgnoreCase("datetime")||sqlType.equalsIgnoreCase("date")){
			return "Date";
		}else if(sqlType.equalsIgnoreCase("image")){
			return "Blod";
		}
		
		return null;
	}
	
	/**
	 * 出口
	 * TODO
	 * @param args
	 */
	public static void main(String[] args) {
		String[] tableNames = new String[]{"agent_order"};//表名
		for(int i=0;i<tableNames.length;i++){
			new GenEntityMysql(tableNames[i]);
		}
//		generatorInsertSql();
		
	}
	
	
	public static void generatorInsertSql(){
		Datepay datePay = new Datepay();
		datePay.setUsername("zp8888a");
		datePay.setSyjz(2000);
		datePay.setPay(2503);
		datePay.setJydb(0);
		datePay.setRegid("撤销卖出");
		datePay.setNewbz(3);
		datePay.setTxbz(1); 
		datePay.setAbdate(new Date());
		BeanToSQL beanSql = SqlUtil.createBeanSql(datePay);
		System.out.println(beanSql.getSql());
		 Map<Integer, Object> params = beanSql.getParams().getParams();
		for(int i=1;i<=params.size();i++){
			Object o = params.get(i);
			if(o instanceof String){
				
			}
//			String sql = beanSql.getSql().replace("?", );
		}
		
// 		return this.update(beanSql.getSql(), beanSql.getParams());
	}

}