// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract StructEnumMappinConditionEx {
    // Enum for task status
    enum TaskStatus { NotStarted, InProgress, Completed, Cancelled }
    // Task structure
    struct Task {
        string name;
        TaskStatus status;
        string status_desc;
    }
    mapping(uint => Task) public tasks;
    uint public taskCount;
    // Function to create a new task
    function createTask(string memory _name) public {
        tasks[taskCount] = Task(_name, TaskStatus.NotStarted,"Not Started");
        taskCount++;
    }
    // Function to change the task's status
    function updateTaskStatus(uint _taskId, TaskStatus _status) public {
        require(_taskId < taskCount, "Task does not exist.");
        if (_status==TaskStatus.NotStarted)
            tasks[_taskId].status_desc="NotStarted";
        else if (_status==TaskStatus.InProgress)
            tasks[_taskId].status_desc="In Progress";
        else if (_status==TaskStatus.Completed)
            tasks[_taskId].status_desc="Completed";  
        else if (_status==TaskStatus.Cancelled)
            tasks[_taskId].status_desc="Cancelled";        
        else 
            tasks[_taskId].status_desc="Unknown";    
        tasks[_taskId].status = _status;
    }
    // Function to get a task's status
    function getTaskStatus(uint _taskId) public  returns (TaskStatus) {
        require(_taskId < taskCount, "Task does not exist.");
        if (tasks[_taskId].status==TaskStatus.NotStarted)
            tasks[_taskId].status_desc="NotStarted";
        else if (tasks[_taskId].status==TaskStatus.InProgress)
            tasks[_taskId].status_desc="In Progress";
        else if (tasks[_taskId].status==TaskStatus.Completed)
            tasks[_taskId].status_desc="Completed";  
        else if (tasks[_taskId].status==TaskStatus.Cancelled)
            tasks[_taskId].status_desc="Cancelled";        
        else 
            tasks[_taskId].status_desc="Unknown";
        return tasks[_taskId].status;
    }
}
