package com.example.second.service;

import com.example.second.entity.Course;

import java.util.List;
import java.util.Map;


public interface CourseService {

    public List<Course> findAllCourses();

    public void addCourse(Course sourse);

    public void deleteCourseById(Long uid);

    public void updateCourse(Course sourse);

    List<Course> findCourseByName(String name);

    public Integer deleteCoursesByIds(Integer[] ids);

    Course findCourseByNo(String no);

    List<Map<String, Object>> findCourseName();
}
