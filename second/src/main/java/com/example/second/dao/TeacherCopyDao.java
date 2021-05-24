package com.example.second.dao;

import com.example.second.entity.TeacherCopy;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * (TeacherCopy)表数据库访问层
 *
 * @author makejava
 * @since 2021-05-21 18:10:53
 */
@Mapper
@Component(value = "TeacherCopyDao")
public interface TeacherCopyDao {

    List<TeacherCopy> queryAll();

}

