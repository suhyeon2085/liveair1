package org.zerock.domain;

import lombok.Data;

@Data
public class MemoDTO {
    private int id;
    private int year;
    private int month;
    private int day;
    private String memo;
}