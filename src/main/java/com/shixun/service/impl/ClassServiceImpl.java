//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.Class;
import com.shixun.entity.Major;
import com.shixun.mapper.ClassMapper;
import com.shixun.service.ClassService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class ClassServiceImpl implements ClassService {
    @Autowired
    ClassMapper classMapper;

    public ClassServiceImpl() {
    }

    public String getByMajorId(Integer majorId) {
        List<Class> classes = this.classMapper.getByMajorId(majorId);
        return JSONObject.toJSONString(classes);
    }

    public String getClassById(Integer id) {
        Class faculty = this.classMapper.selectByPrimaryKey(id);
        return JSONObject.toJSONString(faculty);
    }

    public String add(Class c_lass) {
        this.classMapper.insertSelective(c_lass);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String del(Integer id) {
        this.classMapper.deleteByPrimaryKey(id);
        this.classMapper.delByclassId(id);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String update(Class c_lass) {
        this.classMapper.updateByPrimaryKeySelective(c_lass);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<Major> majors = this.classMapper.list(jsGridData);
        Long count = this.classMapper.count(jsGridData);
        jsGridData.setData(majors);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }
}
