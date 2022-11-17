//
//  Navigator+Login.swift
//  NewApp
//
//  Created by Fagan Aslanli on 16.11.22.
//

import UIKit

extension Navigator {
    func getLoginRoot() -> BaseNavigation {
        let nav = getStoryboard(with: .login).instantiateInitialViewController() as! BaseNavigation
        nav.setupFullScreenModal()
        return nav
    }
    func getRegisterVC() -> RegisterVC {
        let vc = getStoryboard(with: .login).instantiateViewController(withIdentifier: String(describing: RegisterVC.self)) as! RegisterVC
        return vc
    }
}
