//
//  NetworkService.swift
//  NewsApp
//
//  Created by Donia Ashraf on 26/08/2021.
//  Copyright © 2021 Donia Ashraf. All rights reserved.
//

import Foundation
import Alamofire

protocol NetworkServiceProtocol {
    func getNews(completion: @escaping ([Article]? , Error?) -> ())
}
class NetworkService :NetworkServiceProtocol{
    
    func getNews(completion: @escaping ([Article]?, Error?) -> ()) {
        AF.request(Urls.getUrl()).validate().responseDecodable(of: News.self) {
            (response) in
            switch response.result {
            case .success(_):
                guard let data = response.value else {return }
                completion(data.articles , nil)
                
            case .failure(let error):
                print(error)
                completion(nil,error)
            }
        }
        
    }
}
