package com.card.sys.service.impl;

import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.mapper.IsPayMapper;
import com.card.sys.mapper.PaymentMapper;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.service.IPaymentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.card.sys.service.IRecordService;
import com.card.sys.service.IStudentService;
import com.card.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;

import javax.annotation.Resource;
import java.time.LocalDate;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-19
 */
@Service
public class PaymentServiceImpl extends ServiceImpl<PaymentMapper, Payment> implements IPaymentService {
    @Resource
    private RecordMapper recordMapper;
    @Resource
    private IsPayMapper isPayMapper;
    @Autowired
    private IRecordService recordService;

    @Autowired
    private IUserService userService;

    @Autowired
    private IStudentService studentService;

    @Override
    @Transactional
    public void addPayment(Payment payment){
        this.baseMapper.insert(payment);
    }

    @Override
    public Payment getPaymentById(Integer id) {
        Payment payment = this.baseMapper.selectById(id);
        return payment;
    }

    @Override
    @Transactional
    public void updatePayment(Payment payment) {
        // 修改角色表
        this.baseMapper.updateById(payment);

    }

    @Override
    @Transactional
    public void deletePaymentById(Integer id) {
        this.baseMapper.deleteById(id);

    }

    @Override
    @Transactional
    public Result<?> buyPaymentById(Payment payment, Integer id) {
        LocalDate date=LocalDate.now();
        String s = date.toString();
        User user  = userService.getUserById(id);
        Student st = studentService.getStudentByUserId(id);


            if(isPayMapper.selectIsPay(id,payment.getPaymentId())==null){
                if(user.getMoney()>=payment.getPrice()&&user.getStatus()==1){
                    recordMapper.insert(new Record(null,payment.getPrice()*1,"缴费",id,st.getStudentName(),s,1,0));

                    user.setMoney(user.getMoney()-payment.getPrice());
                    userService.updateUser(user);
                    isPayMapper.insert(new IsPay(null,payment.getPaymentId(),id,st.getStudentName(),payment.getPrice()*1,s,payment.getPaymentName()));
                    return Result.success("缴费成功");

                }
                else if(user.getStatus()==0){
                    return Result.fail("您目前处于挂失状态，无法进行消费");
                }
                else  return  Result.fail("余额不足，缴费失败");
            }
            else return Result.fail("请勿重复缴费");

        }

}
