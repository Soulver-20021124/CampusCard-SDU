package com.card.sys.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.card.sys.entity.Good;
import com.card.sys.entity.Student;
import com.card.sys.entity.User;
import com.card.sys.entity.UserRole;
import com.card.sys.mapper.StudentMapper;
import com.card.sys.service.IStudentService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-28
 */
@Service
public class StudentServiceImpl extends ServiceImpl<StudentMapper, Student> implements IStudentService {

    @Override
    @Transactional
    public void addStudent(Student student) {

        this.baseMapper.insert(student);


    }

    @Override
    public Student getStudentById(Integer id) {
        Student student = this.baseMapper.selectById(id);
        return student;
    }

    @Override
    public Student getStudentByUserId(Integer id) {
        Student student = this.baseMapper.selectByUserId(id);
        return student;
    }

    @Override
    @Transactional
    public void updateStudent(Student student) {
        // 修改角色表
        this.baseMapper.updateById(student);

    }

    @Override
    public void deleteStudentById(Integer id) {
        this.baseMapper.deleteById(id);

    }

}
