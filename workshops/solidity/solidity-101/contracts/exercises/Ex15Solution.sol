// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "./IEx14Solution.sol";

interface Ex15Ex01 {
    function ping() external;
}

interface Ex15Ex03 {
    function claimPoints(uint256 value) external;
}

interface Ex15Ex04 {
    function resetCounter() external;
    function incrementCounter() external;
    function decrementCounter() external;
    function validateCounter() external;
}

interface Ex15Ex05 {
    function declareHelper(address helper) external;
    function helpColleague(address colleague) external;
}

contract Ex15Ex05Helper {
    function help(address exercise, address student) external {
        Ex15Ex05(exercise).helpColleague(student);
    }
}

interface Ex15Ex06 {
    function startExercise() external;
    function duplicatePrivateValueInPublic() external;
    function showYouKnowPrivateValue(uint256 value) external;
}

interface Ex15Ex07 {
    function assignRank() external;
    function fireEvent() external;
    function showYouKnowPrivateValue(uint256 value) external;
}

interface Ex15Ex08 {
    function createObject(string calldata name) external;
    function changeObjectName(uint256 objectNumber, string calldata name) external;
    function transfer(uint256 objectNumber, address recipient) external;
    function claimPoints(uint256 objectNumber) external;
}

interface Ex15Ex10 {
    function assignRank() external;
    function showYouKnowPrivateValue(uint256 value) external;
}

interface Ex15Ex11 {
    function askForPoints(uint256 value, uint256 nextValue) external;
}

interface Ex15Ex12 {
    function askForPoints(uint256 value, uint256 newValue) external;
}

interface Ex15Ex15 {
    function askForPoints() external;
}

contract Ex15Solution is IEx14Solution {
    Ex15Ex01 public immutable ex01;
    address public immutable ex02;
    Ex15Ex03 public immutable ex03;
    Ex15Ex04 public immutable ex04;
    Ex15Ex05 public immutable ex05;
    Ex15Ex06 public immutable ex06;
    Ex15Ex07 public immutable ex07;
    Ex15Ex08 public immutable ex08;
    Ex15Ex10 public immutable ex10;
    Ex15Ex11 public immutable ex11;
    Ex15Ex12 public immutable ex12;
    address public immutable teacher;
    uint256 public immutable ex02Amount;
    uint256 public immutable ex06Value;
    uint256 public immutable ex07Value;
    uint256 public immutable ex10Value;
    Ex15Ex05Helper public immutable helper;

    constructor(
        address ex01Address,
        address ex02Address,
        address ex03Address,
        address ex04Address,
        address ex05Address,
        address ex06Address,
        address ex07Address,
        address ex08Address,
        address ex10Address,
        address ex11Address,
        address ex12Address,
        address teacherAddress,
        uint256 ex02AmountInWei,
        uint256 ex06PrivateValue,
        uint256 ex07PrivateValue,
        uint256 ex10PrivateValue
    ) {
        ex01 = Ex15Ex01(ex01Address);
        ex02 = ex02Address;
        ex03 = Ex15Ex03(ex03Address);
        ex04 = Ex15Ex04(ex04Address);
        ex05 = Ex15Ex05(ex05Address);
        ex06 = Ex15Ex06(ex06Address);
        ex07 = Ex15Ex07(ex07Address);
        ex08 = Ex15Ex08(ex08Address);
        ex10 = Ex15Ex10(ex10Address);
        ex11 = Ex15Ex11(ex11Address);
        ex12 = Ex15Ex12(ex12Address);
        teacher = teacherAddress;
        ex02Amount = ex02AmountInWei;
        ex06Value = ex06PrivateValue;
        ex07Value = ex07PrivateValue;
        ex10Value = ex10PrivateValue;
        helper = new Ex15Ex05Helper();
    }

    function completeWorkshop() external override {
        ex01.ping();

        (bool sent, ) = ex02.call{value: ex02Amount}("");
        require(sent, "Ex02 call failed");

        ex03.claimPoints(180618);

        ex04.resetCounter();
        ex04.incrementCounter();
        ex04.incrementCounter();
        ex04.incrementCounter();
        ex04.decrementCounter();
        ex04.validateCounter();

        ex05.declareHelper(address(helper));
        helper.help(address(ex05), address(this));

        ex06.startExercise();
        ex06.duplicatePrivateValueInPublic();
        ex06.showYouKnowPrivateValue(ex06Value);

        ex07.assignRank();
        ex07.fireEvent();
        ex07.showYouKnowPrivateValue(ex07Value);

        ex08.createObject("student");
        ex08.changeObjectName(0, "updated student");
        ex08.transfer(0, teacher);
        ex08.claimPoints(0);

        ex10.assignRank();
        ex10.showYouKnowPrivateValue(ex10Value);

        ex11.askForPoints(31020, 31021);
        ex12.askForPoints(0, 1);
    }

    function solveEx15(address ex15Address) external {
        Ex15Ex15(ex15Address).askForPoints();
    }

    receive() external payable {}
}
