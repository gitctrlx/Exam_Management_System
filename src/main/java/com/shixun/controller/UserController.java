package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.User;
import com.shixun.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/user"})
public class UserController {
    @Autowired
    UserService userService;

    public UserController() {
    }

    @RequestMapping(
            value = {"/login"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String login(User user) {
        System.out.println(user.getUsername() + ", " + user.getPassword());
        String res = this.userService.login(user);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(User user) {
        String res = this.userService.add(user);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.userService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.userService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getUserById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getUserById(Integer id) {
        String res = this.userService.getUserById(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(User user) {
        String res = this.userService.update(user);
        System.out.println(res);
        return res;
    }
}
