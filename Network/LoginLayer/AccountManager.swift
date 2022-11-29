//
//  AccountManager.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import Foundation
enum AccountEndpoint: String {
    case login = "Account/login"
    case register = "Account/register"
}

enum AccountManager {
    case login, register
    
    var path: String {
        switch self {
        case .login:
            return NetworkManager.shared.requestUrl(url: "http://faradheus-001-site1.itempurl.com/api/Account/login")
        case .register:
            return NetworkManager.shared.requestUrl(url: "http://faradheus-001-site1.itempurl.com/api/Account/register")
        }
    }
}
