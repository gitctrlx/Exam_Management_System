//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.common.JsGridData;
import com.shixun.entity.Major;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MajorMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Major record);

    int insertSelective(Major record);

    Major selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Major record);

    int updateByPrimaryKey(Major record);

    List<Major> getByFacultyId(Integer facultyId);

    List<Major> list(JsGridData jsGridData);

    Long count(JsGridData jsGridData);

    int delByMajorId(Integer id);
}
