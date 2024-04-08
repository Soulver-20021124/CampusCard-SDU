package com.card.sys.service.impl;

import com.card.sys.entity.Information;
import com.card.sys.mapper.InformationMapper;
import com.card.sys.service.IInformationService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-30
 */
@Service
public class InformationServiceImpl extends ServiceImpl<InformationMapper, Information> implements IInformationService {

    @Override
    @Transactional
    public void deleteInformationById(Integer id) {
        this.baseMapper.deleteById(id);

    }

}
