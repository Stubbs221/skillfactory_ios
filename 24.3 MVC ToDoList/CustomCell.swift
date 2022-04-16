//
//  CustomCell.swift
//  24.3 MVC ToDoList
//
//  Created by Vasily on 11.04.2022.
//
import UIKit

protocol CustomCellDelegate: AnyObject {
    func editCell(_ row: Int)
    func deleteCell(_ row: Int)
}

class CustomCell: UITableViewCell{
//
    @objc func editCell(_ row: Int) {
        print("edit cell")
        delegate?.editCell(cellIndex!.row)
    }

    @objc func deleteCell(_ row: Int) {
        print("edit cell")
        delegate?.deleteCell(cellIndex!.row)
    }
//
//
//    @objc func editcCell(row: Int) {
//        print("editCell")
//        delegate?.editCell(row)
//    }
    
   
    
//  Ячейка будет делегатом самой себя
//    weak var delegate: EditDelegate?
    weak var delegate: CustomCellDelegate?
    var cellIndex: IndexPath?
    
//  Создаём лейбл
    let itemTaskLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.boldSystemFont(ofSize: 16)
        lbl.textAlignment = .left
        
        return lbl
    }()
    
//  Создаём батн для изменения задачи
    let editButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "square.and.pencil"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
//        btn.addTarget(self, action: #selector(delCell), for: .touchUpInside)
        return btn
    }()
    
//  Создаём батн для удаления задачи
    let deleteButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFill
//        btn.addTarget(self, action: #selector(delCell), for: .touchUpInside)
        return btn
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        editButton.addTarget(self, action: #selector(editCell(_:)), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteCell(_:)), for: .touchUpInside)
        
//        В инициализаторе через addSubview добавляем на ячейку лейбл и баттоны
        contentView.addSubview(itemTaskLabel)
        contentView.addSubview(editButton)
        contentView.addSubview(deleteButton)
        
//      Задаём констрейнты для лейбла
        itemTaskLabel.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 5, paddingLeft: 15, paddingBottom: 5, paddingRight: 0, width: 200, height: 60, enableInsets: false)
        
//        Пакуем баттоны в стейвью и задаём констрейнты
        let stackView = UIStackView(arrangedSubviews: [editButton, deleteButton])
        stackView.distribution = .fillProportionally
        stackView.axis = .horizontal
        stackView.spacing = 5
        
        addSubview(stackView)
        stackView.anchor(top: topAnchor, left: itemTaskLabel.rightAnchor, bottom: .none, right: rightAnchor, paddingTop: 15, paddingLeft: 50, paddingBottom: 15, paddingRight: 55, width: 0, height: 25, enableInsets: false)
    
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    
    
}


