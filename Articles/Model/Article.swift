//
//  Article.swift
//  Articles
//
//  Created by Ravi kumar on 15/07/20.
//  Copyright © 2020 Ravi kumar. All rights reserved.
//

import Foundation

fileprivate struct RawServerResponse: Decodable {
 
    var id: String
    var createdAt: String
    var content: String
    var comments: Int
    var likes: Int
    var user: [User]
    var media: [Media]
}

 struct User:Decodable {
       var id: String
       var blogId: String
       var createdAt: String
       var name: String
       var avatar: String
       var lastname: String
       var city: String
       var designation: String
       var about: String
   }
   
   struct Media:Codable {
         var id: String
         var blogId: String
         var createdAt: String
         var image: String?
         var url: String
   }

struct Article: Decodable {
    
       var id: String
       var content: String
       var comments: Int
       var createdAt: String
       var likes: Int
       var user: User
       var media: Media?
    
    init(from decoder: Decoder) throws {
        let rawResponse = try RawServerResponse(from: decoder)

        id = rawResponse.id
        content = rawResponse.content
        comments = rawResponse.comments
        likes = rawResponse.likes
        user = rawResponse.user.first!
        media = rawResponse.media.first
        createdAt = rawResponse.createdAt

    }
}
