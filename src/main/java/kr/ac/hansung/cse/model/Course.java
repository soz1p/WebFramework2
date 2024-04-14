package kr.ac.hansung.cse.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import javax.validation.constraints.*;

@Getter
@Setter
@ToString
@NoArgsConstructor

public class Course {
    @Size(min = 4, max = 4, message = "수강년도는 4자리여야 합니다. ex)2024")
    private String year = "2024"; // 수강년도를 2024로 고정

    @NotNull(message = "학기는 비워둘 수 없습니다. ex)1")
    @Min(value = 2, message = "학기는 반드시 2이어야 합니다.")
    @Max(value = 2, message = "학기는 반드시 2이어야 합니다.")
    private Integer semester = 2; // 학기를 2로 고정

    @Size(min = 7, max = 7, message = "교과코드는 7자리여야 합니다. ex)V024006")
    private String courseCode; // 교과코드

    @Size(min = 2, max = 100, message = "교과목명은 2자 이상, 100자 이하여야 합니다. ex)웹프레임워크2")
    private String courseName; // 교과목명

    @Size(min = 2, max = 10, message = "교과구분을 작성해주세요. ex)전필")
    private String courseType; // 교과구분

    @NotEmpty(message = "담당교수는 비워둘 수 없습니다. ex)김남윤")
    private String professor; // 담당교수

    @NotNull(message = "학점은 비워둘 수 없습니다. ex)3")
    @Min(value = 1, message = "학점은 최소 1이어야 합니다.")
    @Max(value = 3, message = "학점은 최대 3이어야 합니다.")
    private Integer  credits; // 학점

    private int id;
}
