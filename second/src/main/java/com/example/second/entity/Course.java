package com.example.second.entity;

import java.sql.Date;

public class Course {

    private Long uid;

    private String course_no;

    private String course_name;

    private String course_brief;

    private Date curriculum_time;

    private Date session_time;

    private String course_classify;

    private Long teacher_id;

    private String textbook;

    private Teacher teacher;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getCourse_no() {
        return course_no;
    }

    public void setCourse_no(String course_no) {
        this.course_no = course_no;
    }

    public String getCourse_name() {
        return course_name;
    }

    public void setCourse_name(String course_name) {
        this.course_name = course_name;
    }

    public String getCourse_brief() {
        return course_brief;
    }

    public void setCourse_brief(String course_brief) {
        this.course_brief = course_brief;
    }

    public Date getCurriculum_time() {
        return curriculum_time;
    }

    public void setCurriculum_time(Date curriculum_time) {
        this.curriculum_time = curriculum_time;
    }

    public Date getSession_time() {
        return session_time;
    }

    public void setSession_time(Date session_time) {
        this.session_time = session_time;
    }

    public String getCourse_classify() {
        return course_classify;
    }

    public void setCourse_classify(String course_classify) {
        this.course_classify = course_classify;
    }


    public String getTextbook() {
        return textbook;
    }

    public void setTextbook(String textbook) {
        this.textbook = textbook;
    }

    public Long getTeacher_id() {
        return teacher_id;
    }

    public void setTeacher_id(Long teacher_id) {
        this.teacher_id = teacher_id;
    }

    public Teacher getTeacher() {
        return teacher;
    }

    public void setTeacher(Teacher teacher) {
        this.teacher = teacher;
    }
}
