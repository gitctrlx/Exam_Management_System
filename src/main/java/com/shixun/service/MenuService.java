//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.Menu;

public interface MenuService {
    String firstMenus();

    String add(Menu menu);

    String list(JsGridData jsGridData);

    String del(Integer id);

    String getMenuById(Integer id);

    String update(Menu menu);

    String all();
}
