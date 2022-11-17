//
//  AccountManager.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import Foundation
enum AccountEndpoint: String {
    case login = "Account/login"
}

enum AccountManager {
    case login
    
    var path: String {
        switch self {
        case .login:
            return NetworkManager.shared.requestUrl(url: "http://faradheus-001-site1.itempurl.com/api/Account/login")
        }
    }
}
