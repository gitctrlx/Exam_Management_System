//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.Faculty;

public interface FacultyService {
    String all();

    String list(JsGridData jsGridData);

    String add(Faculty faculty);

    String del(Integer id);

    String getFacultyById(Integer id);

    String update(Faculty faculty);
}
