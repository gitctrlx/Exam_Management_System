//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.common.JsGridData;
import com.shixun.entity.Faculty;
import com.shixun.entity.Major;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FacultyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Faculty record);

    int insertSelective(Faculty record);

    Faculty selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Faculty record);

    int updateByPrimaryKey(Faculty record);

    List<Faculty> all();

    List<Major> list(JsGridData jsGridData);

    Long count(JsGridData jsGridData);

    String del(Integer id);

    int delByfacultyId(Integer id);
}
