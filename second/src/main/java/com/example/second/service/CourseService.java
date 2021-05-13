package com.example.second.service;

import com.example.second.entity.Course;

import java.util.List;


public interface CourseService {

    public List<Course> findAllCourses();

    public void addCourse(Course sourse);

    public void deleteCourseById(Long uid);

    public void updateCourse(Course sourse);

    List<Course> findCourseByName(String name);

    public Integer deleteCoursesByIds(Integer[] ids);
}
