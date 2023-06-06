package com.jiwoong.springex.util;

import lombok.Builder;
import lombok.Getter;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
public class PageResponseDTO<E> {

    private int pageNum;
    private int amount;
    private int total;

    //시작 페이지 번호
    private int start;
    //끝 페이지 번호
    private int end;

    // 페이징  페이지 개수
    private int pageCount;

    // 이전 페이지의 존재 여부
    private boolean prev;
    // 다음 페이지의 존재 여부
    private boolean next;

    private List<E> dtoList;

    @Builder(builderMethodName = "withAll")
    public PageResponseDTO(PageRequestDTO pageRequestDTO, List<E> dtoList, int total) {


        this.pageNum = pageRequestDTO.getPageNum();
        this.amount = pageRequestDTO.getAmount();

        this.total = total;
        this.dtoList = dtoList;
        this.pageCount = 10;

        this.end = (int) (Math.ceil(this.pageNum / 10.0)) * pageCount;
        this.start = this.end - (pageCount - 1);

        int last = (int) (Math.ceil((total / (double) amount)));

        this.end = Math.min(end, last);

        this.prev = this.start > 1;
        this.next = total > this.end * this.amount;

    }
}
