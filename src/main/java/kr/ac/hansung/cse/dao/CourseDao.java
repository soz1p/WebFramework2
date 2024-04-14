package kr.ac.hansung.cse.dao;

import kr.ac.hansung.cse.model.Course;
import kr.ac.hansung.cse.model.SemesterCredit;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import javax.sql.DataSource;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Repository
public class CourseDao {

    private JdbcTemplate jdbcTemplate;  // psa(portable service abstraction, sql(x) api

    @Autowired
    public void setDataSource(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    public int getRowCount() {
        String sqlStatement= "select count(*) from courses";
        return jdbcTemplate.queryForObject(sqlStatement, Integer.class);

    }
    //query and return a single object
    public Course getCourse(String courseName) {

        String sqlStatement= "select * from courses where courseName=?";
        return jdbcTemplate.queryForObject(sqlStatement, new Object[] {courseName},
                new RowMapper<Course>() {

                    @Override
                    public Course mapRow(ResultSet rs, int rowNum) throws SQLException {

                        Course course= new Course();

                        course.setYear(rs.getString("year"));
                        course.setSemester(rs.getInt("semester"));
                        course.setCourseCode(rs.getString("courseCode"));
                        course.setCourseName(rs.getString("courseName"));
                        course.setCourseType(rs.getString("courseType"));
                        course.setProfessor(rs.getString("professor"));
                        course.setCredits(rs.getInt("credits"));
                        course.setId(rs.getInt("id"));

                        return course;
                    }
                });
    }

    //query and return multiple objects
    // cRud method
    public List<Course> getCourses() {

        String sqlStatement= "select * from courses";
        return jdbcTemplate.query(sqlStatement, new RowMapper<Course>() {

            @Override
            public Course mapRow(ResultSet rs, int rowNum) throws SQLException {

                Course course = new Course();

                course.setYear(rs.getString("year"));
                course.setSemester(rs.getInt("semester"));
                course.setCourseCode(rs.getString("courseCode"));
                course.setCourseName(rs.getString("courseName"));
                course.setCourseType(rs.getString("courseType"));
                course.setProfessor(rs.getString("professor"));
                course.setCredits(rs.getInt("credits"));
                course.setId(rs.getInt("id"));

                return course;
            }
        });
    }


    // Crud method
    public boolean insert(Course course) {

        String year = course.getYear();
        Integer  semester = course.getSemester();
        String courseCode = course.getCourseCode();
        String courseName = course.getCourseName();
        String courseType = course.getCourseType();
        String professor = course.getProfessor();
        Integer  credits = course.getCredits();

        String sqlStatement= "insert into courses (year, semester, courseCode, courseName,courseType, professor, credits) values (?,?,?,?,?,?,?)";

        return (jdbcTemplate.update(sqlStatement, new Object[] {year, semester, courseCode, courseName,courseType, professor, credits}) == 1);
    }

    // crUd method
    public boolean update(Course course) {

        String year = course.getYear();
        Integer semester = course.getSemester();
        String courseCode = course.getCourseCode();
        String courseName = course.getCourseName();
        String courseType = course.getCourseType();
        String professor = course.getProfessor();
        Integer credits = course.getCredits();
        int id = course.getId();

        String sqlStatement= "update courses set year=?, semester=?, courseCode=?, courseName=?,courseType=?, professor=?, credits=? where id=?";

        return (jdbcTemplate.update(sqlStatement, new Object[]{year, semester, courseCode, courseName,courseType, professor, credits, id}) == 1);
    }

    //cruD method
    public boolean delete(int id) {
        String sqlStatement= "delete from courses where id=?";
        return (jdbcTemplate.update(sqlStatement, new Object[] {id}) == 1);
    }

    public List<Course> getSortCourses(String year, Integer semester) {
        String sqlStatement = "SELECT * FROM courses WHERE year = ? AND semester = ?";
        return jdbcTemplate.query(sqlStatement, new Object[]{year, semester}, new RowMapper<Course>() {
            @Override
            public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
                Course course = new Course();
                course.setYear(rs.getString("year"));
                course.setSemester(rs.getInt("semester"));
                course.setCourseCode(rs.getString("courseCode"));
                course.setCourseName(rs.getString("courseName"));
                course.setCourseType(rs.getString("courseType"));
                course.setProfessor(rs.getString("professor"));
                course.setCredits(rs.getInt("credits"));
                course.setId(rs.getInt("id"));
                return course;
            }
        });
    }

    public int getTotalCreditsBySemester(int year, int semester) {
        String sqlStatement = "SELECT SUM(credits) AS total_credits FROM courses WHERE year = ? AND semester = ?";

        // jdbcTemplate을 사용하여 쿼리 실행
        Integer totalCredits = jdbcTemplate.queryForObject(sqlStatement, Integer.class, year, semester);

        // 쿼리 결과가 null이면 0으로 처리
        if (totalCredits == null) {
            return 0;
        }

        return totalCredits;
    }

}
