//
//  CountryManager.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Foundation
enum CountryEndpoint: String {
    case all = "all"
}

enum CountryManager {
    case all
    
    var path: String {
        switch self {
        case .all:
            return NetworkManager.shared.requestUrl(url: "https://restcountries.com/v3.1/all")
        }
    }
}
