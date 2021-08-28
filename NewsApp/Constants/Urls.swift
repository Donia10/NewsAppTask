//
//  Urls.swift
//  NewsApp
//
//  Created by Donia Ashraf on 26/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation

struct Urls {
    private static let url = "https://newsapi.org/v2/top-headlines?country=eg&apiKey=13f58a214cff4922a9fdd3416cc326e5"
    
     static func getUrl() -> String {
        return url
    }
}
