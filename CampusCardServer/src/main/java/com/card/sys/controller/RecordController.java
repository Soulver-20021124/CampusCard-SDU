package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.Good;
import com.card.sys.entity.Information;
import com.card.sys.entity.Record;
import com.card.sys.entity.User;
import com.card.sys.mapper.InformationMapper;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.service.IGoodService;
import com.card.sys.service.IRecordService;
import com.card.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-18
 */
@RestController
@RequestMapping("/record")
public class RecordController {
    @Autowired
    private IRecordService recordService;
    @Autowired
    private IUserService userService;

    @Resource
    private RecordMapper recordMapper;

    @Resource
    private InformationMapper informationMapper;

    @GetMapping("/list")
    public Result<Map<String,Object>> getRecordList(@RequestParam(value = "reason",required = false) String reason,
                                                    @RequestParam(value = "userName",required = false) String userName,
                                                  @RequestParam(value = "pageNo") Long pageNo,
                                                  @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Record> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(reason),Record::getReason,reason);
        wrapper.eq(StringUtils.hasLength(userName),Record::getUserName,userName);
        wrapper.orderByDesc(Record::getRecordId);

        Page<Record> page = new Page<>(pageNo,pageSize);
        recordService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @GetMapping("/refundList")
    public Result<Map<String,Object>> getRefundList(@RequestParam(value = "reason",required = false) String reason,
                                                    @RequestParam(value = "userName",required = false) String userName,
                                                    @RequestParam(value = "pageNo") Long pageNo,
                                                    @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Record> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(reason),Record::getReason,reason);
        wrapper.eq(StringUtils.hasLength(userName),Record::getUserName,userName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(2)),Record::getRefund,2);
        wrapper.orderByDesc(Record::getRecordId);

        Page<Record> page = new Page<>(pageNo,pageSize);
        recordService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }
    @GetMapping("/list2")
    public Result<Map<String,Object>> getSingleRecordList(@RequestParam(value = "reason",required = false) String reason,
                                                    @RequestParam(value = "pageNo") Long pageNo,
                                                    @RequestParam(value = "pageSize") Long pageSize,
                                                          @RequestParam(value = "id") Integer userId){

        LambdaQueryWrapper<Record> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(reason),Record::getReason,reason);
        wrapper.eq(StringUtils.hasLength(String.valueOf(userId)),Record::getUserId,userId);
        wrapper.ne(StringUtils.hasLength(String.valueOf(0)),Record::getRefund,0);
        wrapper.orderByDesc(Record::getRecordId);

        Page<Record> page = new Page<>(pageNo,pageSize);
        recordService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }


    @GetMapping("/{id}")
    public Result<Record> getRecordById(@PathVariable("id") Integer id){
        Record record = recordService.getRecordById(id);
        return Result.success(record);
    }

    @DeleteMapping("/{id}")
    public Result<Record> deleteRecordById(@PathVariable("id") Integer id){
        recordService.deleteRecordById(id);
        return Result.success("删除记录成功");
    }


    @GetMapping("/all")
    public Result<List<Record>> getAllRecord(){
        List<Record> recordList = recordService.list();
        return Result.success(recordList);
    }

    @GetMapping("/pie/{id}")
    public Result<?> pie(@PathVariable("id") Integer id){
        List<Map<String, Integer>> maps = recordMapper.selectNameAndValue(id);
        return Result.success(maps);
    }

    @PutMapping("/refund/{id}")
    public Result<?> refund(@PathVariable("id") Integer id){
        Record record=recordService.getRecordById(id);
        if(Objects.equals(record.getReason(), "缴费") || Objects.equals(record.getReason(), "补卡")||Objects.equals(record.getReason(), "充值")){
            return Result.fail("该类消费无法退回");
        }
         else{
            record.setRefund(2);
            recordService.updateRecord(record);
            return Result.success("提交退费审核成功");

        }

    }
    @PutMapping("/agree/{id}")
    public Result<?> agree(@PathVariable("id") Integer id){
        LocalDate date=LocalDate.now();
        String s = date.toString();
        Record record=recordService.getRecordById(id);
        User user= userService.getUserById(record.getUserId());
            record.setRefund(0);
            recordService.updateRecord(record);
            user.setMoney(user.getMoney()+record.getCost());
            userService.updateUser(user);
        informationMapper.insert(new Information(null,"管理员于 "+s+" 同意了你的退费申请 "+record.getCost()+" 元已返回你的账户","退费成功 "+s,user.getId()));

            return Result.success("同意退费");

    }
    @PutMapping("/disagree/{id}")
    public Result<?> disagree(@PathVariable("id") Integer id){
        LocalDate date=LocalDate.now();
        String s = date.toString();
        Record record=recordService.getRecordById(id);
        User user= userService.getUserById(record.getUserId());
        record.setRefund(1);
        recordService.updateRecord(record);
        informationMapper.insert(new Information(null,"管理员于 "+s+" 拒绝了你的退费申请 ","退费失败 "+s,user.getId()));
        return Result.success("不同意退费");

    }

}
