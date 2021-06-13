package com.example.second.entity;

import java.sql.Date;

/**
 * (Teacher)实体类
 *
 * @author makejava
 * @since 2021-03-09 17:48:37
 */
public class Teacher {

    /**
     * 工号
     */
    private Long uid;
    /**
     * 姓名
     */
//    @NotBlank(message = "姓名不能为空")
//    @Length(min = 2, max = 20, message = "姓名长度为2到20个字符")
//    @Pattern(regexp = "^[\\u4e00-\\u9fa5]+$", message = "姓名必须是中文")
    private String name;
    /**
     * 年龄
     */
//    @NotNull(message = "年龄不能为空")
//    @Range(min = 18, max = 80, message = "年龄范围应在18-80之内")
    private Integer age;
    /**
     * 性别
     */
//    @NotBlank(message = "性别不能为空")
    private String sex;
    /**
     * 入党情况
     */
//    @NotNull(message = "入党情况不能为空")
    private Boolean party;
    /**
     * 家庭住址
     */
//    @NotBlank(message = "家庭住址不能为空")
    private String address;
    /**
     * 手机号码
     */
//    @NotBlank(message = "手机号不能为空")
//    @Pattern(regexp = "^1[1356789]\\d{9}$", message = "手机号不正确")
    private String phone;
    /**
     * 电子邮箱
     */
//    @NotBlank(message = "电子邮箱不能为空")
//    @Email(message = "电子邮箱格式不正确")
    private String emil;
    /**
     * 职称
     */
//    @NotBlank(message = "职称不能为空")
    private String rank;
    /**
     * 学位
     */
//    @NotBlank(message = "学位不能为空")
    private String degree;
    /**
     * 所授课程
     */
//    @NotBlank(message = "所授课程不能为空")
    private String course;
    /**
     * 个人简介
     */
    private String brief;
    /**
     * 入职时间
     */
//    @Past(message = "入职时间必须是今天及之前的日期")
    private Date hiredate;
    /**
     * 能力评价
     */
//    @NotNull(message = "能力评价不能为空")
//    @Range(min = 0, max = 5, message = "评价必须是0-5")
    private Integer evaluation;

    /**
     * 研究方向
     */
//    @NotBlank(message = "研究方向不能为空")
    private String research;

    /**
     * 爱好
     */
//    @NotBlank(message = "爱好不能为空")
    private String hobby;

    /**
     * 学院
     */
//    @NotBlank(message = "学院不能为空")
    private String college;

    private String picture_path;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Boolean getParty() {
        return party;
    }

    public void setParty(Boolean party) {
        this.party = party;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmil() {
        return emil;
    }

    public void setEmil(String emil) {
        this.emil = emil;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getDegree() {
        return degree;
    }

    public void setDegree(String degree) {
        this.degree = degree;
    }

    public String getCourse() {
        return course;
    }

    public void setCourse(String course) {
        this.course = course;
    }

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
    }

    public Date getHiredate() {
        return hiredate;
    }

    public void setHiredate(Date hiredate) {
        this.hiredate = hiredate;
    }

    public Integer getEvaluation() {
        return evaluation;
    }

    public void setEvaluation(Integer evaluation) {
        this.evaluation = evaluation;
    }

    public String getResearch() {
        return research;
    }

    public void setResearch(String research) {
        this.research = research;
    }

    public String getHobby() {
        return hobby;
    }

    public void setHobby(String hobby) {
        this.hobby = hobby;
    }

    public String getCollege() {
        return college;
    }

    public void setCollege(String college) {
        this.college = college;
    }

    public String getPicture_path() {
        return picture_path;
    }

    public void setPicture_path(String picture_path) {
        this.picture_path = picture_path;
    }
}
