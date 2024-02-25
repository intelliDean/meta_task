// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract MetaCrafterSchool {

    mapping(address => Student) students;
    address immutable  admin;

    struct Student {
        address id;
        string name;
        uint8 age;
        uint16 result;
    }

    constructor() {
        admin = msg.sender;
    }

    modifier onlyAdmin() {
        require(admin == msg.sender, "Only admin can perform this operation");
        _;
    }

    function adminEnrolStudent(address _student, string memory _name, uint8 _age) external onlyAdmin {
        if (_student == address(0)) revert("Address zero is not allowed");
        if (_age <= 0) revert("Invalid age");

        Student storage newStudent = students[_student];

        if (newStudent.id != address(0)) revert("Student already exist");

        newStudent.id = _student;
        newStudent.name = _name;
        newStudent.age = _age;
    }

    function getStudent(address _student) external view returns (Student memory) {

        Student memory student = students[_student];
        if (student.id == address(0)) revert("Student with that Id does not exist in this school");
        return student;
    }

    function adminUpdateStudentResult(address _student, uint16 result) external onlyAdmin {
        assert(result > 0);
        Student storage foundStudent = students[_student];
        foundStudent.result = result;
    }

}