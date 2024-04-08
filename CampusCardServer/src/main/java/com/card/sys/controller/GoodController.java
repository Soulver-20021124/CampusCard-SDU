package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.Good;
import com.card.sys.entity.Role;
import com.card.sys.entity.User;
import com.card.sys.service.IGoodService;
import com.card.sys.service.IRoleService;
import io.swagger.models.auth.In;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-17
 */
@RestController
@RequestMapping("/good")
public class GoodController {
    @Autowired
    private IGoodService goodService;

    @GetMapping("/list")
    public Result<Map<String,Object>> getGoodList(@RequestParam(value = "goodName",required = false) String goodName,
                                                  @RequestParam(value = "pageNo") Long pageNo,
                                                  @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Good> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(goodName),Good::getGoodName,goodName);
        wrapper.orderByDesc(Good::getGoodId);

        Page<Good> page = new Page<>(pageNo,pageSize);
        goodService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @PostMapping
    public Result<?> addGood(@RequestBody Good good){
        good.setAvatar("http://localhost:9999/file/6d1b0d897910477ba2880fa9cbe606c5.jpg");
        goodService.addGood(good);
        return Result.success("新增商品成功");
    }

    @PutMapping
    public Result<?> updateGood(@RequestBody Good good){
        goodService.updateGood(good);
        return Result.success("修改商品成功");
    }

    @GetMapping("/{id}")
    public Result<Good> getGoodById(@PathVariable("id") Integer id){
        Good good = goodService.getGoodById(id);
        return Result.success(good);
    }

    @DeleteMapping("/{id}")
    public Result<Good> deleteGoodById(@PathVariable("id") Integer id){
        goodService.deleteGoodById(id);
        return Result.success("删除商品成功");
    }

    @PostMapping("/buy")
    public Result<?> buyGoodById(@RequestParam(value = "id",required = false) Integer id,
                                 @RequestParam(value = "goodId",required = false) Integer goodId){
        Good good=goodService.getGoodById(goodId);
        return goodService.buyGoodById(good,id);

    }

    @GetMapping("/all")
    public Result<List<Good>> getAllGood(){
        List<Good> goodList = goodService.list();
        return Result.success(goodList);
    }

}
