//
//  PostManager.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Foundation
enum PostEndpoint: String {
    case posts = "posts"
}

enum PostManager {
    case posts
    
    var path: String {
        switch self {
        case .posts:
            return NetworkManager.shared.requestUrl(url: PostEndpoint.posts.rawValue)
        }
    }
}
