package com.example.second.dao;

import com.example.second.entity.CourseCopy;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Component;

import java.util.List;

/**
 * (CourseCopy)表数据库访问层
 *
 * @author makejava
 * @since 2021-05-21 17:47:46
 */
@Mapper
@Component(value = "CourseCopyDao")
public interface CourseCopyDao {

    List<CourseCopy> queryAll();
}

