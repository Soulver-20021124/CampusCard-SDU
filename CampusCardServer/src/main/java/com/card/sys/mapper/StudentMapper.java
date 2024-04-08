package com.card.sys.mapper;

import com.card.sys.entity.Student;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2023-08-28
 */
public interface StudentMapper extends BaseMapper<Student> {

    @Select("select  * from x_student  where user_id = #{id} ")
    Student selectByUserId(Integer id);
}
