//
//  ViewController.swift
//  CollectionView
//
//  Created by Vasily on 14.03.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var collectionOneView: UICollectionView!
    
    @IBOutlet weak var collectionViewTwo: UICollectionView!
    
    var arrayTemperature = ["temp.green", "temp.blackGreen", "temp.lightYellow", "temp.darkYellow", "temp.orange", "temp.red"]
    
    var arraySmile = [ "bad", "favorite", "hate", "nice", "notPleasant", "routine"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionOneView {
            return arrayTemperature.count
        } else {
            return arraySmile.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionOneView {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellOne", for: indexPath) as? Cell {
                cell.setTemperatureImage(arrayTemperature[indexPath.row])
        
                return cell
            }
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellTwo", for: indexPath) as? Cell {
                cell.setSmileImage(arraySmile[indexPath.row])
                
                return cell
            }
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "ShowImageVC") as? ShowImageVC else { return }
        var currentSelectedImage: String!
        if collectionView == collectionOneView {
            currentSelectedImage = arrayTemperature[indexPath.row] } else {
                currentSelectedImage = arraySmile[indexPath.row]
            }
        vc.setImageName(currentSelectedImage)
        
        present(vc, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionOneView.dataSource = self
        collectionOneView.delegate = self
        collectionViewTwo.dataSource = self
        collectionViewTwo.delegate = self
        // Do any additional setup after loading the view.
    }


}

