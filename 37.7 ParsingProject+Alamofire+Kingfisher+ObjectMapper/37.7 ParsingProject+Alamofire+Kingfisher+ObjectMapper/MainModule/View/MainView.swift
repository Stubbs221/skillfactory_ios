//
//  ViewController.swift
//  37.7 ParsingProject+Moya+Alamofire+Kingfisher+ObjectMapper
//
//  Created by MAC on 29.07.2022.
//

import UIKit

class MainView: UIViewController {

    weak var currentTableView: UITableView!
    
    var newsArray: ArticlesModel!
    
    var indicatorVC = SpinnerViewController()
    
    let queue1 = DispatchQueue(label: "com.queue1", qos: .default, attributes: .concurrent)
    let group = DispatchGroup()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData(type: ArticlesModel.self, success: successParsed, fail: failParsed(_:))
//        configureView()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        moveIndicator()
    }


}

