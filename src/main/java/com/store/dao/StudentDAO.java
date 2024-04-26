package com.store.dao;

import com.store.dto.StudentDTO;

import java.sql.SQLException;
import java.util.List;

public interface StudentDAO {
    List<StudentDTO> getAllStudents() throws SQLException;
    boolean addNewStudent(StudentDTO newStudent) throws SQLException;
    boolean updateStudent(StudentDTO student) throws SQLException;
    boolean deleteStudent(StudentDTO student)throws SQLException;
    StudentDTO getStudentById(int studentid) throws SQLException;
}
