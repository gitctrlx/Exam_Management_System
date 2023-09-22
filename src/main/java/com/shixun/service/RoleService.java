//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.Role;

public interface RoleService {
    String add(Role role);

    String list(JsGridData jsGridData);

    String del(Integer id);

    String getRoleById(Integer id);

    String update(Role role);

    String all();
}
