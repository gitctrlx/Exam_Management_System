//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.Menu;
import com.shixun.mapper.MenuMapper;
import com.shixun.service.MenuService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MenuServiceImpl implements MenuService {
    @Autowired
    MenuMapper menuMapper;

    public MenuServiceImpl() {
    }

    public String firstMenus() {
        List<Menu> menuList = this.menuMapper.firstMenus();
        return JSONObject.toJSONString(menuList);
    }

    public String add(Menu menu) {
        int i = this.menuMapper.insertSelective(menu);
        Message message = new Message("999");
        if (i > 0) {
            message.setCode("200");
        }

        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<Menu> menus = this.menuMapper.list(jsGridData);
        Long count = this.menuMapper.count(jsGridData);
        jsGridData.setData(menus);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }

    public String del(Integer id) {
        int i = this.menuMapper.deleteByPrimaryKey(id);
        Message message = new Message("999");
        if (i > 0) {
            message.setCode("200");
        }

        return JSONObject.toJSONString(message);
    }

    public String getMenuById(Integer id) {
        Menu menu = this.menuMapper.selectByPrimaryKey(id);
        return JSONObject.toJSONString(menu);
    }

    public String update(Menu menu) {
        int i = this.menuMapper.updateByPrimaryKeySelective(menu);
        Message message = new Message("999");
        if (i > 0) {
            message.setCode("200");
        }

        return JSONObject.toJSONString(message);
    }

    public String all() {
        List<Menu> menus = this.menuMapper.all();
        return JSONObject.toJSONString(menus);
    }
}
