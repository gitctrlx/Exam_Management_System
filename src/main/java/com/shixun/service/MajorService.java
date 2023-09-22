//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.service;

import com.shixun.common.JsGridData;
import com.shixun.entity.Major;

public interface MajorService {
    String getMajorById(Integer Id);

    String list(JsGridData jsGridData);

    String add(Major major);

    String del(Integer id);

    String update(Major major);

    String getByFacultyId(Integer facultyId);
}
