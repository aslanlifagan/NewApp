//
//  PostModel.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Foundation
// MARK: - PostModel
struct PostModel: Codable {
    let userID, id: Int?
    let title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
