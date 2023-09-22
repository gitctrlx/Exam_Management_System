package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.Menu;
import com.shixun.service.MenuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/menu"})
public class MenuController {
    @Autowired
    MenuService menuService;

    public MenuController() {
    }

    @RequestMapping(
            value = {"/firstMenus"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String firstMenus() {
        String res = this.menuService.firstMenus();
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(Menu menu) {
        String res = this.menuService.add(menu);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.menuService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.menuService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getMenuById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getMenuById(Integer id) {
        String res = this.menuService.getMenuById(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(Menu menu) {
        String res = this.menuService.update(menu);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/all"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String all() {
        String res = this.menuService.all();
        System.out.println(res);
        return res;
    }
}
