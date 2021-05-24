package com.example.second.entity;

import java.io.Serializable;

/**
 * (CourseCopy)实体类
 *
 * @author makejava
 * @since 2021-05-21 17:47:45
 */
public class CourseCopy implements Serializable {
    private static final long serialVersionUID = -29148402212942114L;
    /**
     * 课程编号
     */
    private String courseNo;
    /**
     * 课程名称
     */
    private String courseName;
    /**
     * 课程分类
     */
    private String courseClassify;


    public String getCourseNo() {
        return courseNo;
    }

    public void setCourseNo(String courseNo) {
        this.courseNo = courseNo;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getCourseClassify() {
        return courseClassify;
    }

    public void setCourseClassify(String courseClassify) {
        this.courseClassify = courseClassify;
    }

}
