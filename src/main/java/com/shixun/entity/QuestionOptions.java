package com.shixun.entity;

public class QuestionOptions {
    private Integer id;
    private String questionCode;
    private String optionsText;
    private String optionsCode;

    public QuestionOptions() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getQuestionCode() {
        return this.questionCode;
    }

    public void setQuestionCode(String questionCode) {
        this.questionCode = questionCode;
    }

    public String getOptionsText() {
        return this.optionsText;
    }

    public void setOptionsText(String optionsText) {
        this.optionsText = optionsText;
    }

    public String getOptionsCode() {
        return this.optionsCode;
    }

    public void setOptionsCode(String optionsCode) {
        this.optionsCode = optionsCode;
    }
}
