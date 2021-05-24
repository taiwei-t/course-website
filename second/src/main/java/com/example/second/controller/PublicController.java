package com.example.second.controller;


import com.example.second.entity.Course;
import com.example.second.entity.CourseCopy;
import com.example.second.entity.Teacher;
import com.example.second.entity.TeacherCopy;
import com.example.second.service.CourseCopyService;
import com.example.second.service.CourseService;
import com.example.second.service.TeacherCopyService;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/public")
@CrossOrigin(allowCredentials = "true")
public class PublicController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private TeacherService teacherService;

    @Autowired
    private CourseCopyService courseCopyService;

    @Autowired
    private TeacherCopyService teacherCopyService;

    /**
     * 查询所有课程
     */
    @GetMapping("/findAllCourse")
    public List<Map<String, Object>> findAllCourse() {
        return this.courseService.findCourseName();
    }
    /**
     * 根据id查询课程
     */
    @GetMapping("/findCourseByNo")
    public Course findCourseByNo(@RequestParam String no) {
        return this.courseService.findCourseByNo(no);
    }

    /**
     * 查询所有推荐课程
     */
    @GetMapping("/findRecommendCourses")
    public List<CourseCopy> findRecommendCourses() {
        return this.courseCopyService.queryAll();
    }

    /**
     * 查询所有优秀教授
     */
    @GetMapping("/findExcellentTeacher")
    public List<TeacherCopy> findExcellentTeacher() {
        return this.teacherCopyService.queryAll();
    }
    /**
     * 根据id查询教师
     */
    @GetMapping("/findTeacherById")
    public Teacher findTeacherById(@RequestParam Long uid) {
        return this.teacherService.findTeacherById(uid);
    }

    /**
     * 查询所有教师
     */
    @GetMapping("/findAllTeacher")
    public List<Map<String, Object>> findTeacherName() {
        return teacherService.findTeacherName();
    }
}
