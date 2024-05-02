package com.store.service;


import com.store.dao.StudentDAO;
import com.store.dao.StudentDAOImpl;
import com.store.dto.StudentDTO;

import java.sql.SQLException;
import java.util.List;

public class StudentServiceImpl implements StudentService {
    private StudentDAO studentDAO;

    public StudentServiceImpl(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.studentDAO = new StudentDAOImpl(jdbcURL, jdbcUsername, jdbcPassword);
    }

    @Override
    public List<StudentDTO> getAllStudents() throws SQLException {
        return this.studentDAO.getAllStudents();
    }

    @Override
    public boolean addNewStudent(StudentDTO newStudent) throws SQLException {
        return this.studentDAO.addNewStudent(newStudent);
    }

    @Override
    public boolean updateStudent(StudentDTO student) throws SQLException {
        return this.studentDAO.updateStudent(student);
    }

    @Override
    public boolean deleteStudent(StudentDTO student) throws SQLException {
        return this.studentDAO.deleteStudent(student);
    }

    @Override
    public StudentDTO getStudentById(int studentid) throws SQLException {
        return this.studentDAO.getStudentById(studentid);
    }
}
