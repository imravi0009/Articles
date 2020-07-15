//
//  File.swift
//  Articles
//
//  Created by Ravi kumar on 15/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation

protocol ArticleDataDelegate:class {
    func didRecievNewArticles()
    func didRecieveError(err:Error)
}

class ArticleListViewModel {
    private var articles :[Article]
    private weak var delegate: ArticleDataDelegate?
    private var currentPage = 1
    var isMoreDataAvailable = true

    init(_ target:ArticleDataDelegate) {
        self.delegate = target
        articles = []
    }
    
    func fetchNewArticles() {
        if !isMoreDataAvailable{ return}
        NetworkManager().fetchArticles(RequestType.fetchArticles(page: currentPage)) { [unowned self](arts, error) in
            if let er = error{
                self.delegate?.didRecieveError(err: er)
            }
            else if let tempArticles = arts{
                if tempArticles.count > 0 {
                    self.currentPage += 1
                }
                else{
                    self.isMoreDataAvailable = false
                }
                self.articles.append(contentsOf: tempArticles)
                self.delegate?.didRecievNewArticles()
            }
        }
    }
    
    
    var articlesCount: Int {
        return articles.count
    }
    
    func articleFor(_ index:Int) -> ArticleViewModel {
        let article = articles[index]
        return ArticleViewModel(article)
    }
    
}


struct ArticleViewModel {
    private  var article : Article
    
    init(_ article:Article) {
        self.article = article
    }
    
    var userName: String {
        return article.user.name
    }
    
    var userAvtarURL: URL? {
        return URL(string:article.user.avatar)
    }
    
    var userDesination: String {
        return article.user.designation
    }
    
    var likeCount: String {
        return "\(article.likes.getCountFormatted()) Likes"
    }
    
    var commentsCount: String {
        return "\(article.comments.getCountFormatted()) Comments"
    }
    
    var postContent: String {
        return article.content
    }
    
    
    var timeAgo: String {
        let dateFormattor = DateFormatter()
        dateFormattor.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        guard let date = dateFormattor.date(from: article.createdAt) else {return ""}
        return date.getElapsedInterval()
    }
    
    var postImageURL: URL? {
        return URL(string:article.media?.image ?? "")
    }
    
}


