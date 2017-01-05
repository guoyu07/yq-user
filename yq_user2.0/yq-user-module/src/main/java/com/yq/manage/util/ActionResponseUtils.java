package com.yq.manage.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ActionResponseUtils
{
  public static void writer(Object ob, PrintWriter out)
    throws IOException
  {
    out.print(ob);
  }
  public static void wirteAndEnd(Object ob, String charset, HttpServletResponse response) throws IOException {
    response.setContentType("text/html; charset=" + charset);
    PrintWriter out = response.getWriter();
    writer(ob, out);
    out.flush();
    out.close();
  }
  public static void wirteAndEnd(Object ob, HttpServletResponse response) throws IOException {
    wirteAndEnd(ob, "UTF-8", response);
  }

  public static void writer(Object ob, HttpServletResponse response) throws IOException {
    PrintWriter out = response.getWriter();
    writer(ob, out);
  }
}