package com.card.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.card.sys.entity.Good;
import com.card.sys.entity.Record;
import com.card.sys.entity.User;
import com.card.sys.entity.UserRole;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.service.IRecordService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-18
 */
@Service
public class RecordServiceImpl extends ServiceImpl<RecordMapper, Record> implements IRecordService {
    @Override
    public Record getRecordById(Integer id) {
        Record record = this.baseMapper.selectById(id);
        return record;
    }
    @Override
    @Transactional
    public void updateRecord(Record record) {
        // 修改角色表
        this.baseMapper.updateById(record);

    }

    @Override
    @Transactional
    public void deleteRecordById(Integer id) {
        this.baseMapper.deleteById(id);

    }

}
