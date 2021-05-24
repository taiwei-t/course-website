package com.example.second.service.impl;

import com.example.second.dao.CourseDao;
import com.example.second.entity.Course;
import com.example.second.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service
//@Transactional(rollbackFor = Exception.class)
public class CourseServiceBean implements CourseService {

    @Autowired
    private CourseDao courseDao;
    

    public List<Course> findAllCourses() {
        return this.courseDao.findAllCourses();
    }


    @Transactional
    public void addCourse(Course course) {
        this.courseDao.addCourse(course);
    }

    public void deleteCourseById(Long uid) {
        this.courseDao.deleteCourseById(uid);

    }

    public void updateCourse(Course course) {
        this.courseDao.updateCourse(course);
    }

    public List<Course> findCourseByName(String name) {
        return this.courseDao.findCourseByName(name);
    }

    public Integer deleteCoursesByIds(Integer[] ids) {
        return this.courseDao.deleteCoursesByIds(ids);
    }

    @Override
    public Course findCourseByNo(String no) {
        return this.courseDao.findCourseByNo(no);
    }

    @Override
    public List<Map<String, Object>> findCourseName() {
        return this.courseDao.findCourseName();
    }

}
