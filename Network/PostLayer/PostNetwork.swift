//
//  PostNetwork.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

protocol PostNetworkProtocol {
    func getList(completion: @escaping ([PostModel]) -> (), failure: @escaping (String) -> ())
}

class PostNetwork: PostNetworkProtocol {
    static let shared = PostNetwork()
    
    let network = NetworkRequest.shared
    
    func getList(completion: @escaping ([PostModel]) -> (), failure: @escaping (String) -> ()) {
        let url = PostManager.posts.path
        network.get(type: [PostModel].self, url: url) { response in
            switch response {
            case .success(let model):
                completion(model)
            case .failure(let error):
                failure(error.message ?? "")
            }
        }
    }
}
