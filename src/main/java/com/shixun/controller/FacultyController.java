package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.Faculty;
import com.shixun.service.FacultyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/faculty"})
public class FacultyController {
    @Autowired
    FacultyService facultyService;

    public FacultyController() {
    }

    @RequestMapping(
            value = {"/all"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String all() {
        String res = this.facultyService.all();
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.facultyService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(Faculty faculty) {
        String res = this.facultyService.add(faculty);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getFacultyById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getFacultyById(Integer id) {
        String res = this.facultyService.getFacultyById(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.facultyService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(Faculty faculty) {
        String res = this.facultyService.update(faculty);
        System.out.println(res);
        return res;
    }
}
