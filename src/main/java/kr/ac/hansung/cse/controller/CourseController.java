package kr.ac.hansung.cse.controller;

import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.model.SemesterCredit;
import kr.ac.hansung.cse.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

@Controller
public class CourseController {
    // Controller -> Service -> Dao
    @Autowired
    private CourseService courseService;

    @GetMapping("/courses")
    public String showCourses(Model model) {
        List<Course> courses = courseService.getAllCourses();

        // 데이터를 요구사항에 맞게 정렬
        courses.sort(Comparator.comparing(Course::getYear)
                .thenComparing(Course::getSemester)
                .thenComparing(Course::getCourseName));

        model.addAttribute("id_Courses", courses);
        return "courses";
    }

    @GetMapping("/createcourse")
    public String createCourse(Model model) {

        model.addAttribute("course", new Course());

        return "createcourse";
    }

    @GetMapping("/newlyRegisteredCourses")
    public String showNewlyCourses(Model model) {

        List<Course> courses = courseService.getAllCoursesByYearAndSemester("2024", 2);
        model.addAttribute("id_Courses", courses);

        System.out.println(courses);

        return "newlyRegisteredCourses";
    }

    @GetMapping("/coursesByCredits")
    public String showCoursesByCredits(Model model) {

        List<SemesterCredit> semesterCredits = courseService.getSemesterCredits(); // 학기별 이수 학점을 조회하는 서비스 메소드를 호출합니다.
        model.addAttribute("id_SemesterCredits", semesterCredits);

        return "coursesByCredits";
    }

    @GetMapping("/coursesDetails")
    public String showCourseDetails(@RequestParam("year") String year,
                                              @RequestParam("semester") int semester,
                                              Model model) {
        List<Course> courses = courseService.getAllCoursesByYearAndSemester(year, semester);
        model.addAttribute("id_Courses", courses);

        System.out.println(courses);
        return "coursesDetails";
    }

    @PostMapping("/docreate")
    public String doCreate(Model model, @Valid Course course, BindingResult result) {

        // System.out.println(course);
        if(result.hasErrors()) {
            System.out.println("== Form data does not validated ==");

            List<ObjectError> errors = result.getAllErrors();

            for(ObjectError error:errors) {
                System.out.println(error.getDefaultMessage());
            }

            return "createcourse";
        }

        // Controller -> Service -> Dao
        courseService.insert(course);

        return "coursecreated";
    }
}
