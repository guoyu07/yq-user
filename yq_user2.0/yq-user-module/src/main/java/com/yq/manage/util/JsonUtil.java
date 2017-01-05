package com.yq.manage.util;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class JsonUtil
{
  public static JSONObject parseObjectToJSONObject(Object obj)
  {
    JSONObject jsonObject = JSONObject.fromObject(obj);
    return jsonObject;
  }

  public static JSONArray parseArrayToJsonText(Object[] objs)
  {
    JSONArray jsonArray = JSONArray.fromObject(objs);
    return jsonArray;
  }

  public static JSONArray parseJsonTextToArray(String text)
  {
    JSONArray jsonArray = JSONArray.fromObject(text);
    return jsonArray;
  }

  public static JSONArray parseListToJsonText(List list)
  {
    JSONArray jsonArray = JSONArray.fromObject(list);
    return jsonArray;
  }

  public static JSONObject parseMapToJsonText(Map map)
  {
    JSONObject json = JSONObject.fromObject(map);
    return json;
  }

  public static Object format(String json, Class c)
  {
    JSONObject jb = JSONObject.fromObject(json);//fromString(json);
    return JSONObject.toBean(jb, c);
  }

  public static void outJson(Object obj, HttpServletResponse response)
  {
    if (obj == null)
      return;
    String result = null;
    if ((obj instanceof List))
      result = parseListToJsonText((List)obj).toString();
    else if ((obj instanceof Map))
      result = parseMapToJsonText((Map)obj).toString();
    else
      result = parseObjectToJSONObject(obj).toString();
    try
    {
      ActionResponseUtils.wirteAndEnd(result, response);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }


}