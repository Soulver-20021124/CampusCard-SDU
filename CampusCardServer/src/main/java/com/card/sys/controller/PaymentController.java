package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.mapper.InformationMapper;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-19
 */
@RestController
@RequestMapping("/payment")
public class PaymentController {
    @Autowired
    private IPaymentService paymentService;
    @Autowired
    private IUserService userService;
    @Autowired
    private IRecordService recordService;
    @Autowired
    private IIsPayService isPayService;
    @Resource
    private InformationMapper informationMapper;

    @GetMapping("/list")
    public Result<Map<String,Object>> getPaymentList(@RequestParam(value = "paymentName",required = false) String paymentName,
                                                  @RequestParam(value = "pageNo") Long pageNo,
                                                  @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Payment> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(paymentName),Payment::getPaymentName,paymentName);
        wrapper.orderByDesc(Payment::getPaymentId);

        Page<Payment> page = new Page<>(pageNo,pageSize);
        paymentService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }


    @PostMapping
    public Result<?> addPayment(@RequestBody Payment payment){
        paymentService.addPayment(payment);
        LocalDate date=LocalDate.now();
        String s = date.toString();
        List<User>userList=userService.list();
                for(User user:userList){
                    informationMapper.insert(new Information(null,"管理员于"+payment.getTime()+"发布了名为 "+payment.getPaymentName()+" 的缴费事项，请及时缴费。如已缴费请忽略","缴费"+s,user.getId()));

                }

        return Result.success("新增缴费事项成功");
    }

    @PutMapping
    public Result<?> updatePayment(@RequestBody Payment payment){
        paymentService.updatePayment(payment);
        return Result.success("修改缴费事项成功");
    }

    @GetMapping("/{id}")
    public Result<Payment> getPaymentById(@PathVariable("id") Integer id){
        Payment payment = paymentService.getPaymentById(id);
        return Result.success(payment);
    }

    @DeleteMapping("/{id}")
    public Result<Payment> deletePaymentById(@PathVariable("id") Integer id){
        paymentService.deletePaymentById(id);
        return Result.success("删除缴费事项成功");
    }

    @PostMapping("/pay")
    public Result<?> buyPaymentById(@RequestParam(value = "id",required = false) Integer id,
                                    @RequestParam(value = "paymentId",required = false) Integer paymentId){

        Payment payment = paymentService.getPaymentById(paymentId);
        return paymentService.buyPaymentById(payment,id);

    }

    @GetMapping("/all")
    public Result<List<Payment>> getAllPayment(){
        List<Payment> paymentList = paymentService.list();
        return Result.success(paymentList);
    }



}
