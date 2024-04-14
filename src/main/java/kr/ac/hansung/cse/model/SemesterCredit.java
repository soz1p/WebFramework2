package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class SemesterCredit {
    private String year; // 년도
    private Integer semester; // 학기
    private int credits; // 취득 학점

    public SemesterCredit(String year, int semester, int credits) {
        this.year = year;
        this.semester = semester;
        this.credits = credits;
    }

}
