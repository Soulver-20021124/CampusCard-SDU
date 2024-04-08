package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.IsPay;
import com.card.sys.entity.Payment;
import com.card.sys.service.IIsPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-23
 */
@RestController
@RequestMapping("/isPay")
public class IsPayController {

    @Autowired
    IIsPayService isPayService;
    @GetMapping("/list")
    public Result<Map<String,Object>> getIsPayList(@RequestParam(value = "paymentName",required = false) String paymentName,
                                                           @RequestParam(value = "id",required = false) Integer userId,
                                                           @RequestParam(value = "pageNo") Long pageNo,
                                                           @RequestParam(value = "pageSize") Long pageSize){


        LambdaQueryWrapper<IsPay> wrapper = new LambdaQueryWrapper<>();
        //wrapper.eq(StringUtils.hasLength(paymentName),IsPay::getPaymentName,paymentName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(userId)),IsPay::getUserId,userId);
        wrapper.orderByDesc(IsPay::getIsPayId);

        Page<IsPay> page = new Page<>(pageNo,pageSize);
        isPayService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @GetMapping("/list2")
    public Result<Map<String,Object>> getIsPayStudentList(
                                                   @RequestParam(value = "id",required = false) Integer paymentId,
                                                   @RequestParam(value = "pageNo") Long pageNo,
                                                   @RequestParam(value = "pageSize") Long pageSize){


        LambdaQueryWrapper<IsPay> wrapper = new LambdaQueryWrapper<>();
        //wrapper.eq(StringUtils.hasLength(paymentName),IsPay::getPaymentName,paymentName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(paymentId)),IsPay::getPaymentId,paymentId);
        wrapper.isNotNull(IsPay::getUserId);
        wrapper.orderByDesc(IsPay::getIsPayId);

        Page<IsPay> page = new Page<>(pageNo,pageSize);
        isPayService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

}
