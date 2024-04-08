package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.Information;
import com.card.sys.entity.IsPay;
import com.card.sys.entity.Payment;
import com.card.sys.service.IInformationService;
import com.card.sys.service.IIsPayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-30
 */
@RestController
@RequestMapping("/information")
public class InformationController {

    @Autowired
    IInformationService informationService;
    @GetMapping("/list")
    public Result<Map<String,Object>> getInformationList(
                                                   @RequestParam(value = "id",required = false) Integer userId,
                                                   @RequestParam(value = "pageNo") Long pageNo,
                                                   @RequestParam(value = "pageSize") Long pageSize){


        LambdaQueryWrapper<Information> wrapper = new LambdaQueryWrapper<>();
        //wrapper.eq(StringUtils.hasLength(paymentName),IsPay::getPaymentName,paymentName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(userId)),Information::getUserId,userId);
        wrapper.orderByDesc(Information::getInformationId);

        Page<Information> page = new Page<>(pageNo,pageSize);
        informationService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @DeleteMapping("/{id}")
    public Result<Information> deleteInformationById(@PathVariable("id") Integer id){
        informationService.deleteInformationById(id);
        return Result.success("删除通知成功");
    }

}
