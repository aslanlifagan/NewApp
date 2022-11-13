//
//  ErrorModel.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}

// MARK: - ErrorModel
struct ErrorModel: Codable {
    let status: Int?
    let error, message, path: String?
    
    static func localError() -> ErrorModel {
        return ErrorModel(status: nil, error: nil, message: "Unexpected error happened", path: nil)
    }
}
