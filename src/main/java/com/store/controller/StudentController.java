package com.store.controller;

import com.store.dto.StudentDTO;
import com.store.service.StudentService;
import com.store.service.StudentServiceImpl;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/StudentController")
public class StudentController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StudentService studentService;

    public void init() {
        String jdbcURL = getServletContext().getInitParameter("dbURL");
        String jdbcUsername = getServletContext().getInitParameter("dbUsername");
        String jdbcPassword = getServletContext().getInitParameter("dbPassword");

        this.studentService = new StudentServiceImpl(jdbcURL, jdbcUsername, jdbcPassword);

    }
    public StudentController(){

    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action") != null ? request.getParameter("action") : "none";
        try {
            switch (action) {
                case "new":
                    RequestDispatcher dispatcher = request.getRequestDispatcher("newStudentForm.jsp");
                    dispatcher.forward(request, response);
                    break;
                case "insert":
                    String name = request.getParameter("Name");
                    int age = Integer.parseInt(request.getParameter("Age"));
                    boolean gender = Boolean.parseBoolean(request.getParameter("Gender"));
                    StudentDTO newStudent = new StudentDTO(name,age,gender);
                    this.studentService.addNewStudent(newStudent);
                    response.sendRedirect("student");
                    break;
                case "delete":
                    int studentID = Integer.parseInt(request.getParameter("studentID"));
                    studentService.deleteStudent(studentID);
                    response.sendRedirect("student");
                    break;
                case "edit":
                    this.showEditForm(request, response);
                    break;
                case "update":
                    this.updateStudent(request, response);
                    break;
                default:
                    this.getListStudent(request, response);
                    break;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }


    private void getListStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException{
        List<StudentDTO> listStudent = this.studentService.getAllStudents();
        request.setAttribute("listStudent", listStudent);
        RequestDispatcher dispatcher = request.getRequestDispatcher("studentList.jsp");
        dispatcher.forward(request, response);
    }


    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        StudentDTO existingStudent = this.studentService.getStudentById(studentID);
        RequestDispatcher dispatcher = request.getRequestDispatcher("editStudent.jsp");
        request.setAttribute("student", existingStudent);
        dispatcher.forward(request, response);

    }


    private void updateStudent(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        int studentID = Integer.parseInt(request.getParameter("studentID"));
        String name = request.getParameter("name");
        int age = Integer.parseInt(request.getParameter("age"));
        boolean gender = Boolean.parseBoolean(request.getParameter("gender"));
        StudentDTO newStudent = new StudentDTO(studentID,name,age,gender);
        this.studentService.updateStudent(newStudent);
        response.sendRedirect("student");
    }
}
