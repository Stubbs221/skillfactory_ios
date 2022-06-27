//
//  ViewController.swift
//  spmProject
//
//  Created by MAC on 24.06.2022.
//

import UIKit
import SkeletonView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            self.checkStore()
            self.tableView.stopSkeletonAnimation()
            self.tableView.hideSkeleton(reloadDataAfter: true, transition: .crossDissolve((2)))
        })
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        tableView.isSkeletonable = true
        tableView.showAnimatedGradientSkeleton(usingGradient: gradient, animation: animation, transition: .crossDissolve(0.25))
        tableView.showSkeleton(usingColor: .link, transition: .crossDissolve(0.25))
        
    }

// MARK: Properties
    
    let cellID = "CellID"
    var dataFromPlist: NSDictionary?
    var allImages: [String] = []
    var allNames: [String] = []
    var allMessages: [String] = []
    
    let animation = GradientDirection.leftRight.slidingAnimation()
    let gradient = SkeletonGradient(baseColor: UIColor.link)

    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 80
        tableView.estimatedRowHeight = 80
        tableView.dataSource = self
        tableView.register(Cell.self, forCellReuseIdentifier: cellID)
        tableView.backgroundColor = .white
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
// MARK: Actions
    
    private func checkStore() {
        
            let path = Bundle.main.path(forResource: "userData", ofType: "plist")
            
            guard let uPath = path else {
                print("file is unavailable")
                return
            }
            print("file available")
            self.appendDataFromPlistConcurrent(uPath)
        
    }
    
    private func appendDataFromPlistConcurrent(_ filePath: String) {
        let dataFromPlist = NSDictionary(contentsOfFile: filePath)
        guard let dictionary = dataFromPlist else { return }
        
        allImages = dictionary["allImages"] as! [String]
        allNames = dictionary["allNames"] as! [String]
        allMessages = dictionary["allMessages"] as! [String]
    }
}

extension ViewController: SkeletonTableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! Cell
        print(indexPath.row)
        cell.contentView.isSkeletonable = true
        cell.isSkeletonable = true
        cell.headerOne.isSkeletonable = true
        cell.headerTwo.isSkeletonable = true
        cell.image.isSkeletonable = true
        cell.headerOne.skeletonTextLineHeight = .relativeToFont
        cell.headerTwo.skeletonTextLineHeight = .relativeToFont
        cell.headerTwo.linesCornerRadius = 10
        cell.headerOne.linesCornerRadius = 10
        cell.image.skeletonCornerRadius = 35
        
        if !allNames.isEmpty {
            cell.image.image = UIImage(named: allImages[indexPath.row])
            cell.headerOne.text = allNames[indexPath.row]
            cell.headerTwo.text = allMessages[indexPath.row]
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        9
    }
    
    func collectionSkeletonView(_ skeletonView: UITableView, cellIdentifierForRowAt indexPath: IndexPath) -> ReusableCellIdentifier {
        cellID
    }
}

// MARK: SetupUI

extension ViewController {
    private func setupUI() {
        
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//            tableView.topAnchor.constraint(equalTo: self.safeAreaLa)
            tableView.widthAnchor.constraint(equalTo: self.view.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.view.heightAnchor)
        ])
    }
}
