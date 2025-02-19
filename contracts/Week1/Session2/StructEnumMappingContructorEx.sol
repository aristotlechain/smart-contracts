// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StructEnumMappingContructorEx {

    enum TaskStatus { NotStarted, InProgress, Completed, Cancelled }

    struct Task {
        string name;
        TaskStatus status;
        string status_desc;
    }

    mapping(uint => Task) public tasks;
    uint public taskCount;

    // Mapping enum values to string descriptions
    mapping(TaskStatus => string) public statusDescriptions;

    constructor() {
        // Initialize the mapping
        statusDescriptions[TaskStatus.NotStarted] = "Not Started";
        statusDescriptions[TaskStatus.InProgress] = "In Progress";
        statusDescriptions[TaskStatus.Completed] = "Completed";
        statusDescriptions[TaskStatus.Cancelled] = "Cancelled";
    }

    function createTask(string memory _name) public {
        tasks[taskCount] = Task(_name, TaskStatus.NotStarted,"Not Started");
        taskCount++;
    }

    // Function to update task status description
    function updateTaskStatus(uint _taskId, TaskStatus _status) public {
        tasks[_taskId].status = _status;
        tasks[_taskId].status_desc = statusDescriptions[_status];
    }

    function getTaskStatus(uint _taskId) public view returns (TaskStatus) {
        require(_taskId < taskCount, "Task does not exist.");
        return tasks[_taskId].status;
    }

    function getTaskStatusDesc(uint _taskId) public view returns (string memory) {
        require(_taskId < taskCount, "Task does not exist.");
        return tasks[_taskId].status_desc;
    }
}
