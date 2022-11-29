//
//  LoginViewModel.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import Foundation
class LoginViewModel {
    let accountNetwork = AccountNetwork.shared
    var successCallback: (()->())?
    var failureCallback: ((String)->())?
    
    func login(body: [String: Any]) {
        accountNetwork.login(data: body) { [weak self] result in
            self?.successCallback?()
            AuthService.setUser(user: result)
        } failure: { [weak self] error in
            self?.failureCallback?(error)
        }
    }
    func register(params: [String: Any]) {
        accountNetwork.register(param: params) { [weak self] result in
            self?.successCallback?()
            AuthService.setUser(user: result)
        } failure: { [weak self] error in
            self?.failureCallback?(error)
        }
    }
}
