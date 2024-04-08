package com.card.sys.mapper;

import com.card.sys.entity.Record;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.card.sys.entity.Student;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2023-08-18
 */
public interface RecordMapper extends BaseMapper<Record> {

    @Select("select  r.reason name, sum(r.cost) value from x_record r where r.user_id = #{id} and r.refund!=0 group by r.reason")
    List<Map<String,Integer>> selectNameAndValue(Integer id);

    @Select("select  * from x_record where user_id = #{id} ")
    List<Record> selectByUserId(Integer id);

    @Select("select  max(record_id) from x_record ")
    Integer getMaxId();

}
