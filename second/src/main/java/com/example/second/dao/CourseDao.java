package com.example.second.dao;

import com.example.second.entity.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;


@Mapper
@Component(value = "CourseDao")
public interface CourseDao {

    List<Course> findAllCourses();

    int deleteCourseById(Long uid);

    Course findCourseByNo(String no);

    int insert(Course course);

    int addCourse(Course course);

    Course selectByPrimaryKey(Long uid);

    int updateCourse(Course course);

    int updateByPrimaryKey(Course course);

    List<Course> findCourseByName(String name);

    Integer deleteCoursesByIds(@Param("ids") Integer[] ids);

    List<Map<String, Object>> findCourseName();
}
