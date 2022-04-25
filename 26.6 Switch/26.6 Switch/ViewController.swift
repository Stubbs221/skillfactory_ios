//
//  ViewController.swift
//  26.6 Switch
//
//  Created by Vasily on 25.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    let currentState = UserDefaults.standard

    let position: Bool = false
    let model = Model(position: false)
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 100, width: 390, height: 250)
        imageView.image = UIImage(named: "photoOne")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 25
       
        return imageView
    }()
   
    let customSC: UISegmentedControl = {
        
        let items = ["Light", "Dark"]
        let customSC = UISegmentedControl(items: items)
        customSC.selectedSegmentIndex = 0
        customSC.frame = CGRect(x: 0, y: 750, width: 413, height: 80)
        customSC.layer.cornerRadius = 0
        customSC.addTarget(self, action: #selector(segmentAction), for: .valueChanged)
        customSC.setTitleTextAttributes([NSAttributedString.Key.font: UIFont.systemFont(ofSize: 32)], for: .normal)
        
        return customSC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.segmentedControlPosition = currentState.bool(forKey: "position")
        customSC.selectedSegmentIndex = (currentState.bool(forKey: "position")) ? 1 : 0
        changeAppearance()
        // Do any additional setup after loading the view.
        
        self.view.addSubview(customSC)
        self.view.addSubview(imageView)
        addConstraints()
//        let horizontalConstraintImage = imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//        let verticalConstraintImage = imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
//        let imageWidth = imageView.widthAnchor.constraint(equalTo: view.widthAnchor)
//        NSLayoutConstraint.activate([])
    }
    
    func changeAppearance() {
        if model.segmentedControlPosition {
            imageView.image = UIImage(named: model.photoContainer[0])
            self.view.backgroundColor = UIColor(named: "photoOneColor")
        } else {
            imageView.image = UIImage(named: model.photoContainer[1])
            self.view.backgroundColor = UIColor(named: "photoTwoColor")  }
    }
    
    func addConstraints() {
        var imageViewConstraints = [NSLayoutConstraint]()
        var segmentedControlConstraints = [NSLayoutConstraint]()
        
        imageViewConstraints.append(imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10))
        imageViewConstraints.append(imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10))
        imageViewConstraints.append(imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20))
        imageViewConstraints.append(imageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.35))
        NSLayoutConstraint.activate(imageViewConstraints)
        
        segmentedControlConstraints.append(customSC.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        segmentedControlConstraints.append(customSC.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        segmentedControlConstraints.append(customSC.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        segmentedControlConstraints.append(customSC.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor))
        NSLayoutConstraint.activate(segmentedControlConstraints)
        
    }
    
    @objc func segmentAction() {
        
        model.changeState()
        currentState.set(model.segmentedControlPosition, forKey: "position")
        changeAppearance()
        
    }


}

