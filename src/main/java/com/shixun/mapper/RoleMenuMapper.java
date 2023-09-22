//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.mapper;

import com.shixun.entity.RoleMenu;
import java.util.List;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface RoleMenuMapper {
    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    int delByRoleId(Integer id);

    List<RoleMenu> getByRoleId(Integer id);
}
