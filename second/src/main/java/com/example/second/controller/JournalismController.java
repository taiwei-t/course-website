package com.example.second.controller;


import com.example.second.entity.Journalism;
import com.example.second.service.MenuService;
import com.example.second.service.JournalismService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/journalism")
@CrossOrigin(allowCredentials = "true")
public class JournalismController {

    @Autowired
    private JournalismService journalismService;

    @Autowired
    MenuService menuService;

    /**
     * 查询所有新闻
     */
    @GetMapping("/findAllJournalisms")
    public List<Journalism> findAllJournalisms() {
        return this.journalismService.findAllJournalisms();
    }

    /**
     * 增加新闻
     */
    @PostMapping("/addJournalism")
    public void addJournalism(@RequestBody Journalism journalism) {
        this.journalismService.addJournalism(journalism);
    }

    /**
     * 根据新闻id删除新闻
     */
    @PostMapping("/deleteJournalism")
    public void deleteJournalismById(@RequestParam Long uid) {
        this.journalismService.deleteJournalismById(uid);
    }

    /**
     * 编辑新闻
     */
    @PostMapping("/updateJournalism")
    public void updateJournalism(@RequestBody Journalism journalism) {
        this.journalismService.updateJournalism(journalism);
    }

    /**
     * 根据标题查找新闻
     */
    @GetMapping("/findJournalismByTitle")
    public List<Journalism> findJournalismByTitle(@RequestParam String title) {
        return this.journalismService.findJournalismByTitle(title);
    }

    /**
     * 批量删除新闻
     */
    @PostMapping("/deleteJournalismsByIds")
    public Integer deleteJournalismsByIds(Integer[] ids) {
        return this.journalismService.deleteJournalismsByIds(ids);
    }
}
