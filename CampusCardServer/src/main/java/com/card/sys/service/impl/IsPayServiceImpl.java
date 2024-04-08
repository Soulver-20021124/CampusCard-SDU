package com.card.sys.service.impl;

import com.card.sys.entity.IsPay;
import com.card.sys.entity.Record;
import com.card.sys.mapper.IsPayMapper;
import com.card.sys.service.IIsPayService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-23
 */
@Service
public class IsPayServiceImpl extends ServiceImpl<IsPayMapper, IsPay> implements IIsPayService {

    @Override
    public IsPay getIsPayById(Integer id) {
        IsPay isPay = this.baseMapper.selectById(id);
        return isPay;
    }
    @Override
    @Transactional
    public void updateIsPay(IsPay isPay) {
        // 修改角色表
        this.baseMapper.updateById(isPay);

    }

}
