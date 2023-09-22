//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.entity.MajorSemester;

public interface MajorSemesterMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(MajorSemester record);

    int insertSelective(MajorSemester record);

    MajorSemester selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(MajorSemester record);

    int updateByPrimaryKey(MajorSemester record);
}
