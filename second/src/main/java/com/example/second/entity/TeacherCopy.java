package com.example.second.entity;

import java.io.Serializable;

/**
 * (TeacherCopy)实体类
 *
 * @author makejava
 * @since 2021-05-21 18:10:53
 */
public class TeacherCopy implements Serializable {
    /**
     * 工号
     */
    private Long uid;
    /**
     * 姓名
     */
    private String name;

    /**
     * 职称
     */
    private String rank;

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

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }
}
