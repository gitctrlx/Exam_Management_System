//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.entity.QuestionTemplate;

public interface QuestionTemplateMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(QuestionTemplate record);

    int insertSelective(QuestionTemplate record);

    QuestionTemplate selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(QuestionTemplate record);

    int updateByPrimaryKey(QuestionTemplate record);
}
