package com.card.sys.service;

import com.card.sys.entity.Student;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author baomidou
 * @since 2023-08-28
 */
public interface IStudentService extends IService<Student> {

    void addStudent(Student student);

    Student getStudentById(Integer id);

    void updateStudent(Student st);

    Student getStudentByUserId(Integer id);

    void deleteStudentById(Integer id);
}
