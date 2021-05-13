package com.example.second.controller;

import com.example.second.entity.Teacher;
import com.example.second.service.MenuService;
import com.example.second.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * (Teacher)表控制层
 *
 * @author makejava
 * @since 2021-03-09 17:48:40
 */
@RestController
@RequestMapping("/teacher")
@CrossOrigin(allowCredentials = "true")
public class TeacherController {
    /**
     * 服务对象
     */
    @Autowired
    private TeacherService teacherService;

    @Autowired
    MenuService menuService;

    @PostMapping("/deleteTeachersByIds")
    public Integer deleteTeachersByIds(@RequestParam Integer[] ids) {
        return this.teacherService.deleteTeacherByIds(ids);
    }

    @GetMapping("/findAllTeachers")
    public List<Teacher> findAllTeachers() {
        return this.teacherService.findAllTeachers();
    }

    @PostMapping("/addTeacher")
    public void addTeacher(@RequestBody Teacher teacher) {
        this.teacherService.insert(teacher);
    }

    @PostMapping("/updateTeacher")
    public void updateTeacher(@RequestBody Teacher teacher) {
        this.teacherService.update(teacher);
    }

    @PostMapping("/deleteTeacher")
    public void deleteTeacher(@RequestParam Long uid) {
        this.teacherService.deleteById(uid);
    }

    @GetMapping("/findTeacherByName")
    public List<Teacher> findTeacherByName(@RequestParam String name) {
        return this.teacherService.findTeacherByName(name);
    }

}
