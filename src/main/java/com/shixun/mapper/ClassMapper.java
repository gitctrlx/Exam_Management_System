//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.common.JsGridData;
import com.shixun.entity.Class;
import com.shixun.entity.Major;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ClassMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Class record);

    int insertSelective(Class record);

    Class selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Class record);

    int updateByPrimaryKey(Class record);

    List<Class> getByMajorId(Integer majorId);

    List<Major> list(JsGridData jsGridData);

    Long count(JsGridData jsGridData);

    int delByclassId(Integer id);
}
