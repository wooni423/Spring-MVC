package com.jiwoong.springex.util;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.RequiredArgsConstructor;


import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.Positive;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.Arrays;

@Builder
@AllArgsConstructor
@RequiredArgsConstructor
@Data
public class PageRequestDTO {

    @Builder.Default
    @Min(value = 1)
    @Positive // 양수만 가능
    private int pageNum = 1;

    @Builder.Default
    @Min(value = 10)
    @Max(value = 100)
    @Positive
    private int amount = 10;

    private String link;

    // 검색 및 필터링 관련 변수
    private String[] types;
    private String keyword;
    private boolean finished;
    private LocalDate from;
    private LocalDate to;


    //페이지 이동 링크
    public String getLink() {
        StringBuilder builder = new StringBuilder();
        builder.append("pageNum=" + this.pageNum);
        builder.append("&amount=" + this.amount);
        link = builder.toString();

        if(finished){
            builder.append("&finished=on");
        }

        if(types !=null && types.length >0){
            for(int i =0; i<types.length; i++){
                builder.append("&types=" + types[i]);
            }
        }

        if(keyword != null){
            try {
               builder.append("&keyword=" + URLEncoder.encode(keyword,"UTF-8"));
            }catch (UnsupportedEncodingException e){
                e.printStackTrace();
            }
        }

        if(from != null){
            builder.append("&from="+from.toString());
        }

        if(to !=  null){
            builder.append("&to=" + to.toString());
        }

        return builder.toString();
    }

    public boolean checkType(String type) {
        if (types == null || types.length == 0) {
            return false;
        }
        return Arrays.asList(types).contains(type);
    }

}
