package com.example.second.service.impl;

import com.example.second.entity.CourseCopy;
import com.example.second.dao.CourseCopyDao;
import com.example.second.service.CourseCopyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * (CourseCopy)表服务实现类
 *
 * @author makejava
 * @since 2021-05-21 17:47:49
 */
@Service("courseCopyService")
public class CourseCopyServiceImpl implements CourseCopyService {
    @Resource
    private CourseCopyDao courseCopyDao;

    @Override
    public List<CourseCopy> queryAll() {
        return this.courseCopyDao.queryAll();
    }

}
