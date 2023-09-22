package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.Role;
import com.shixun.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/role"})
public class RoleController {
    @Autowired
    RoleService roleService;

    public RoleController() {
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(Role role) {
        String res = this.roleService.add(role);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.roleService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.roleService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getRoleById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getRoleById(Integer id) {
        String res = this.roleService.getRoleById(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(Role role) {
        String res = this.roleService.update(role);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/all"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String all() {
        String res = this.roleService.all();
        System.out.println(res);
        return res;
    }
}
