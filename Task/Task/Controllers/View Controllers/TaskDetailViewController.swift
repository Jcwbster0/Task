//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Justin Webster on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    //MARK: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    //MARK: - Properties
    
    var task: Task?
    var date: Date?
    
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    //MARK: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        
        guard let taskTitle = taskNameTextField.text, !taskTitle.isEmpty,
              let taskBody = taskNotesTextView.text, !taskBody.isEmpty else {return}
        
        if let task = task {
            
            TaskController.sharedInstance.update(task: task, newName: taskTitle, newNotes: taskBody, newDueDate: date)
            
        } else {
            
            TaskController.sharedInstance.createTaskWith(name: taskTitle, notes: taskBody, dueDate: date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func dueDatePickerDateChanged(_ sender: Any) {
        guard let date = date else {return}
        taskDueDatePicker.date = date
    }
    
    //MARK: - Functions
    
    func updateView() {
        guard let task = task else {return}
        taskNameTextField.text = task.name
        taskNotesTextView.text = task.notes
    }
    
    
}//End of Class
