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
}