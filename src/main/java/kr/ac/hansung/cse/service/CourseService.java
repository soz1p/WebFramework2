package kr.ac.hansung.cse.service;

import kr.ac.hansung.cse.dao.CourseDao;
import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.model.SemesterCredit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class CourseService {

    //service -> dao
    @Autowired
    private CourseDao courseDao;

    public List<Course> getAllCourses() {
        return courseDao.getCourses();
    }

    public void insert(Course course) {
        courseDao.insert(course);
    }

    public List<Course> getAllCoursesByYearAndSemester(String year, Integer semester) {
        return courseDao.getSortCourses(year, semester);
    }

    public List<SemesterCredit> getSemesterCredits() {
        List<SemesterCredit> semesterCredits = new ArrayList<>();

        // 각 학기별로 이수한 학점을 계산합니다.
        for (int year = 2021; year <= 2024; year++) {
            for (int semester = 1; semester <= 2; semester++) {
                if (year < 2024 || (year == 2024 && semester == 1)) {
                    int totalCredits = courseDao.getTotalCreditsBySemester(year, semester);
                    semesterCredits.add(new SemesterCredit(String.valueOf(year), semester, totalCredits));
                }
            }
        }

        return semesterCredits;
    }


}
