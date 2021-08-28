
//
//  News.swift
//  NewsApp
//
//  Created by Donia Ashraf on 26/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
struct News :Codable{
    let articles:[Article]?
}
struct Article:Codable {
    let newsImage:String?
    let newsTitle:String
    let newsSource:Source
    let newsDescription:String?
    
    enum CodingKeys: String ,CodingKey{
        case newsTitle = "title"
        case newsImage = "urlToImage"
        case newsDescription = "description"
        case newsSource = "source"
    }
    
}
struct Source:Codable {
    let name:String
}
