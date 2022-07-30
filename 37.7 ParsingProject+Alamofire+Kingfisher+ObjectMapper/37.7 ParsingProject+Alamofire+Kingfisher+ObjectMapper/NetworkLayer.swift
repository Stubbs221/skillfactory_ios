//
//  NetworkLayer.swift
//  37.7 ParsingProject+Moya+Alamofire+Kingfisher+ObjectMapper
//
//  Created by MAC on 29.07.2022.
//

import Foundation
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

extension MainView {
//    func request(_ url: URL) {
//        AF.request(NewsModel.urlAPI()).responseArray { (response: AFDataResponse<[NewsModel]>) in
//            <#code#>
//        }
//    }
    func getData(type: ArticlesModel.Type, success: @escaping() -> Void, fail: @escaping(_ error: NSError) -> Void) {
        
//        group.enter()
//        queue1.async(group: group) {
            AF.request(NewsModel.urlAPI()).responseObject { (response: AFDataResponse<ArticlesModel>) in
                switch response.result {
                case .success(let items):
                    self.newsArray = items
                        success()
//                    self.group.leave()
                case .failure(let error):
                    fail(error as NSError)
//                    self.group.leave()
                }
                print("сукабля")
            }
        self.configureView()
        self.stopIndicator()
//        self.currentTableView.reloadData()
        }
//        group.wait()
        
//        group.notify(queue: .main) {
            
           
        }
        
        


