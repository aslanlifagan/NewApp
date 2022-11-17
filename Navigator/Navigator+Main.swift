//
//  Navigator+Main.swift
//  NewApp
//
//  Created by Fagan Aslanli on 16.11.22.
//

import UIKit

extension Navigator {
    func getMainRoot() -> BaseNavigation {
        let nav = getStoryboard(with: .main).instantiateInitialViewController() as! BaseNavigation
        nav.setupFullScreenModal()
        return nav
    }
}
