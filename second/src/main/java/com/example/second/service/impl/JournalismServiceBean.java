package com.example.second.service.impl;

//import com.example.second.dao.JournalismCopyDao;
//import com.example.second.dao.JournalismCountDao;
import com.example.second.dao.JournalismDao;
import com.example.second.entity.Journalism;
//import com.example.second.entity.JournalismCount;
import com.example.second.service.JournalismService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


@Service
//@Transactional(rollbackFor = Exception.class)
public class JournalismServiceBean implements JournalismService {

    @Autowired
    private JournalismDao journalismDao;

//    @Autowired
//    private JournalismCountDao journalismCountDao;

//    @Autowired
//    JournalismCopyDao journalismCopyDao;

    public List<Journalism> findAllJournalisms() {
        return this.journalismDao.findAllJournalisms();
    }


    @Transactional
    public void addJournalism(Journalism journalism) {
        this.journalismDao.addJournalism(journalism);
//        this.journalismCopyDao.addJournalism(journalism);
        Integer count = this.journalismDao.getCountJournalisms();
        //没有加@Transactional注解，万一出现错误，新增人数会成功，但是学生表的总人数没有改变，出现了数据的不一致。
//        int x = 5 / 0;
//        this.journalismCountDao.addCount(count);
    }

    public void deleteJournalismById(Long uid) {
        this.journalismDao.deleteJournalismById(uid);
        Integer count = this.journalismDao.getCountJournalisms();
//        this.journalismCountDao.addCount(count);
    }

    public void updateJournalism(Journalism journalism) {
        this.journalismDao.updateJournalism(journalism);
    }

    public List<Journalism> findJournalismByTitle(String title) {
        return this.journalismDao.findJournalismByTitle(title);
    }

    public Integer deleteJournalismsByIds(Integer[] ids) {
        return this.journalismDao.deleteJournalismsByIds(ids);
    }

}
