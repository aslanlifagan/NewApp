//
//  HomeViewModel.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import Foundation
class HomeViewModel {
    var countryList = Country()
    let countryNetwork = CountryNetwork.shared
    var successCallback: (()->())?
    var failureCallback: ((String)->())?
    
    func getAllCountriesList() {
        countryNetwork.getAllCountries { [weak self] result in
            let list = result.sorted(by: { $0.area ?? 0.0 > $1.area ?? 0.0 } )
            self?.countryList = list
            self?.successCallback?()
        } failure: { [weak self] error in
            self?.failureCallback?(error)
        }
    }
}

