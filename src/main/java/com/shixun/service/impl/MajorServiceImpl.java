//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.Major;
import com.shixun.mapper.MajorMapper;
import com.shixun.service.MajorService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    MajorMapper majorMapper;

    public MajorServiceImpl() {
    }

    public String getByFacultyId(Integer facultyId) {
        List<Major> majors = this.majorMapper.getByFacultyId(facultyId);
        return JSONObject.toJSONString(majors);
    }

    public String getMajorById(Integer id) {
        Major major = this.majorMapper.selectByPrimaryKey(id);
        Map<String, Object> map = new HashMap();
        map.put("major", major);
        return JSONObject.toJSONString(map);
    }

    public String add(Major major) {
        this.majorMapper.insertSelective(major);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String del(Integer id) {
        this.majorMapper.deleteByPrimaryKey(id);
        this.majorMapper.delByMajorId(id);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String update(Major major) {
        this.majorMapper.updateByPrimaryKeySelective(major);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<Major> majors = this.majorMapper.list(jsGridData);
        Long count = this.majorMapper.count(jsGridData);
        jsGridData.setData(majors);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }
}
