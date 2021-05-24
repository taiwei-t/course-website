package com.example.second.service;

import com.example.second.entity.Journalism;

import java.util.List;


public interface JournalismService {

    public List<Journalism> findAllJournalisms();

    public void addJournalism(Journalism journalism);

    public void deleteJournalismById(Long uid);

    public void updateJournalism(Journalism journalism);

    Journalism findJournalismByTitle(String title);

    public Integer deleteJournalismsByIds(Integer[] ids);
}
