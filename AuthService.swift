//
//  AuthService.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import Foundation
import Alamofire

class AuthService {

    // MARK - User Default Functions
    class func isGuest() -> Bool {
        return getToken().isEmpty
    }
    class func getToken() -> String {
        return DefaultsStorage.getString(by: .token)
    }
    class func setToken(token: String) {
        DefaultsStorage.set(string: token, by: .token)
    }
    
    class func setBooleanData(by key: DefaultsStorageKey, bool: Bool) {
        DefaultsStorage.set(bool: bool, by: key)
    }
    class func getBooleanData(by key: DefaultsStorageKey) -> Bool {
        return DefaultsStorage.getBool(by: key)
    }
    class func getInt(by key: DefaultsStorageKey) -> Int {
        return DefaultsStorage.getInteger(by: key)
    }
    class func setInt(by key: DefaultsStorageKey, int: Int) {
        DefaultsStorage.set(int: int, by: key)
    }
    class func getUser() -> LoginModel? {
        if let user: LoginModel = DefaultsStorage.getEntity(by: .user) {
            return user
        }
        return nil
    }
    class func setUser(user: LoginModel?) {
        setToken(token: user?.token ?? "")
        DefaultsStorage.set(entity: user, by: .user)
    }
    class func logoutUser(_ sendLogoutRequest: Bool) {
        if !sendLogoutRequest {
            clearDatas()
            return
        }

    }
    class func clearDatas() {
        clearUserDatas()
    }
    class func clearUserDatas() {
        DefaultsStorage.delete(by: .token)
    }
}
