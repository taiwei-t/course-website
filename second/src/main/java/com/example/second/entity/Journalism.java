package com.example.second.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Journalism {

    private Long uid;

    private String title;
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    private String pubDate;

    private String content;

    private String author;

    public Long getUid() {
        return uid;
    }

    public void setUid(Long uid) {
        this.uid = uid;
    }

    public String gettitle() {
        return title;
    }

    public void settitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    public String getpubDate() {
        return pubDate;
    }

    public void setpubDate(Date pubDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        this.pubDate = pubDate == null ? null : sdf.format(pubDate);
    }

    public String getcontent() {
        return content;
    }

    public void setcontent(String content) {
        this.content = content == null ? null : content.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

}
