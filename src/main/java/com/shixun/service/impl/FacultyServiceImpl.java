//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.Faculty;
import com.shixun.entity.Major;
import com.shixun.mapper.FacultyMapper;
import com.shixun.service.FacultyService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Transactional
@Service
public class FacultyServiceImpl implements FacultyService {
    @Autowired
    FacultyMapper facultyMapper;

    public FacultyServiceImpl() {
    }

    public String all() {
        List<Faculty> faculties = this.facultyMapper.all();
        return JSONObject.toJSONString(faculties);
    }

    public String add(Faculty faculty) {
        this.facultyMapper.insertSelective(faculty);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<Major> majors = this.facultyMapper.list(jsGridData);
        Long count = this.facultyMapper.count(jsGridData);
        jsGridData.setData(majors);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }

    @RequestMapping(
            value = {"/del"},
            produces = {"application/json; charset=utf-8"}
    )
    @ResponseBody
    public String del(Integer id) {
        this.facultyMapper.deleteByPrimaryKey(id);
        this.facultyMapper.delByfacultyId(id);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String getFacultyById(Integer id) {
        Faculty faculty = this.facultyMapper.selectByPrimaryKey(id);
        return JSONObject.toJSONString(faculty);
    }

    public String update(Faculty faculty) {
        this.facultyMapper.updateByPrimaryKeySelective(faculty);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }
}
