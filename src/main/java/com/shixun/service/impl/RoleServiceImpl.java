//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.shixun.common.JsGridData;
import com.shixun.common.Message;
import com.shixun.entity.Role;
import com.shixun.entity.RoleMenu;
import com.shixun.mapper.RoleMapper;
import com.shixun.mapper.RoleMenuMapper;
import com.shixun.service.RoleService;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service
public class RoleServiceImpl implements RoleService {
    @Autowired
    RoleMapper roleMapper;
    @Autowired
    RoleMenuMapper roleMenuMapper;

    public RoleServiceImpl() {
    }

    public String add(Role role) {
        this.roleMapper.insertSelective(role);
        String[] menuIds = role.getIds().split(",");
        String[] var3 = menuIds;
        int var4 = menuIds.length;

        for(int var5 = 0; var5 < var4; ++var5) {
            String menuId = var3[var5];
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setMenuId(Integer.parseInt(menuId));
            roleMenu.setRoleId(role.getId());
            this.roleMenuMapper.insertSelective(roleMenu);
        }

        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String list(JsGridData jsGridData) {
        List<Role> roles = this.roleMapper.list(jsGridData);
        Long count = this.roleMapper.count(jsGridData);
        jsGridData.setData(roles);
        jsGridData.setItemsCount(count);
        return JSONObject.toJSONString(jsGridData);
    }

    public String del(Integer id) {
        int i = this.roleMapper.deleteByPrimaryKey(id);
        this.roleMenuMapper.delByRoleId(id);
        Message message = new Message("999");
        if (i > 0) {
            message.setCode("200");
        }

        return JSONObject.toJSONString(message);
    }

    public String getRoleById(Integer id) {
        Role role = this.roleMapper.selectByPrimaryKey(id);
        List<RoleMenu> roleMenus = this.roleMenuMapper.getByRoleId(id);
        Map<String, Object> map = new HashMap();
        map.put("role", role);
        map.put("roleMenus", roleMenus);
        return JSONObject.toJSONString(map);
    }

    public String update(Role role) {
        this.roleMapper.updateByPrimaryKeySelective(role);
        this.roleMenuMapper.delByRoleId(role.getId());
        String[] menuIds = role.getIds().split(",");
        String[] var3 = menuIds;
        int var4 = menuIds.length;

        for(int var5 = 0; var5 < var4; ++var5) {
            String menuId = var3[var5];
            RoleMenu roleMenu = new RoleMenu();
            roleMenu.setMenuId(Integer.parseInt(menuId));
            roleMenu.setRoleId(role.getId());
            this.roleMenuMapper.insertSelective(roleMenu);
        }

        Message message = new Message("200");
        return JSONObject.toJSONString(message);
    }

    public String all() {
        List<Role> roles = this.roleMapper.all();
        return JSONObject.toJSONString(roles);
    }
}
