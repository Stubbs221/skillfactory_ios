//
//  ViewController.swift
//  24.3 MVC ToDoList
//
//  Created by Vasily on 11.04.2022.
//

import UIKit

class ViewController: UITableViewController {
//    Идентификатор для ячейки
    let cellID = "cellID"
    
    var model = Model()
    
    var alert = UIAlertController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        Регистрируем ячейку для тейблвью
        let nib = UINib(nibName: "TaskCustomCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cellID")
        
//      Создаём лейбл в NavigationBar
        let title = createCustomTitleView()
        
//      Создаём UIButton для сортировки задач и затем кастим её к UIBarButtonItem
        let buttonOne = UIButton(type: .system)
        buttonOne.setImage(UIImage(systemName: "arrow.up"), for: .normal)
        buttonOne.imageView?.contentMode = .scaleAspectFill
        buttonOne.contentVerticalAlignment = .fill
        buttonOne.contentHorizontalAlignment = .fill
        buttonOne.addTarget(self, action: #selector(sortingTasksButtonAction(buttonOne:)), for: .touchUpInside)
        let sortingTasksButton = UIBarButtonItem(customView: buttonOne)
        
//      Создаём UIButton для добавления задач и затем кастим её к UIBarButtonItem
        let buttonTwo = UIButton(type: .system)
        buttonTwo.setImage(UIImage(systemName: "plus"), for: .normal)
        buttonTwo.imageView?.contentMode = .scaleAspectFill
        buttonTwo.contentVerticalAlignment = .fill
        buttonTwo.contentHorizontalAlignment = .fill
        buttonTwo.addTarget(self, action: #selector(addTask(buttonTwo:)), for: .touchUpInside)
        let addTaskButton = UIBarButtonItem(customView: buttonTwo)
        
//      Добавляем в NavigationBar лейбл и кнопки
        navigationItem.rightBarButtonItems = [sortingTasksButton, addTaskButton]
        navigationItem.titleView = title
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TaskCustomCell
        let currentItem = model.taskArray[indexPath.row]
        cell.itemTaskLabel.text = currentItem.taskText
        cell.cellIndex = indexPath
        cell.accessoryType = currentItem.isComplited ? .checkmark : .none
    
        cell.delegate = self
    
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.taskArray.count
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
//        Чекмарк выполнения задачи
        if model.changeState(task: indexPath.row) == true {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        
    }
    
    
    func editCellText(cellRow: Int) {
//        Кнопка на ячейке вызывающая алерт для изменения текста ячейки
        let cell = tableView(tableView, cellForRowAt: IndexPath(row: cellRow, section: 0)) as! TaskCustomCell
        
        alert = UIAlertController(title: "Изменить задачу", message: nil, preferredStyle: .alert)
        
        alert.addTextField(configurationHandler: { (textField) -> Void in
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .touchUpInside)
            textField.text = cell.itemTaskLabel.text
        })
        
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)
        
        let editAlertAction = UIAlertAction(title: "Подтвердить", style: .default, handler: { (createAlert) in
            guard let textFields = self.alert.textFields, textFields.count > 0 else { return }
            guard let textValue = self.alert.textFields?[0].text  else { return }
            self.model.updateTask(at: cellRow, with: textValue)
            
            self.tableView.reloadData()
        })
        
        alert.addAction(cancelAlertAction)
        alert.addAction(editAlertAction)
        present(alert, animated: true, completion: nil)
    }
    
    

    @objc func alertTextFieldDidChange(_ sender: UITextField) {

            guard let senderText = sender.text, alert.actions.indices.contains(1) else {
                return
            }

            let action = alert.actions[1]
            action.isEnabled = senderText.count > 0
        }
    
    @objc func addTask(buttonTwo: UIButton) {
//      Создаём алерт по нажатию кнопки addTaskButton в NavigationBar
        alert = UIAlertController(title: "Создать новую задачу", message: nil, preferredStyle: .alert)
        
//      Добавляем текстфилд для задачи и заполняем плейсхолдер
        alert.addTextField { (textField: UITextField) in
            textField.placeholder = "Введите название"
            textField.addTarget(self, action: #selector(self.alertTextFieldDidChange(_:)), for: .editingChanged)
        }
        
        let createAlertAction = UIAlertAction(title: "Создать", style: .default) { (createAlert) in
            
            
            guard let unwrTextFieldValue = self.alert.textFields?[0].text else {
                return
            }
            
            self.model.addTask(taskText: unwrTextFieldValue)
            self.model.sortByTitle()
            self.tableView.reloadData()
            
            
        }
        
        let cancelAlertAction = UIAlertAction(title: "Отмена", style: .cancel, handler: nil)

        alert.addAction(cancelAlertAction)
        alert.addAction(createAlertAction)
        present(alert, animated: true, completion: nil)
        createAlertAction.isEnabled = false
    }
    
    func createCustomTitleView () -> UIView {
//      Функция создаёт лейбл в котором выводится текущая дата
        let view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: 280, height: 41)
        
        let dateLabel = UILabel()
        
        dateLabel.textAlignment = .left
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM"
        dateLabel.frame = CGRect(x: 55, y: 0, width: 220, height: 20)
        dateLabel.font = UIFont.systemFont(ofSize: 20)
        
        dateLabel.text = "Задачи на \(dateFormatter.string(from: date))"
        view.addSubview(dateLabel)
        
        return view
    }
    
    @objc func sortingTasksButtonAction(buttonOne: UIButton) {
//        Сортировка задач и изменение иконки
        let arrowUp = UIImage(systemName: "arrow.up")
        let arrowDown = UIImage(systemName: "arrow.down")
        
        model.sortedAscending = !model.sortedAscending
        buttonOne.setImage((model.sortedAscending ? arrowUp : arrowDown), for: .normal)
        model.sortByTitle()
        
        tableView.reloadData()
    }
}

    


// MARK: Подписываем вью контроллер под протокол делегат ячейки
extension ViewController: TaskCustomCellDelegate {
    
    @objc func editCell(_ row: Int) {
        self.editCellText(cellRow: row)
    }
    
    func deleteCell(_ row: Int) {
        self.model.removeTask(at: row)
        
        tableView.reloadData()
    }
    
    
}
