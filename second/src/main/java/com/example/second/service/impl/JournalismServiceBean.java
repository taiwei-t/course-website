package com.example.second.service.impl;

import com.example.second.dao.JournalismDao;
import com.example.second.entity.Journalism;
import com.example.second.exception.ValidateException;
import com.example.second.service.JournalismService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;


@Service

public class JournalismServiceBean implements JournalismService {

    @Autowired
    private JournalismDao journalismDao;

    public List<Journalism> findAllJournalisms() {
        return this.journalismDao.findAllJournalisms();
    }

    @Transactional
    public void addJournalism(Journalism journalism) {
        List<String> errors = errors(journalism);
        if (errors.size() == 0) {
            this.journalismDao.addJournalism(journalism);
        } else {
            throw new ValidateException("500", errors.toString());
        }
    }

    public void deleteJournalismById(Long uid) { this.journalismDao.deleteJournalismById(uid); }

    public void updateJournalism(Journalism journalism) {
        List<String> errors = errors(journalism);
        if (errors.size() == 0) {
            this.journalismDao.updateJournalism(journalism);
        } else {
            throw new ValidateException("500", errors.toString());
        }
    }

    public Journalism findJournalismByTitle(String title) {
        return this.journalismDao.findJournalismByTitle(title);
    }

    public Integer deleteJournalismsByIds(Integer[] ids) {
        return this.journalismDao.deleteJournalismsByIds(ids);
    }
    public List<String> errors(Journalism journalism) {
        List<String> errors = new ArrayList<>();

        if (journalism.gettitle() == null || journalism.gettitle().equals(""))
            errors.add("标题不能为空");

        if (journalism.getcontent() == null || journalism.getcontent().equals(""))
            errors.add("内容不能为空");

        if (journalism.getAuthor() == null || journalism.getAuthor().equals(""))
            errors.add("作者不能为空");
        if (journalism.getAuthor().length() < 2 || journalism.getAuthor().length() > 20)
            errors.add("作者长度为2到20个字符");
        if (!journalism.getAuthor().matches("^[\\u4e00-\\u9fa5]+$"))
            errors.add("作者必须是中文");

        return errors;
    }
}
