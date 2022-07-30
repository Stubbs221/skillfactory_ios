//
//  Extension + MainView.swift
//  37.7 ParsingProject+Moya+Alamofire+Kingfisher+ObjectMapper
//
//  Created by MAC on 29.07.2022.
//

import Foundation
import UIKit
import Kingfisher

extension MainView {
    func configureView() {
        
        let tableView = UITableView()
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
        tableView.register(NewsCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func successParsed() {
        print("Successfully fetched to data array")
    }
    
    func failParsed(_ error: NSError) {
        print("Error when fetched \n\n \(error.localizedDescription)")
    }
    
    func moveIndicator() {
        addChild(indicatorVC)
        indicatorVC.view.frame = view.frame
        view.addSubview(indicatorVC.view)
        indicatorVC.didMove(toParent: self)
    }
    
    func stopIndicator() {
        self.indicatorVC.willMove(toParent: nil)
        self.indicatorVC.view.removeFromSuperview()
        self.indicatorVC.removeFromParent()
    }
}
extension MainView: UITableViewDelegate {
    
}

extension MainView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? NewsCell else { return UITableViewCell()}
        
        if newsArray.articles.count > 0 {
            cell.newsDescriptionLabel.text = newsArray.articles[indexPath.row].newsDescription
            cell.newsImage.kf.setImage(with: URL(string: newsArray.articles[indexPath.row].imageURL)!)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    
    
    
}
