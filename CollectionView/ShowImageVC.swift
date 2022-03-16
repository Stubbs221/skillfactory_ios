//
//  ShowImageVC.swift
//  CollectionView
//
//  Created by Vasily on 14.03.2022.
//

import UIKit

class ShowImageVC: UIViewController {

    @IBOutlet weak var currentImage: UIImageView!
    
    var imageName: String!
    
    func setImageName(_ name: String) {
        imageName = name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentImage.image = UIImage(named: imageName)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
