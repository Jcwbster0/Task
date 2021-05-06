//
//  TaskController.swift
//  Task
//
//  Created by Justin Webster on 4/21/21.
//

import Foundation

class TaskController{
  
    //MARK: - Properties
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    //MARK: - Functions
    
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        saveToPersistenceStore()
    }
    
    func update(task: Task, newName: String, newNotes: String?, newDueDate: Date?) {
        task.name = newName
        task.notes = newNotes
        task.dueDate = newDueDate
        saveToPersistenceStore()
    }
    
    func toggleIsComplete(task: Task) {
        task.isComplete = !task.isComplete
        //task.isComplete.toggle()
        saveToPersistenceStore()
    }
    
    func delete(task: Task) {
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        saveToPersistenceStore()
    }
    

    //MARK: - Persistence
    func createPersistenceStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Task.json")
        return fileURL
    }
    
    func saveToPersistenceStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistenceStore())
        } catch {
            print("Error encoding songs")
        }
    }
    
    func loadFromPersistenceStore() {
        do {
            let data = try Data(contentsOf: createPersistenceStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error decoding songs")
        }
    }
    
}//End of Class
