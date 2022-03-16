//
//  Cell.swift
//  CollectionView
//
//  Created by Vasily on 14.03.2022.
//

import UIKit

class Cell: UICollectionViewCell {
    
    @IBOutlet weak var temperatureImage: UIImageView!
    
    @IBOutlet weak var smileImage: UIImageView!
    
    func setTemperatureImage(_ image: String) {
        temperatureImage.image = UIImage(named: image)
    }
    
    func setSmileImage(_ image: String) {
        smileImage.image = UIImage(named: image)
    }
}
