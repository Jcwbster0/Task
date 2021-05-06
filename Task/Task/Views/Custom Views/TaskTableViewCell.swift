//
//  TaskTableViewCell.swift
//  Task
//
//  Created by Justin Webster on 4/21/21.
//

import UIKit


protocol TaskCompletionDelegate: AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}


class TaskTableViewCell: UITableViewCell {

    //MARK: - Outlets
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    //MARK: - Actions
    @IBAction func completionButtonTapped(_ sender: Any) {
        
        delegate?.taskCellButtonTapped(self)
        
        
    }
    
    //MARK: - Properties
    
    weak var delegate: TaskCompletionDelegate?
    
    var task: Task? {
        didSet {
            guard let task = task else {return}
            updateView(for: task)
        }
    }
    
    func updateView (for updateTask: Task) {
        
        guard let task = task else {return}
        taskNameLabel.text = task.name
//        DispatchQueue.main.async {
//            self.completionButton.setImage(task.isComplete  ? #imageLiteral(resourceName: "incomplete") : #imageLiteral(resourceName: "complete") , for: .normal)
//        }
        completionButton.setImage(task.isComplete  ? #imageLiteral(resourceName: "incomplete") : #imageLiteral(resourceName: "complete") , for: .normal)
        
    
    }
    
    
        
        
        
        
//        if !task.isComplete {
//
//            completionButton.setBackgroundImage(#imageLiteral(resourceName: "complete"), for: UIControl.State.selected)
//
//        } else {
//
//            completionButton.setBackgroundImage(#imageLiteral(resourceName: "incomplete"), for: UIControl.State.normal)
//
//        }
//    }
//
    
    
}//End of Class
