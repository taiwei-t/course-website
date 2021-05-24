package com.example.second.service;

import com.example.second.entity.Teacher;

import java.util.List;
import java.util.Map;

/**
 * (Teacher)表服务接口
 *
 * @author makejava
 * @since 2021-03-09 17:48:39
 */
public interface TeacherService {

    List<Teacher> findAllTeachers();

    /**
     * 通过ID查询单条数据
     *
     * @param uid 主键
     * @return 实例对象
     */
    Teacher queryById(Long uid);

    /**
     * 新增数据
     *
     * @param teacher 实例对象
     * @return 实例对象
     */
    Teacher insert(Teacher teacher);

    /**
     * 修改数据
     *
     * @param teacher 实例对象
     * @return 实例对象
     */
    Teacher update(Teacher teacher);

    /**
     * 通过主键删除数据
     *
     * @param uid 主键
     * @return 是否成功
     */
    boolean deleteById(Long uid);

    List<Teacher> findTeacherByName(String name);

    Integer deleteTeacherByIds(Integer[] ids);

    Teacher findTeacherById(Long uid);

    List<Map<String, Object>> findTeacherName();
}
