//
//  Model.swift
//  24.3 MVC ToDoList
//
//  Created by Vasily on 11.04.2022.
//

import Foundation
import UIKit

class Item {
    var taskText: String
    var isComplited: Bool
    
    init(task: String, complited: Bool) {
        taskText = task
        isComplited = complited
    }
}

class Model {
    var sortedAscending: Bool = true
    
    var taskArray: [Item] = [
        Item(task: "Make", complited: false),
        Item(task: "love", complited: false),
        Item(task: "not", complited: true),
        Item(task: "war", complited: true)
    ]
    
    
    func sortByTitle() {
        taskArray.sort {
            sortedAscending ? $0.taskText < $1.taskText : $0.taskText > $1.taskText
        }
    }
    
    func addTask(taskText: String, isCompleted: Bool = false) {
        taskArray.append(Item(task: taskText, complited: isCompleted))
    }
    
    func changeState(task: Int) -> Bool {
        taskArray[task].isComplited = !taskArray[task].isComplited
        return taskArray[task].isComplited
    }
    
    func updateTask(at index: Int, with string: String) {
        taskArray[index].taskText = string
    }
    
    func removeTask(at index: Int) {
        taskArray.remove(at: index)
    }
}
