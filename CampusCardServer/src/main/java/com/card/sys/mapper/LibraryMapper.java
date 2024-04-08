package com.card.sys.mapper;

import com.card.sys.entity.Library;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.data.annotation.QueryAnnotation;


import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2023-08-22
 */
public interface LibraryMapper extends BaseMapper<Library> {
    @Select("select count(*) value from x_library  where user_id is null group by seat_floor")
    List<Integer> selectValue();

    @Select("select seat_id from x_library where user_id = #{id} ")
    List<Integer> selectUsed(Integer id);



}
