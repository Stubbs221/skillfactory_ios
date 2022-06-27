//
//  Cell.swift
//  spmProject
//
//  Created by MAC on 25.06.2022.
//

import UIKit
import SkeletonView

class Cell: UITableViewCell {

    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        self.isSkeletonable = true
//        contentView.isSkeletonable = true
        contentView.addSubview(image)
        contentView.addSubview(headerOne)
        contentView.addSubview(headerTwo)
        
        NSLayoutConstraint.activate([
            image.widthAnchor.constraint(equalToConstant: 70),
            image.heightAnchor.constraint(equalToConstant: 70),
            image.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5)])
        
        NSLayoutConstraint.activate([
            headerOne.topAnchor.constraint(equalTo: image.topAnchor),
            headerOne.heightAnchor.constraint(equalToConstant: 25),
            headerOne.widthAnchor.constraint(equalToConstant: 100),
            headerOne.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10)])
        
        NSLayoutConstraint.activate([
            headerTwo.bottomAnchor.constraint(equalTo: image.bottomAnchor),
            headerTwo.heightAnchor.constraint(equalToConstant: 25),
            headerTwo.widthAnchor.constraint(equalToConstant: 200),
            headerTwo.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 10)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Properties
    
    let image: UIImageView = {
        let imageView = UIImageView()
//        imageView.isSkeletonable = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let headerOne: UILabel = {
        let label = UILabel()
//        label.isSkeletonable = true
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let headerTwo: UILabel = {
        let label = UILabel()
//        label.isSkeletonable = true
        label.font = UIFont(name: "Helvetica Neue", size: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}
