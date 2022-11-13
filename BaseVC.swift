//
//  BaseVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 13.11.22.
//

import UIKit

class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        if #available(iOS 13.0, *) {
            
            // Always adopt a light interface style.
            overrideUserInterfaceStyle = .light
        }

        setupView()
        setupLabels()
        setupTargets()
    }
    // MARK: - Initialization Functions
    func setupView() {}
    func setupLabels() {}
    func setupTargets() {}
}
extension BaseVC: UIGestureRecognizerDelegate {}
