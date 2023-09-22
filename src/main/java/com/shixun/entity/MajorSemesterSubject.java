package com.shixun.entity;

public class MajorSemesterSubject {
    private Integer majorSemesterId;
    private Integer subjectId;

    public MajorSemesterSubject() {
    }

    public Integer getMajorSemesterId() {
        return this.majorSemesterId;
    }

    public void setMajorSemesterId(Integer majorSemesterId) {
        this.majorSemesterId = majorSemesterId;
    }

    public Integer getSubjectId() {
        return this.subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }
}
