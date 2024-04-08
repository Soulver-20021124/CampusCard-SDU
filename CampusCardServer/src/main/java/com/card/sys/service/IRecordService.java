package com.card.sys.service;

import com.card.sys.entity.Record;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-18
 */
public interface IRecordService extends IService<Record> {

    void updateRecord(Record record);

    Record getRecordById(Integer id);

    void deleteRecordById(Integer id);
}
