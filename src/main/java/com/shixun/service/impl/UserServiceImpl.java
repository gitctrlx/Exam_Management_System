//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.User;
import com.shixun.entity.UserRole;
import com.shixun.mapper.UserMapper;
import com.shixun.mapper.UserRoleMapper;
import com.shixun.service.UserService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;
    @Autowired
    UserRoleMapper userRoleMapper;

    public UserServiceImpl() {
    }

    public String login(User user) {
        User u = this.userMapper.login(user);
        String code = "999";
        if (u != null) {
            code = "200";
        }

        Map<String, String> map = new HashMap();
        map.put("code", code);
        return JSONObject.toJSONString(map);
    }

    public String add(User user) {
        this.userMapper.insertSelective(user);
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId(user.getRoleId());
        this.userRoleMapper.insertSelective(userRole);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<User> users = this.userMapper.list(jsGridData);
        Long count = this.userMapper.count(jsGridData);
        jsGridData.setData(users);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }

    public String del(Integer id) {
        this.userMapper.deleteByPrimaryKey(id);
        this.userRoleMapper.delByUserId(id);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String getUserById(Integer id) {
        User user = this.userMapper.selectByPrimaryKey(id);
        UserRole userRole = this.userRoleMapper.getByUserId(id);
        Map<String, Object> map = new HashMap();
        map.put("user", user);
        map.put("userRole", userRole);
        return JSONObject.toJSONString(map);
    }

    public String update(User user) {
        this.userMapper.updateByPrimaryKeySelective(user);
        this.userRoleMapper.delByUserId(user.getId());
        UserRole userRole = new UserRole();
        userRole.setUserId(user.getId());
        userRole.setRoleId(user.getRoleId());
        this.userRoleMapper.insertSelective(userRole);
        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }
}
