//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.entity.ExaminationQuestion;

public interface ExaminationQuestionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ExaminationQuestion record);

    int insertSelective(ExaminationQuestion record);

    ExaminationQuestion selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ExaminationQuestion record);

    int updateByPrimaryKey(ExaminationQuestion record);
}
