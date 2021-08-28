//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by Donia Ashraf on 26/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
class NewsViewModel{
    
    private let networkService:NetworkServiceProtocol
    var bindToView:()->() = {}
    var bindErrorToView:()->() = {}
    
    init(networkService:NetworkServiceProtocol = NetworkService()) {
        self.networkService = NetworkService()
        getNews()
    }
    
    var articles:[Article]?{
        didSet{
            bindToView()
        }
    }
    var error:String?{
        didSet{
            bindErrorToView()
        }
    }
    private func getNews(){
        networkService.getNews(){
            [weak self](articles,error) in
            
            if let error = error{
                let message = error.localizedDescription
                self?.error = message
            }
            else{
                if let articles = articles {
                    self?.articles = articles
                }
            }
        }
        
    }
    func search(articles:[Article],searchText:String)->[Article]{
        return searchText.isEmpty ? articles : articles.filter({
            (data:Article)->Bool in
            return data.newsTitle.range(of: searchText, options: .caseInsensitive) != nil
        })
    }
    
    
}
