package com.card.sys.mapper;

import com.card.sys.entity.IsPay;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author baomidou
 * @since 2023-08-23
 */
public interface IsPayMapper extends BaseMapper<IsPay> {

    @Select("select  * from x_is_pay r where r.user_id = #{userId} and r.payment_id= #{paymentId}")
    IsPay selectIsPay(Integer userId,Integer paymentId);

}
