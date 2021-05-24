package com.example.second.service.impl;

import com.example.second.dao.TeacherDao;
import com.example.second.entity.Teacher;
import com.example.second.exception.ValidateException;
import com.example.second.service.TeacherService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * (Teacher)表服务实现类
 *
 * @author makejava
 * @since 2021-03-09 17:48:40
 */
@Service("teacherService")
public class TeacherServiceImpl implements TeacherService {
    @Resource
    private TeacherDao teacherDao;

    @Override
    public Integer deleteTeacherByIds(Integer[] ids) {
        return this.teacherDao.deleteTeacherByIds(ids);
    }

    @Override
    public Teacher findTeacherById(Long uid) {
        return this.teacherDao.queryById(uid);
    }

    @Override
    public List<Map<String, Object>> findTeacherName() {
        return this.teacherDao.findTeacherName();
    }

    @Override
    public List<Teacher> findAllTeachers() {
        return this.teacherDao.findAllTeachers();
    }

    @Override
    public List<Teacher> findTeacherByName(String name) {
        return this.teacherDao.findTeacherByName(name);
    }

    /**
     * 通过ID查询单条数据
     *
     * @param uid 主键
     * @return 实例对象
     */
    @Override
    public Teacher queryById(Long uid) {
        return this.teacherDao.queryById(uid);
    }

    /**
     * 新增数据
     *
     * @param teacher 实例对象
     * @return 实例对象
     */
    @Override
    public Teacher insert(Teacher teacher) {
        List<String> errors = errors(teacher);
        if (errors.size() == 0) {
            this.teacherDao.insert(teacher);
            return teacher;
        } else {
            throw new ValidateException("500", errors.toString());
        }
    }

    /**
     * 修改数据
     *
     * @param teacher 实例对象
     * @return 实例对象
     */
    @Override
    public Teacher update(Teacher teacher) {
        List<String> errors = errors(teacher);
        if (errors.size() == 0) {
            this.teacherDao.update(teacher);
            return this.queryById(teacher.getUid());
        } else {
            throw new ValidateException("500", errors.toString());
        }
    }

    /**
     * 通过主键删除数据
     *
     * @param uid 主键
     * @return 是否成功
     */
    @Override
    public boolean deleteById(Long uid) {
        return this.teacherDao.deleteById(uid) > 0;
    }

    public List<String> errors(Teacher teacher) {
        List<String> errors = new ArrayList<>();
        // uid
        if (teacher.getUid() == null || teacher.getUid() <= 0)
            errors.add("工号不能为空");
        // name
        if (teacher.getName() == null || teacher.getName().equals(""))
            errors.add("姓名不能为空");
        if (teacher.getName().length() < 2 || teacher.getName().length() > 20)
            errors.add("姓名长度为2到20个字符");
        if (!teacher.getName().matches("^[\\u4e00-\\u9fa5]+$"))
            errors.add("姓名必须是中文");
        // age
        if (teacher.getAge() == null)
            errors.add("年龄不能为空");
        if (teacher.getAge() < 18 || teacher.getAge() > 80)
            errors.add("年龄范围应在18-80之内");
        // sex
        if (teacher.getSex() == null || teacher.getSex().equals(""))
            errors.add("性别不能为空");
        // party
        if (teacher.getParty() == null)
            errors.add("入党情况不能为空");
        // address
        if (teacher.getAddress() == null || teacher.getAddress().equals(""))
            errors.add("家庭住址不能为空");
        // phone
        if (teacher.getPhone() == null || teacher.getPhone().equals(""))
            errors.add("手机号不能为空");
        if (!teacher.getPhone().matches("^1[1356789]\\d{9}$"))
            errors.add("手机号不正确");
        // email
        if (teacher.getEmil() == null || teacher.getEmil().equals(""))
            errors.add("电子邮箱不能为空");
        if (!teacher.getEmil().matches("^[\\w.+-]+@[\\w-]+(\\.[\\w-]+)+$"))
            errors.add("电子邮箱不正确");
        // rank
        if (teacher.getRank() == null || teacher.getRank().equals(""))
            errors.add("职称不能为空");
        // degree
        if (teacher.getDegree() == null || teacher.getDegree().equals(""))
            errors.add("学位不能为空");
        // course
        if (teacher.getCourse() == null || teacher.getCourse().equals(""))
            errors.add("所授课程不能为空");
        // hiredate
        Date d = new Date(System.currentTimeMillis());
        if (teacher.getHiredate().compareTo(d) != -1)
            errors.add("入职日期应小于等于当前日期");
        // evaluation
        if (teacher.getEvaluation() == null)
            errors.add("评价不能为空");
        if (teacher.getEvaluation() < 0 || teacher.getEvaluation() > 5)
            errors.add("评价必须是0-5");
        // research
        if (teacher.getResearch() == null || teacher.getResearch().equals(""))
            errors.add("研究方向不能为空");
        // hobby
        if (teacher.getHobby() == null || teacher.getHobby().equals(""))
            errors.add("爱好不能为空");
        // college
        if (teacher.getCollege() == null || teacher.getCollege().equals(""))
            errors.add("学院不能为空");

        return errors;
    }
}
