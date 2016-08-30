package com.yq.common.utils;

import java.util.Hashtable;
import java.util.Locale;
import java.util.Map;
import java.util.ResourceBundle;

public class Locales {
    private Locale current;

    public void setCurrent(Locale cur) {
        this.current = cur;
    }

    public Map<String, Locale> getLocales() {
        Map<String, Locale> locales = new Hashtable<String, Locale>();
        if (current == null) current = java.util.Locale.US;
        ResourceBundle bundle = ResourceBundle.getBundle("messageResource", current);
        locales.put(bundle.getString("zhcn"), Locale.CHINA);
        locales.put(bundle.getString("usen"), Locale.US);
        locales.put(bundle.getString("vivn"), new Locale("vi_VN"));// 越南
        return locales;
    }
}
