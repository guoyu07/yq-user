package com.yq.manage.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class PageResponse<E> implements Serializable
{
  private static final long serialVersionUID = 1L;
  private List<E> list;
  private static int DEFAULT_PAGE_SIZE = 5;

  private int pageSize = DEFAULT_PAGE_SIZE;
  private int start;
  private Object data;
  private long totalCount;
  private int count;
  private String href;

  public PageResponse(int totalCount, List<E> list)
  {
    this.totalCount = totalCount;
    this.list = list;
  }

  public PageResponse()
  {
    this.totalCount = 0L;
    this.list = new ArrayList<E>();
  }

  public PageResponse(PageRequest pageRequest)
  {
    this.totalCount = 0L;
    this.list = new ArrayList<E>();
  }

  public long getTotalCount() {
    return this.totalCount;
  }

  public void setTotalCount(long totalCount) {
    this.totalCount = totalCount;
  }

  public List<E> getList() {
    return this.list;
  }

  public void setList(List<E> list) {
    this.list = list;
  }

  public String toString()
  {
    return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
  }

  public String getHref()
  {
    return this.href;
  }

  public void setHref(String href) {
    this.href = href;
  }

  public int getTotalPageCount()
  {
    if (this.totalCount % this.pageSize == 0L) {
      return (int)this.totalCount / this.pageSize;
    }
    return (int)this.totalCount / this.pageSize + 1;
  }

  public int getPageSize()
  {
    return this.pageSize;
  }

  public Object getResult()
  {
    return this.data;
  }

  public void setResult(Object obj)
  {
    this.data = obj;
  }

  public int getCurrentPageNo()
  {
    return this.start / this.pageSize + 1;
  }

  public boolean hasNextPage()
  {
    return getCurrentPageNo() < getTotalPageCount() - 1;
  }

  public boolean hasPreviousPage()
  {
    return getCurrentPageNo() > 1;
  }

  protected static int getStartOfPage(int pageNo)
  {
    return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
  }

  public static int getStartOfPage(int pageNo, int pageSize)
  {
    return (pageNo - 1) * pageSize;
  }

  public int getCount() {
    return this.count;
  }

  public void setCount(int count) {
    this.count = count;
  }

  public int getStart()
  {
    return this.start;
  }

  public void setStart(int start) {
    this.start = start;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }
}