
package com.shixun.controller;

import com.shixun.common.JsGridData;
import com.shixun.entity.Major;
import com.shixun.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping({"/major"})
public class MajorController {
    @Autowired
    MajorService majorService;

    public MajorController() {
    }

    @RequestMapping(
            value = {"/getByFacultyId"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getByFacultyId(Integer facultyId) {
        String res = this.majorService.getByFacultyId(facultyId);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/getMajorById"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String getMajorById(Integer id) {
        String res = this.majorService.getMajorById(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/add"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String add(Major major) {
        String res = this.majorService.add(major);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/list"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String list(JsGridData jsGridData) {
        String res = this.majorService.list(jsGridData);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        String res = this.majorService.del(id);
        System.out.println(res);
        return res;
    }

    @RequestMapping(
            value = {"/update"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String update(Major major) {
        String res = this.majorService.update(major);
        System.out.println(res);
        return res;
    }
}
