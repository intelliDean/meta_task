// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.24;

// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract MetaTask {


    address immutable  owner;

    constructor() {
        owner = msg.sender;
    }

    mapping(address => Human)  humans;

    struct Human {
        address id;
        string name;
        uint8 age;
    }

    //this function saves Human into the mapping
    function testRequireAndAssert(address _id, string memory _name, uint8 _age) external {

        //check if the owner is the one calling this function
        require(msg.sender == owner, "Not owner");

        //check if the age is above 0
        assert(_age > 0);

        //save the human
        Human storage _human = humans[_id];
        _human.age = _age;
        _human.id = _id;
        _human.name = _name;
    }

    //this function gets the stored Human from the mapping
    function testRevert(address _id) external view returns (Human memory) {

        //check if the address is saved in the mapping
        if (humans[_id].id == address(0)) revert("Human with such ID does not belong here");
        return humans[_id];
    }

}