package com.card.sys.service;

import com.card.common.vo.Result;
import com.card.sys.entity.Good;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-17
 */
public interface IGoodService extends IService<Good> {

    void addGood(Good good);

    void updateGood(Good good);

    Good getGoodById(Integer id);

    void deleteGoodById(Integer id);

    Result buyGoodById(Good good, Integer id);
}
