package com.shixun.entity;

public class ExaminationQuestion {
    private Integer id;
    private Integer userId;
    private Integer subjectId;
    private String questionName;
    private String answer;
    private Integer correct;

    public ExaminationQuestion() {
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

    public String getQuestionName() {
        return this.questionName;
    }

    public void setQuestionName(String questionName) {
        this.questionName = questionName;
    }

    public String getAnswer() {
        return this.answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }

    public Integer getCorrect() {
        return this.correct;
    }

    public void setCorrect(Integer correct) {
        this.correct = correct;
    }
}
