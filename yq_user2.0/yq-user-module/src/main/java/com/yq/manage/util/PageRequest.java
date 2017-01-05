package com.yq.manage.util;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;

public class PageRequest implements Serializable
{
	private static final long serialVersionUID = 1L;
  private int pageSize;
  private int pageNumber;
  private String sortingColumn;
  private String sortingDirection;
  private List<RequestParameter> params;
  private int start;
  private int limit;

  public PageRequest()
  {
    this.params = new ArrayList();
  }

  public PageRequest(int pageSize)
  {
    this.pageSize = pageSize;
  }

  public PageRequest(int pageSize, String sortingColumn, String sortingDirection)
  {
    this.pageSize = pageSize;
    this.sortingColumn = sortingColumn;
    this.sortingDirection = sortingDirection;
  }

  public int getStart()
  {
    this.start = ((this.pageNumber - 1) * this.pageSize);
    return this.start;
  }

  public int getLimit() {
    return this.pageSize;
  }

  public int getPageSize() {
    return this.pageSize;
  }

  public void setPageSize(int pageSize) {
    this.pageSize = pageSize;
  }

  public int getPageNumber() {
    return this.pageNumber;
  }

  public void setPageNumber(int pageNumber) {
    this.pageNumber = pageNumber;
  }

  public String getSortingColumn() {
    return this.sortingColumn;
  }

  public void setSortingColumn(String sortingColumn) {
    this.sortingColumn = sortingColumn;
  }

  public String getSortingDirection() {
    return this.sortingDirection;
  }

  public void setSortingDirection(String sortingDirection) {
    this.sortingDirection = sortingDirection;
  }

  public List<RequestParameter> getParams() {
    return this.params;
  }

  public void setParams(List<RequestParameter> params) {
    this.params = params;
  }

  public String getParameter(String key) {
    if (StringUtils.isNotEmpty(key)) {
      for (RequestParameter requestParameter : this.params) {
        if (key.equals(requestParameter.getKey())) {
          return requestParameter.getValue();
        }
      }
    }
    return "";
  }
}