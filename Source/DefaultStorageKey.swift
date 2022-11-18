//
//  DefaultStorageKey.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import Foundation
import UIKit

enum DefaultsStorageKey: String {
    case token = "__app_token"
    case user = "__app_user"
    
}

class DefaultsStorage {
    
    // MARK: - String
    class func set(string: String, by key: DefaultsStorageKey) {
        UserDefaults.standard.set(string, forKey: key.rawValue)
    }
    
    class func getString(by key: DefaultsStorageKey) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    // MARK: - Int
    class func set(int: Int, by key: DefaultsStorageKey) {
        UserDefaults.standard.set(int, forKey: key.rawValue)
    }
    
    class func getInteger(by key: DefaultsStorageKey) -> Int {
        return UserDefaults.standard.integer(forKey: key.rawValue)
    }
    
    // MARK: - Float
    class func set(float: Float, by key: DefaultsStorageKey) {
        UserDefaults.standard.set(float, forKey: key.rawValue)
    }
    
    class func getFloat(by key: DefaultsStorageKey) -> Float {
        return UserDefaults.standard.float(forKey: key.rawValue)
    }
    
    // MARK: - Bool
    class func set(bool: Bool, by key: DefaultsStorageKey) {
        UserDefaults.standard.set(bool, forKey: key.rawValue)
    }
    
    class func getBool(by key: DefaultsStorageKey) -> Bool {
        return UserDefaults.standard.bool(forKey: key.rawValue)
    }
    
    // MARK: - Data
    class func set<T: Codable>(entity: T, by key: DefaultsStorageKey) {
        if let encoded = try? JSONEncoder().encode(entity) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        }
    }
    
    class func getEntity<T: Codable>(by key: DefaultsStorageKey) -> T? {
        guard let data = UserDefaults.standard.value(forKey: key.rawValue) as? Data else { return nil }
        let entity = try? JSONDecoder().decode(T.self, from: data)
        return entity
    }
    
    // MARK: - Delete
    class func delete(by key: DefaultsStorageKey) {
        UserDefaults.standard.removeObject(forKey: key.rawValue)
    }
}
