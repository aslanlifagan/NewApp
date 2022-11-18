//
//  SplashVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 18.11.22.
//

import UIKit

class SplashVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) { [weak self] in
            self?.checkDatas()
        }
    }
    
    private func checkDatas() {
        startLoading()
        
        if AuthService.isGuest() {
            presentVC(Navigator.instance.getLoginRoot(), animated: true)
            stopLoading()
            return
        }
        presentVC(Navigator.instance.getMainRoot(), animated: true)
        stopLoading()
    }
}
