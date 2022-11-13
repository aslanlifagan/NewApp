//
//  BaseNavigation.swift
//  NewApp
//
//  Created by Fagan Aslanli on 14.11.22.
//

import UIKit

class BaseNavigation: UINavigationController {

    var onFinish: (() -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarHidden(true, animated: false)
    }
}
