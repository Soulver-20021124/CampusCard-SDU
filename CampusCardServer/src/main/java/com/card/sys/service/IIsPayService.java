package com.card.sys.service;

import com.card.sys.entity.IsPay;
import com.baomidou.mybatisplus.extension.service.IService;
import com.card.sys.entity.Record;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-23
 */
public interface IIsPayService extends IService<IsPay> {

    void updateIsPay(IsPay isPay);

    IsPay getIsPayById(Integer id);
}
