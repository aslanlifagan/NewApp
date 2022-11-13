//
//  NetworkRequest.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Alamofire

class NetworkRequest {
    static let shared = NetworkRequest()
    
    func post<T: Codable>(type: T.Type,
                          url: String,
                          params: [String: Any] = [:],
                          completion: @escaping(NetworkResponse<T>)->Void) {
//        print("url: \(url)")
//        print("param: \(params)")
//        print("header: \(NetworkManager.shared.header())")
        AF.request(url,
                   method: .post,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: NetworkManager.shared.header()).responseData { response in
                    self.handleResponseData(response: response) { complete in
                        completion(complete)
                    }
                   }
    }
    
    func get<T: Codable>(type: T.Type,
                         url: String,
                         completion: @escaping(NetworkResponse<T>)->Void) {
        print("url: \(url)")
        print("header: \(NetworkManager.shared.header())")
        AF.request(url,
                   method: .get,
                   encoding: JSONEncoding.default,
                   headers: NetworkManager.shared.header()).responseData { response in
                    self.handleResponseData(response: response) { complete in
                        completion(complete)
                    }
                   }
    }
    
    func delete<T: Codable>(type: T.Type,
                            url: String,
                            params: [String: Any] = [:],
                            completion: @escaping(NetworkResponse<T>)->Void) {
//        print("url: \(url)")
//        print("param: \(params)")
//        print("header: \(NetworkManager.shared.header())")
        AF.request(url,
                   method: .delete,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: NetworkManager.shared.header()).responseData { response in
            self.handleResponseData(response: response) { complete in
                completion(complete)
            }
        }
    }
    
    func patch<T: Codable>(type: T.Type,
                           url: String,
                           params: [String: Any] = [:],
                           completion: @escaping(NetworkResponse<T>)->Void) {
//        print("url: \(url)")
//        print("param: \(params)")
//        print("header: \(NetworkManager.shared.header())")
        AF.request(url,
                   method: .patch,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: NetworkManager.shared.header()).responseData { response in
            self.handleResponseData(response: response) { complete in
                completion(complete)
            }
        }
    }
    
    func put<T: Codable>(type: T.Type,
                         url: String,
                         params: [String: Any] = [:],
                         completion: @escaping(NetworkResponse<T>)->Void) {
//        print("url: \(url)")
//        print("param: \(params)")
//        print("header: \(NetworkManager.shared.header())")
        AF.request(url,
                   method: .put,
                   parameters: params,
                   encoding: JSONEncoding.default,
                   headers: NetworkManager.shared.header()).responseData { response in
            self.handleResponseData(response: response) { complete in
                completion(complete)
            }
        }
    }
    
    private func handleResponseData<T: Codable>(response: AFDataResponse<Data>,
                                                completion: @escaping(NetworkResponse<T>) -> ()) {
        if let code = response.response?.statusCode {
            print("responseCode: \(code)")
            if let responseData = response.data { //if status code is not 200 or 201, response.data not comes with nil. that's why we need to handle it.
                
                switch code {
                case 200, 201:
                    do {
                        let model = try JSONDecoder().decode(T.self, from: responseData)
                        print("parsed")
                        print("model: \(model)")
                        completion(.success(model))
                    } catch {
                        print("failed in catch{}")
                        completion(.failure(errorDecode(data: response.data)))
                    }
                default:
                    do {
                        let model = try JSONDecoder().decode(ErrorModel.self, from: responseData)
                        print("error model: \(model)")
                        completion(.failure(model))
                    } catch {
                        print("failed in error case catch{}")
                        completion(.failure(errorDecode(data: response.data)))
                    }
                }
            } else {
                print("failed in else")
                completion(.failure(errorDecode(data: nil)))
            }
        }
    }
    
    fileprivate func errorDecode(data: Data?) -> ErrorModel {
        guard let data = data,
              let model = try? JSONDecoder().decode(ErrorModel.self, from: data) else {
            return ErrorModel.localError()
        }
        return model
    }
}
