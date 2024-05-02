package com.store.dto;

public class StudentDTO {
    public int StudentID;
    public String Name;
    public int Age;
    public boolean Gender;

    public StudentDTO() {
    }

    public StudentDTO(int studentID, String name, int age, boolean gender) {
        StudentID = studentID;
        Name = name;
        Age = age;
        Gender = gender;
    }
    public StudentDTO( String name, int age, boolean gender) {
        Name = name;
        Age = age;
        Gender = gender;
    }

    public int getStudentID() {
        return StudentID;
    }

    public void setStudentID(int studentID) {
        StudentID = studentID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getAge() {
        return Age;
    }

    public void setAge(int age) {
        Age = age;
    }

    public boolean isGender() {
        return Gender;
    }

    public void setGender(boolean gender) {
        Gender = gender;
    }
}
