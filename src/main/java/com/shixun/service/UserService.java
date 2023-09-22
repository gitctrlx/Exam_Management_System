//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.User;

public interface UserService {
    String login(User user);

    String add(User user);

    String list(JsGridData jsGridData);

    String del(Integer id);

    String getUserById(Integer id);

    String update(User user);
}
