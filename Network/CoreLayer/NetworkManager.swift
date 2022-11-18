//
//  NetworkManager.swift
//  NewApp
//
//  Created by Fagan Aslanli on 12.11.22.
//

import Alamofire

enum Api: String {
    case baseURL = "http://faradheus-001-site1.itempurl.com/api/"
}

enum NetworkResponse<T> {
    case success(T)
    case failure(ErrorModel)
}

struct NetworkManager {
    static let shared = NetworkManager()
    
    func header() -> HTTPHeaders {
        ["Authorization": "Bearer "]
    }
    
    func requestUrl(url: String) -> String {
        url
    }
}

extension Data {
    func decode<T: Decodable>() throws -> T {
        return (try! JSONDecoder().decode(T.self, from: self))
    }
}

