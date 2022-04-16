//
//  TaskCustomCell.swift
//  24.3 MVC ToDoList
//
//  Created by Vasily on 16.04.2022.
//

import UIKit

protocol TaskCustomCellDelegate {
    
    func editCell(_ row: Int)
    func deleteCell(_ row: Int)
}

class TaskCustomCell: UITableViewCell{
//    делегат
    var delegate: TaskCustomCellDelegate?
//    индекс ячейки передаваемый аргументом в ф-ю делегата
    var cellIndex: IndexPath?
    
    @IBOutlet weak var itemTaskLabel: UILabel!
    
    @IBAction func editButton(_ sender: UIButton) {
        delegate?.editCell(cellIndex!.row)
    }
    
    @IBAction func deleteButton(_ sender: UIButton) {
        delegate?.deleteCell(cellIndex!.row)
    }
    
    
    
}
