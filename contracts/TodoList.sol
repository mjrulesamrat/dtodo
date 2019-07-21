pragma solidity ^0.5.0;

/*

Deployment and Inspection steps:
  $ truffle migrate --reset
  $ truffle console
  >> todoList = await TodoList.deployed()
  >> task = await todoList.tasks(1) // get first task defined by our constructor

*/

contract TodoList {
    uint public taskCount = 0;

    // task model
    struct Task {
        uint id;
        string content;
        bool completed;
    }

    // tasks state variable to access all tasks
    // with mapping
    mapping(uint => Task) public tasks;

    function createTask(string memory _content) public {
        taskCount ++;
        tasks[taskCount] = Task(taskCount, _content, false);
    }

    // constructor function
    constructor() public {
        createTask("Write 10 smart contracts a day");
    }
}
