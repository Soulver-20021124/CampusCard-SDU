package com.card.sys.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.mapper.LibraryMapper;
import com.card.sys.service.ILibraryService;
import com.card.sys.service.IPaymentService;
import com.card.sys.service.IUserService;
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
 * @since 2023-08-22
 */
@RestController
@RequestMapping("/library")
public class LibraryController {
    @Autowired
    private ILibraryService libraryService;
    @Autowired
    private IUserService userService;
    @Autowired
    private LibraryMapper libraryMapper;
    @GetMapping("/list")
    public Result<Map<String,Object>> getSeatList(@RequestParam(value = "seatName",required = false) String seatName,
                                                  @RequestParam(value = "seatFloor",required = false) Integer seatFloor,
                                                     @RequestParam(value = "pageNo") Long pageNo,
                                                     @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Library> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(seatName),Library::getSeatName,seatName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(seatFloor)), Library::getSeatFloor,seatFloor);
        wrapper.orderByDesc(Library::getSeatId);

        Page<Library> page = new Page<>(pageNo,pageSize);
        libraryService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @PostMapping
    public Result<?> addSeat(@RequestBody Library seat){
        libraryService.addSeat(seat);
        return Result.success("新增座位成功");
    }

    @PutMapping
    public Result<?> updateSeat(@RequestBody Library seat){
        libraryService.updateSeat(seat);
        return Result.success("修改座位成功");
    }

    @GetMapping("/{id}")
    public Result<Library> getSeatById(@PathVariable("id") Integer id){
        Library seat = libraryService.getSeatById(id);
        return Result.success(seat);
    }

    @DeleteMapping("/{id}")
    public Result<Library> deleteSeatById(@PathVariable("id") Integer id){
        libraryService.deleteSeatById(id);
        return Result.success("删除座位成功");
    }

    @PostMapping("/choose")
    public Result<?> chooseSeatById(@RequestParam(value = "seatId",required = false) Integer seatId,
                                    @RequestParam(value = "userId",required = false) Integer userId){
        Library seat = libraryService.getSeatById(seatId);
        User user = userService.getUserById(userId);
        if(libraryMapper.selectUsed(userId).isEmpty()){
            if(seat.getStatus().equals("使用中")&&!seat.getUserId().equals(userId)){
                return Result.fail("该座位正在被其他人使用");
            }
            else {
                if(seat.getUserId()!=null&&seat.getUserId().equals(userId)){
                    seat.setStatus("未使用");
                    seat.setUserName(null);
                    seat.setUserId(null);
                    libraryService.updateSeat(seat);

                    return Result.success("取消预约成功");
                }
                else{
                    seat.setUserId(userId);
                    seat.setUserName(user.getUsername());
                    seat.setStatus("使用中");
                    libraryService.updateSeat(seat);
                    return Result.success("预约成功");

                }
            }

        }
        else {
            return Result.fail("你有座位正在预约中，无法预约其他座位");
        }


    }

    @GetMapping("/all")
    public Result<List<Library>> getAllSeat(){
        List<Library> seatList = libraryService.list();
        return Result.success(seatList);
    }

    @GetMapping("/bar/{id}")
    public Result<?> bar(@PathVariable("id") Integer id){
        List<Integer> maps = libraryMapper.selectValue();
        return Result.success(maps);
    }

    @GetMapping("/mySeat")
    public Result<Map<String,Object>> getMySeat(@RequestParam(value = "seatName",required = false) String seatName,
                                                   @RequestParam(value = "id",required = false) Integer userId,
                                                   @RequestParam(value = "pageNo") Long pageNo,
                                                   @RequestParam(value = "pageSize") Long pageSize){


        LambdaQueryWrapper<Library> wrapper = new LambdaQueryWrapper<>();
        //wrapper.eq(StringUtils.hasLength(paymentName),IsPay::getPaymentName,paymentName);
        wrapper.eq(StringUtils.hasLength(String.valueOf(userId)),Library::getUserId,userId);
        wrapper.orderByDesc(Library::getSeatId);

        Page<Library> page = new Page<>(pageNo,pageSize);
        libraryService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @PostMapping("/cancel")
    public Result<?> cancelSeatById(@RequestParam(value = "seatId",required = false) Integer seatId,
                                    @RequestParam(value = "userId",required = false) Integer userId){
        Library seat = libraryService.getSeatById(seatId);


                if(seat.getUserId()!=null&&seat.getUserId().equals(userId)){
                    seat.setStatus("未使用");
                    seat.setUserName(null);
                    seat.setUserId(null);
                    libraryService.updateSeat(seat);

                    return Result.success("取消预约成功");
                }
                else return Result.fail("取消预约失败");

    }

}
