//
//  Model.swift
//  37.7 ParsingProject+Moya+Alamofire+Kingfisher+ObjectMapper
//
//  Created by MAC on 29.07.2022.
//

import Foundation
import ObjectMapper

struct ArticlesModel: Mappable {
    
    var articles: [NewsModel] = []
    
    init?(map: Map) {
        
    }
    mutating func mapping(map: Map) {
        articles <- map["articles"]
    }
    
    
   
    
}
struct NewsModel: Mappable {
    
    
    var imageURL: String = ""
    var newsDescription: String = ""
    
    static func urlAPI() -> String {
        return "https://newsapi.org/v2/everything?q=education&apiKey=e65a14fa5cf140b2b4761a685497e24c"
    }
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        imageURL <- map["status"]
        newsDescription <- map["status"]
    }
    
    
}

