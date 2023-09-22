package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.Class;
import com.shixun.service.ClassService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/class"})
public class ClassController {
    @Autowired
    ClassService classService;

    public ClassController() {
    }

    @RequestMapping(
            value = {"/getByMajorId"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getByMajorId(Integer majorId) {
        String res = this.classService.getByMajorId(majorId);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getClassById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getClassById(Integer Id) {
        String res = this.classService.getClassById(Id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(Class c_lass) {
        String res = this.classService.add(c_lass);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.classService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.classService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(Class c_lass) {
        String res = this.classService.update(c_lass);
        System.out.println(res);
        return res;
    }
}
