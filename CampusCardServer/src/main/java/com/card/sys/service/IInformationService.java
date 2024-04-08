package com.card.sys.service;

import com.card.sys.entity.Information;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-30
 */
public interface IInformationService extends IService<Information> {

    void deleteInformationById(Integer id);
}
