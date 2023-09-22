package com.shixun.entity;

public class QuestionTemplate {
    private Integer id;
    private String templateName;
    private Integer majorId;
    private Integer subjectId;
    private Integer singleNum;
    private Integer singleScore;
    private String singleDifficultyProportion;
    private Integer multipleNum;
    private Integer multipleScore;
    private String multipleDifficultyProportion;
    private Integer aggregateScore;

    public QuestionTemplate() {
    }

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTemplateName() {
        return this.templateName;
    }

    public void setTemplateName(String templateName) {
        this.templateName = templateName;
    }

    public Integer getMajorId() {
        return this.majorId;
    }

    public void setMajorId(Integer majorId) {
        this.majorId = majorId;
    }

    public Integer getSubjectId() {
        return this.subjectId;
    }

    public void setSubjectId(Integer subjectId) {
        this.subjectId = subjectId;
    }

    public Integer getSingleNum() {
        return this.singleNum;
    }

    public void setSingleNum(Integer singleNum) {
        this.singleNum = singleNum;
    }

    public Integer getSingleScore() {
        return this.singleScore;
    }

    public void setSingleScore(Integer singleScore) {
        this.singleScore = singleScore;
    }

    public String getSingleDifficultyProportion() {
        return this.singleDifficultyProportion;
    }

    public void setSingleDifficultyProportion(String singleDifficultyProportion) {
        this.singleDifficultyProportion = singleDifficultyProportion;
    }

    public Integer getMultipleNum() {
        return this.multipleNum;
    }

    public void setMultipleNum(Integer multipleNum) {
        this.multipleNum = multipleNum;
    }

    public Integer getMultipleScore() {
        return this.multipleScore;
    }

    public void setMultipleScore(Integer multipleScore) {
        this.multipleScore = multipleScore;
    }

    public String getMultipleDifficultyProportion() {
        return this.multipleDifficultyProportion;
    }

    public void setMultipleDifficultyProportion(String multipleDifficultyProportion) {
        this.multipleDifficultyProportion = multipleDifficultyProportion;
    }

    public Integer getAggregateScore() {
        return this.aggregateScore;
    }

    public void setAggregateScore(Integer aggregateScore) {
        this.aggregateScore = aggregateScore;
    }
}
