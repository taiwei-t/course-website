package com.example.second.service.impl;

import com.example.second.entity.TeacherCopy;
import com.example.second.dao.TeacherCopyDao;
import com.example.second.service.TeacherCopyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (TeacherCopy)表服务实现类
 *
 * @author makejava
 * @since 2021-05-21 18:10:53
 */
@Service("teacherCopyService")
public class TeacherCopyServiceImpl implements TeacherCopyService {
    @Resource
    private TeacherCopyDao teacherCopyDao;

    @Override
    public List<TeacherCopy> queryAll() {
        return this.teacherCopyDao.queryAll();
    }

}
