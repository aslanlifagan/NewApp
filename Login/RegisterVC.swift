//
//  RegisterVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import UIKit

class RegisterVC: BaseVC {
    // MARK: Outlets
    @IBOutlet private weak var navbar: NavBarView!
    @IBOutlet private weak var nameTextField: CustomUITextField!
    @IBOutlet private weak var surnameTextField: CustomUITextField!
    @IBOutlet private weak var usernameTextField: CustomUITextField!
    @IBOutlet private weak var emailTextField: CustomUITextField!
    @IBOutlet private weak var passTextField: CustomUITextField!
    @IBOutlet private weak var repeatPassTextField: CustomUITextField!
    @IBOutlet private weak var phoneTextField: CustomUITextField!
    @IBOutlet private weak var registerButton: UIButton!
    @IBOutlet private weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupView() {
        super.setupView()
    }
    override func setupTargets() {
        super.setupTargets()
    }
    override func setupLabels() {
        super.setupLabels()
        navbar.setTitle(title: "Register")
    }
    // MARK: @objc Functions
}
