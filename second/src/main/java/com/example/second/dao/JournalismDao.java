package com.example.second.dao;

import com.example.second.entity.Journalism;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Component;

import java.util.List;


@Mapper
@Component(value = "JournalismDao")
public interface JournalismDao {

    List<Journalism> findAllJournalisms();

    int deleteJournalismById(Long uid);

    int insert(Journalism journalism);

    int addJournalism(Journalism journalism);

    Journalism selectByPrimaryKey(Long uid);

    int updateJournalism(Journalism journalism);

    int updateByPrimaryKey(Journalism journalism);

    List<Journalism> findJournalismByTitle(String name);

    Integer deleteJournalismsByIds(@Param("ids") Integer[] ids);

    int getCountJournalisms();
}
