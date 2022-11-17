//
//  AccountNetwork.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

protocol AccountNetworkProtocol {
    func login(data: [String : Any], completion: @escaping (LoginModel) -> (), failure: @escaping (String) -> ())
}

class AccountNetwork: AccountNetworkProtocol {
    static let shared = AccountNetwork()
    
    let network = NetworkRequest.shared
    private init() {
    }
    
    func login(data: [String : Any], completion: @escaping (LoginModel) -> (), failure: @escaping (String) -> ()) {
        let url = AccountManager.login.path
        network.request(type: LoginModel.self,url: url, method: .post, params: data) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .failure(let error):
                failure(error.message ?? "")
            }
        }
    }
}
