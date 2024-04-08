package com.card.sys.service.impl;

import com.card.sys.entity.Library;
import com.card.sys.entity.Payment;
import com.card.sys.entity.Record;
import com.card.sys.mapper.LibraryMapper;
import com.card.sys.service.ILibraryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-22
 */
@Service
public class LibraryServiceImpl extends ServiceImpl<LibraryMapper, Library> implements ILibraryService {
    @Override
    @Transactional
    public void addSeat(Library seat){
        this.baseMapper.insert(seat);
    }

    @Override
    public Library getSeatById(Integer id) {
        Library seat = this.baseMapper.selectById(id);
        return seat;
    }

    @Override
    @Transactional
    public void updateSeat(Library seat) {
        // 修改角色表
        this.baseMapper.updateById(seat);

    }

    @Override
    @Transactional
    public void deleteSeatById(Integer id) {
        this.baseMapper.deleteById(id);

    }


}
