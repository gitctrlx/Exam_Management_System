//
// Source code recreated from a .class file by IntelliJ IDEA
// (powered by FernFlower decompiler)
//

package com.shixun.entity;

import java.util.Date;

public class Score {
    private Integer id;
    private Integer userId;
    private Integer subjectId;
    private Integer score;
    private Date answer;

    public Score() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return this.userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getSubjectId() {
        return this.subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getScore() {
        return this.score;
    }

    public void setScore(Integer score) {
        this.score = score;
    }

    public Date getAnswer() {
        return this.answer;
    }

    public void setAnswer(Date answer) {
        this.answer = answer;
    }
}
