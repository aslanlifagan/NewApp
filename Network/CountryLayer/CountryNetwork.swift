//
//  CountryNetwork.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

protocol CountryNetworkProtocol {
    func getAllCountries(completion: @escaping (Country) -> (), failure: @escaping (String) -> ())
}

class CountryNetwork: CountryNetworkProtocol {
    static let shared = CountryNetwork()
    
    let network = NetworkRequest.shared
    
    func getAllCountries(completion: @escaping (Country) -> (), failure: @escaping (String) -> ()) {
        let url = CountryManager.all.path
        network.request(type: Country.self,url: url, method: .get) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .failure(let error):
                failure(error.message ?? "")
            }
        }
    }
}
