//
//  HomeViewModel.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Foundation
class HomeViewModel {
    var postList = [PostModel]()
    let postNetwork = PostNetwork.shared
    
    var successCallback: (()->())?
    var failureCallback: ((String)->())?
    
    func getList() {
        postNetwork.getList { [weak self] response in
            self?.postList = response
            self?.successCallback?()
        } failure: { [weak self] error in
            self?.failureCallback?(error)
        }
    }
}

