//
//  WebService.swift
//  Articles
//
//  Created by Ravi kumar on 15/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation

enum RequestType:String {
    case fetchArticles
    
    var url: URL! {
           switch self {
           case .fetchArticles:
            return URL(string: NetworkManager.BASEURL + "jet2/api/v1/blogs?page=1&limit=10")!
           }
       }
    
}
class NetworkManager {
    
    static let BASEURL = "https://5e99a9b1bc561b0016af3540.mockapi.io/"
    
    fileprivate func load(url: URL, withCompletion completion: @escaping (Data?,Error?) -> Void) {
        let session = URLSession(configuration: .ephemeral, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url, completionHandler: { (data: Data?, response: URLResponse?, error: Error?) -> Void in
            completion(data,error)
        })
        task.resume()
    }
    
    func fetchArticles(request type: RequestType, completion: @escaping ([Article]?,Error?) -> Void) {
        
        load(url: type.url) { data,err  in
            if let data = data {
                let articles = try? JSONDecoder().decode([Article].self, from: data)
                completion(articles,nil)
            } else {
                completion([],err)
            }
        }
    }
}
