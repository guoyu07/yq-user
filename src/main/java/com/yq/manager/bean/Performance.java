package com.yq.manager.bean;

import java.util.Date;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Queue;


public class Performance {
	private String userName;
	private int sjb;
	private int zaq;
	private int zbq;
	private Date bdbdate;
	private Performance left;
	private Performance right;
	private Performance parent;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getSjb() {
		return sjb;
	}
	public void setSjb(int sjb) {
		this.sjb = sjb;
	}
	public Date getBdbdate() {
		return bdbdate;
	}
	public void setBdbdate(Date bdbdate) {
		this.bdbdate = bdbdate;
	}
	
	public Performance getLeft() {
		return left;
	}
	public void setLeft(Performance left) {
		this.left = left;
	}
	public Performance getRight() {
		return right;
	}
	public void setRight(Performance right) {
		this.right = right;
	}
	public Performance getParent() {
		return parent;
	}
	public void setParent(Performance parent) {
		this.parent = parent;
	}
//	public int getMyAllPerformance(){
//		return count(this,0);
//	}
	
//	private int count(Performance performance,int count){
//		if(performance.downMap.size()>0){
//			for(Performance mapp:downMap.values()){
//				count += mapp.sjb;
//				if(mapp.downMap.size()>0){
//					count = count(mapp,count);
//				}
//			}
//		}
//		return count;
//	}
	private final static String END = "\n";
	public String getHtmlScript(){
		StringBuffer stringBuffer = new StringBuffer();
		stringBuffer.append("var nodeDataArray = [");
		stringBuffer.append(END);
		stringBuffer.append(getModelString(this.userName, "", this.toString()));
		stringBuffer.append(END);
		stringBuffer = script(this,stringBuffer);
		stringBuffer.append("];");
		stringBuffer.append(END);
		stringBuffer.append("myDiagram.model = new go.TreeModel(nodeDataArray);");
		stringBuffer.append(END);
		return stringBuffer.toString();
	}
	
	private static final String MODEL = "{ key:\"#K#\", parent:\"#P#\", name:\"#N#\",gender:\"M\"},";
	private static final String EMPTY = "{ key:\"#K#\", parent:\"#P#\", name:\"\",gender:\"F\"},";
	private String getModelString(String key,String parent,String name){
		String result =  MODEL.replace("#K#", key);
		result = result.replace("#P#", parent);
		result = result.replace("#N#", name);
		return result;
	}
	private String getEmptyModelString(String key,String parent){
		String result =  EMPTY.replace("#K#", key);
		result = result.replace("#P#", parent);
		return result;
	}
	
	private StringBuffer script(Performance performance,StringBuffer stringBuffer){
		if(performance.left!=null){
			String key = performance.left.getUserName();
			String parent = performance.getUserName();
			String name = performance.left.toString();
			stringBuffer.append(getModelString(key, parent, name));
			stringBuffer.append(END);
			script(performance.left,stringBuffer);
		}else{
			String key = performance.getUserName()+"_left_empty";
			String parent = performance.getUserName();
			stringBuffer.append(getEmptyModelString(key, parent));
			stringBuffer.append(END);
		}
		if(performance.right!=null){
			String key = performance.right.getUserName();
			String parent = performance.getUserName();
			String name = performance.right.toString();
			stringBuffer.append(getModelString(key, parent, name));
			stringBuffer.append(END);
			script(performance.right,stringBuffer);
		}else{
			String key = performance.getUserName()+"_right_empty";
			String parent = performance.getUserName();
			stringBuffer.append(getEmptyModelString(key, parent));
			stringBuffer.append(END);
		}
		return stringBuffer;
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
	
	 /*
     * 将树转换成字符串并打印在控制台上，用L表示左孩子，R表示右孩子
     */
    public void print() {
        List<Performance> tree = locateNodes();
        int size = tree.size(); //
        int deepth = 0;
        // 获取树的深度
        while ((size >>= 1) > 0) {
            deepth++;
        }
        deepth++;
        Iterator<Performance> iterator = tree.iterator();
        int maxPosition = 1;
        for (int floor = 1; floor <= deepth; floor++) { // 层数，从1开始
            maxPosition = 1 << (floor - 1);
            printBlank((1 << (deepth - floor)) - 1);
            for (int position = 0; position < maxPosition; position++) {
                if (iterator.hasNext()) {
                	Performance node = iterator.next();
                    if (node != null) {
                        System.out.print(node);
                    } else {
                        System.out.print(" ");
                    }
                    printBlank((1 << (deepth - floor + 1)) - 1);
                }
            }
            System.out.println();
        }
    }
    
    private List<Performance> locateNodes() {
        Queue<Performance> queue = new LinkedList<Performance>();
        List<Performance> tree = new LinkedList<Performance>(); // 把树补充成完全二叉树，放在这个链表中
        queue.add(this);
        Performance empty = null;
        int nodeCount = 1; // 队列中非空节点数
        while (queue.size() > 0 && nodeCount > 0) {
        	Performance node = queue.remove();
            if (node != null) {
                nodeCount--;
                tree.add(node);
                Performance left = node.left;
                Performance right = node.right;
                if (left == null) {
                    queue.add(empty);
                } else {
                    queue.add(left);
                    if (left != null) {
                        nodeCount++;
                    }
                }
                if (right == null) {
                    queue.add(empty);
                } else {
                    queue.add(right);
                    if (right != null) {
                        nodeCount++;
                    }
                }
            } else {
                tree.add(empty);
                queue.add(empty);
                queue.add(empty);
            }
        }
        return tree;
    }
    
    private void printBlank(int length) {
        while (length-- > 0) {
            System.out.print(" ");
        }
    }
    
    public List<Performance> allNodes(){
    	return locateNodes();
    } 
    
    @Override
    public String toString() {
        String result =  userName+"("+sjb+")";
//        if(parent!=null){
//        	result = result+"["+parent.userName+"]";
//        }
        return result;
    }
}
