package com.card.sys.controller;

import com.alibaba.excel.EasyExcel;
import com.alibaba.excel.ExcelWriter;
import com.alibaba.excel.write.metadata.WriteSheet;
import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.card.common.vo.Result;
import com.card.sys.entity.*;
import com.card.sys.entity.Record;
import com.card.sys.mapper.InformationMapper;
import com.card.sys.mapper.IsPayMapper;
import com.card.sys.mapper.RecordMapper;
import com.card.sys.service.IIsPayService;
import com.card.sys.service.IRecordService;
import com.card.sys.service.IStudentService;
import com.card.sys.service.IUserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDate;
import java.util.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author baomidou
 * @since 2023-08-13
 */
@Api(tags = {"用户接口列表"})
@RestController
@RequestMapping("/user")
@CrossOrigin
public class UserController {
    @Autowired
    private IUserService userService;

    @Autowired
    private IStudentService studentService;

    @Autowired
    private IRecordService recordService;

    @Autowired
    private IIsPayService isPayService;

    @Resource
    private RecordMapper recordMapper;
    @Resource
    private InformationMapper informationMapper;
    @Resource
    private IsPayMapper isPayMapper;

    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/all")
    public Result<List<User>> getAllUser(){
        List<User> list = userService.list();
        return Result.success(list,"查询成功");
    }

    @ApiOperation("用户登录")
    @PostMapping("/login")
    public Result<Map<String,Object>> login(@RequestBody User user){
        Map<String,Object> data = userService.login(user);
        if(data != null){
            return Result.success(data);
        }
        return Result.fail(20002,"用户名或密码错误");
    }

    @GetMapping("/info")
    public Result<Map<String,Object>> getUserInfo(@RequestParam("token") String token){
        // 根据token获取用户信息，redis
        Map<String,Object> data = userService.getUserInfo(token);
        if(data != null){
            return Result.success(data);
        }
        return Result.fail(20003,"登录信息无效，请重新登录");
    }

    @PostMapping("/logout")
    public Result<?> logout(@RequestHeader("X-Token") String token){
        userService.logout(token);
        return Result.success();
    }

    @GetMapping("/list")
    public Result<Map<String,Object>> getUserList(@RequestParam(value = "username",required = false) String username,
                                              @RequestParam(value = "phone",required = false) String phone,
                                              @RequestParam(value = "pageNo") Long pageNo,
                                              @RequestParam(value = "pageSize") Long pageSize){

        LambdaQueryWrapper<User> wrapper = new LambdaQueryWrapper<>();
        wrapper.eq(StringUtils.hasLength(username),User::getUsername,username);
        wrapper.eq(StringUtils.hasLength(phone),User::getPhone,phone);
        wrapper.orderByDesc(User::getId);

        Page<User> page = new Page<>(pageNo,pageSize);
        userService.page(page,wrapper);

        Map<String,Object> data = new HashMap<>();
        data.put("total",page.getTotal());
        data.put("rows",page.getRecords());

        return Result.success(data);

    }

    @PostMapping
    public Result<?> addUser(@RequestBody User user){
        LocalDate date=LocalDate.now();
        String s = date.toString();
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        Random rand = new Random();
        user.setNum(String.valueOf(rand.nextInt(89999999)+10000000));
        user.setMoney(100);
        user.setAvatar("http://localhost:9999/file/7bd3481de0fb4a5b927d75a26f2bbcf7.jpg");
        userService.addUser(user);
        informationMapper.insert(new Information(null,"请尽快完善个人信息。如已完善请忽略","完善个人信息"+s,user.getId()));
        studentService.addStudent(new Student(null,null,String.valueOf(rand.nextLong(3999999)+2020000000),null,null,null,null,null,user.getId(),null,0));
        return Result.success("新增用户成功");
    }

    @PutMapping
    public Result<?> updateUser(@RequestBody User user){
        user.setPassword(null);
        userService.updateUser(user);
        return Result.success("修改用户成功");
    }


    @GetMapping("/{id}")
    public Result<User> getUserById(@PathVariable("id") Integer id){
        User user = userService.getUserById(id);
        return Result.success(user);
    }

    @GetMapping("/money/{id}")
    public Result<Integer> getUserMoney(@PathVariable("id") Integer id){
        User user = userService.getUserById(id);
        Integer money = user.getMoney();
        return Result.success(money);
    }

    @GetMapping("/phone/{id}")
    public Result<Integer> getUserPhone(@PathVariable("id") Integer id){
        User user = userService.getUserById(id);
        String phone = user.getPhone();
        if(phone!=null)
            return Result.success(1);
        else
            return Result.success(0);
    }
    @GetMapping("/status/{id}")
    public Result<Integer> getUserStatus(@PathVariable("id") Integer id){
        User user = userService.getUserById(id);
        Integer status = user.getStatus();
        return Result.success(status);
    }

    @DeleteMapping("/{id}")
    public Result<User> deleteUserById(@PathVariable("id") Integer id){
        Student st = studentService.getStudentByUserId(id);

        studentService.deleteStudentById(st.getStudentId());
        userService.deleteUserById(id);
        return Result.success("删除用户成功");
    }

    @PostMapping("/recharge")
    public Result<?> rechargeById(@RequestParam(value = "money",required = false) Integer money,
                                  @RequestParam(value = "id",required = false) Integer id){
        User user  = userService.getUserById(id);
        Student st = studentService.getStudentByUserId(id);
        if(money>1000){
            return Result.fail("单笔充值不能多于1000元");
        }
        else {
            if(user.getStatus()==1){
                user.setMoney(user.getMoney()+money*1);
                LocalDate date=LocalDate.now();
                String s = date.toString();
                recordMapper.insert(new Record(null,money*1,"充值",id,st.getStudentName(),s,1,0));
                userService.updateUser(user);
                System.out.println(money);
                return Result.success("充值成功");

            }
            else return Result.fail("您目前处于挂失状态，无法进行充值");
        }


    }

    @PostMapping("/password")
    public Result<?> changePassword(@RequestParam(value = "oldPassword",required = false) String oldPassword,
                                    @RequestParam(value = "newPassword",required = false) String newPassword,
                                    @RequestParam(value = "newPassword2",required = false) String newPassword2,
                                  @RequestParam(value = "id",required = false) Integer id){
        User user  = userService.getUserById(id);
       if(passwordEncoder.matches(oldPassword,user.getPassword())){
           if(newPassword.equals(newPassword2)){
               user.setPassword(passwordEncoder.encode(newPassword));
               userService.updateUser(user);
               return Result.success("修改密码成功");
           }
           else return Result.fail("两个新密码不同");
       }
       else return Result.fail("原密码不正确");

    }

    @PostMapping("/loss")
    public Result<?> updateLoss(@RequestParam(value = "oldPassword",required = false) String oldPassword,
                                @RequestParam(value = "id",required = false) Integer id){
        User user = userService.getUserById(id);
        LocalDate date=LocalDate.now();
        String s = date.toString();
        if(passwordEncoder.matches(oldPassword,user.getPassword())) {
            if(user.getStatus()==1){
                user.setStatus(0);
                userService.updateUser(user);
                informationMapper.insert(new Information(null,"您于"+s+"进行了挂失操作，请确保是本人所操作","挂失"+s,user.getId()));
                return Result.success("挂失成功");
            }
            else{
                if(user.getPhone()!=null)
                    return Result.fail("你已挂失，请勿重复挂失");
                else
                    return Result.fail("请先完善个人信息");

            }

        }
        else return Result.fail("密码错误，挂失失败");

    }
    @PostMapping("/release")
    public Result<?> updateStatus(@RequestParam(value = "oldPassword",required = false) String oldPassword,
                                @RequestParam(value = "id",required = false) Integer id){
        User user = userService.getUserById(id);
        LocalDate date=LocalDate.now();
        String s = date.toString();
        if(passwordEncoder.matches(oldPassword,user.getPassword())) {
            if(user.getStatus()==0){
                user.setStatus(1);
                userService.updateUser(user);
                informationMapper.insert(new Information(null,"您于"+s+"进行了解挂操作，请确保是本人所操作","解挂"+s,user.getId()));
                return Result.success("解挂成功");
            }
            else{

                return Result.fail("您目前不处于挂失状态，无法解挂");

            }

        }
        else return Result.fail("密码错误，解挂失败");

    }

    @PostMapping("/num")
    public Result<?> updateNum(@RequestParam(value = "oldPassword",required = false) String oldPassword,
                                @RequestParam(value = "id",required = false) Integer id){
        User user = userService.getUserById(id);
        Student st =studentService.getStudentByUserId(id);
        if(passwordEncoder.matches(oldPassword,user.getPassword())) {
            if(user.getStatus()==0){
                user.setStatus(1);
                Random rand = new Random();
                user.setNum(String.valueOf(rand.nextInt(89999999)+10000000));
                user.setMoney(user.getMoney()-10);
                userService.updateUser(user);
                LocalDate date=LocalDate.now();
                String s = date.toString();
                recordMapper.insert(new Record(null,10,"补卡",id,st.getStudentName(),s,1,0));
                informationMapper.insert(new Information(null,"您于"+s+"进行了补办操作，您的新校园卡号是"+user.getNum()+"请确保是本人所操作","补办"+s,user.getId()));
                return Result.success("补办成功");
            }
            else{

                return Result.fail("请先挂失再补办");

            }

        }
        else return Result.fail("密码错误，挂失失败");

    }


    @GetMapping("/export")
    public Result<?> exportExcel(){

        String filename = "C:\\Users\\haozongduo\\Desktop\\Campus Card\\消费记录.xlsx";
        List<Record>list = recordService.list();


        EasyExcel.write(filename,Record.class)
                .sheet("消费记录")
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

    @GetMapping("/export/{id}")
    public Result<?> exportSingleExcel(@PathVariable("id") Integer id){
        User user = userService.getUserById(id);
        Student st=studentService.getStudentByUserId(id);

        String filename = "C:\\Users\\haozongduo\\Desktop\\Campus Card\\"+st.getStudentName()+"-消费记录.xlsx";
        List<Record>list = recordMapper.selectByUserId(id);


        EasyExcel.write(filename,Record.class)
                .sheet(st.getStudentName()+"-消费记录")
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
