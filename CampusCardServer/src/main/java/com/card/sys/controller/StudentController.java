package com.card.sys.controller;

import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.service.IGoodService;
import com.card.sys.service.IStudentService;
import com.card.sys.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;

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
 * @since 2023-08-28
 */
@RestController
@RequestMapping("/student")
public class StudentController {

    @Autowired
    private IStudentService studentService;
    @Autowired
    private IUserService userService;

    @GetMapping("/list")
    public Result<Map<String,Object>> getStudentList(@RequestParam(value = "studentName",required = false) String studentName,
                                                  @RequestParam(value = "pageNo") Long pageNo,
                                                  @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<Student> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(studentName),Student::getStudentName,studentName);
        wrapper.orderByDesc(Student::getStudentId);

        Page<Student> page = new Page<>(pageNo,pageSize);
        studentService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @PutMapping("/update")
    public Result<?> updateById(@RequestBody Student student){

        studentService.updateStudent(student);

        User user = userService.getUserById(student.getUserId());
        user.setPhone(student.getPhone());
        user.setGender(student.getGender());
        user.setEmail(student.getEmail());
        user.setStatus(1);
        userService.updateUser(user);

        return Result.success("提交成功");

    }

    @GetMapping("/{id}")
    public Result<Student> getStudentById(@PathVariable("id") Integer id){
        Student student = studentService.getStudentByUserId(id);
        return Result.success(student);
    }

    @GetMapping("/export")
    public Result<?> exportStudentExcel(){

        String filename = "C:\\Users\\haozongduo\\Desktop\\Campus Card\\学生表.xlsx";
        List<Student> list = studentService.list();


        EasyExcel.write(filename,Student.class)
                .sheet("学生表")
                .doWrite(list);

       /*ExcelWriter excelWriter = EasyExcel.write(filename, Record.class).build();
        // 创建Sheet对象
        WriteSheet writeSheet = EasyExcel.writerSheet("消费记录").build();
        // 向Excel中写入数据
        excelWriter.write(getRecordData(), writeSheet);
        // 关闭流
        excelWriter.finish();*/
        return Result.success("导出成功");


    }

}
