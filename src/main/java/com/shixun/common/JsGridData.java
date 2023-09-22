package com.shixun.common;

import java.util.List;

public class JsGridData {
    private Integer pageIndex;
    private Integer pageSize;
    private Integer offset;
    private List<?> data;
    private Long itemsCount;
    private String search;

    public JsGridData() {
    }

    public String getSearch() {
        return this.search;
    }

    public void setSearch(String search) {
        this.search = search;
    }

    public List<?> getData() {
        return this.data;
    }

    public void setData(List<?> data) {
        this.data = data;
    }

    public Long getItemsCount() {
        return this.itemsCount;
    }

    public void setItemsCount(Long itemsCount) {
        this.itemsCount = itemsCount;
    }

    public Integer getOffset() {
        this.offset = (this.pageIndex - 1) * this.pageSize;
        return this.offset;
    }

    public void setOffset(Integer offset) {
        this.offset = offset;
    }

    public Integer getPageIndex() {
        return this.pageIndex;
    }

    public void setPageIndex(Integer pageIndex) {
        this.pageIndex = pageIndex;
    }

    public Integer getPageSize() {
        return this.pageSize;
    }

    public void setPageSize(Integer pageSize) {
        this.pageSize = pageSize;
    }
}
