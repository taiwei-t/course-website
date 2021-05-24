package com.example.second.dao;

import com.example.second.entity.Teacher;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

/**
 * (Teacher)表数据库访问层
 *
 * @author makejava
 * @since 2021-03-09 17:48:38
 */
@Mapper
@Component(value = "TeacherDao")
public interface TeacherDao {

    /**
     * 通过ID查询单条数据
     *
     * @param uid 主键
     * @return 实例对象
     */
    Teacher queryById(Long uid);

    List<Teacher> findAllTeachers();

    List<Map<String, Object>> findTeacherName();

    List<Teacher> findTeacherByName(String name);

    Integer deleteTeacherByIds(Integer[] ids);

    /**
     * 新增数据
     *
     * @param teacher 实例对象
     * @return 影响行数
     */
    int insert(Teacher teacher);

    /**
     * 修改数据
     *
     * @param teacher 实例对象
     * @return 影响行数
     */
    int update(Teacher teacher);

    /**
     * 通过主键删除数据
     *
     * @param uid 主键
     * @return 影响行数
     */
    int deleteById(Long uid);

}

