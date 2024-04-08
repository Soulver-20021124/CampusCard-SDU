package com.card.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.mapper.GoodMapper;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.mapper.RoleMenuMapper;
import com.card.sys.service.IGoodService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.card.sys.service.IRecordService;
import com.card.sys.service.IStudentService;
import com.card.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-17
 */
@Service
public class GoodServiceImpl extends ServiceImpl<GoodMapper, Good> implements IGoodService {

    @Resource
    private RecordMapper recordMapper;
    @Autowired
    private IRecordService recordService;
    @Autowired
    private IUserService userService;

    @Autowired
    private IStudentService studentService;


    @Override
    @Transactional
    public void addGood(Good good){
        this.baseMapper.insert(good);
    }

    @Override
    public Good getGoodById(Integer id) {
        Good good = this.baseMapper.selectById(id);
        return good;
    }

    @Override
    @Transactional
    public void updateGood(Good good) {
        // 修改角色表
        this.baseMapper.updateById(good);

    }

    @Override
    @Transactional
    public void deleteGoodById(Integer id) {
        this.baseMapper.deleteById(id);

    }

    @Override
    @Transactional
    public Result<?> buyGoodById(Good good, Integer id) {
        LocalDate date=LocalDate.now();
        String s = date.toString();
        User user  = userService.getUserById(id);
        Student st = studentService.getStudentByUserId(id);
        if(user.getMoney()>=good.getPrice()&&user.getStatus()==1){
            System.out.println(user.getMoney());
            recordMapper.insert(new Record(null,good.getPrice()*1,"购物",id,st.getStudentName(),s,1,0));
            user.setMoney(user.getMoney()-good.getPrice());
            userService.updateUser(user);

            return Result.success("购买商品成功");

        }
        else if(user.getStatus()==0){
            return Result.fail("您目前处于挂失状态，无法进行消费");
        }
        else  return  Result.fail("余额不足，购买失败");


    }


}
