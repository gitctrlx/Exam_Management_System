//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.Class;

public interface ClassService {
    String getClassById(Integer majorId);

    String list(JsGridData jsGridData);

    String add(Class c_lass);

    String del(Integer id);

    String update(Class c_lass);

    String getByMajorId(Integer majorId);
}
