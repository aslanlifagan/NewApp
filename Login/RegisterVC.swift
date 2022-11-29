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
    
    // MARK: Variables
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupView() {
        super.setupView()
    }
    override func setupTargets() {
        super.setupTargets()
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
    }
    override func setupLabels() {
        super.setupLabels()
        navbar.setTitle(title: "Register")
    }
    
    // MARK: - Private Functions
    private func sendRequest() {
        let params: [String: Any] = [
            "Name": "aa",
            "Surname": "aa",
            "Username": "aa",
            "Password": "111",
            "RepeatePassword": "111",
            "Phone": "0555363996",
            "Email": "aas@gmail.com",
            "Gender": "Male",
        ]
        startLoading()
        viewModel.register(params: params)
        viewModel.successCallback = { [weak self] in
            self?.stopLoading()
            self?.showMessage("geldi")
        }
        viewModel.failureCallback = { [weak self] errorMessage in
            self?.stopLoading()
            self?.showMessage(errorMessage)
        }
    }
    // MARK: @objc Functions
    @objc private func registerButtonClicked() {
        sendRequest()
    }
}
