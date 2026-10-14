// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "./IEx14Solution.sol";

interface IEx01 {
    function ping() external;
}

interface IEx14 {
    function askForPoints() external;
}

contract Ex14Solution is IEx14Solution {
    IEx01 public immutable ex01;

    constructor(address ex01Address) {
        ex01 = IEx01(ex01Address);
    }

    function completeWorkshop() external override {
        ex01.ping();
    }

    function solveEx14(address ex14Address) external {
        IEx14(ex14Address).askForPoints();
    }
}
