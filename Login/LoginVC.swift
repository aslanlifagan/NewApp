//
//  LoginVC.swift
//  NewApp
//
//  Created by Fagan Aslanli on 17.11.22.
//

import UIKit

class LoginVC: BaseVC {
    // MARK: Outlets
    @IBOutlet private weak var userNameTextField: CustomUITextField!
    @IBOutlet private weak var emailTextField: CustomUITextField!
    @IBOutlet private weak var passwordTextField: CustomUITextField!
    @IBOutlet private weak var submitButton: UIButton!
    @IBOutlet private weak var registerButton: UIButton!
    
    // MARK: Variables
    let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func setupView() {
        super.setupView()
        Helper.checkSubmitButton(btn: submitButton, disabled: true)
    }
    override func setupTargets() {
        super.setupTargets()
        registerButton.addTarget(self, action: #selector(registerButtonClicked), for: .touchUpInside)
        submitButton.addTarget(self, action: #selector(submitButtonClicked), for: .touchUpInside)
    }
    override func setupLabels() {
        super.setupLabels()
        userNameTextField.text = "Aslanli96"
        emailTextField.text = "aslanli9696@gmail.com"
        passwordTextField.text = "Aslanli96."
    }
    
    // MARK: - Private Functions
    private func sendRequest() {
        let body: [String: Any] = [
            "username": userNameTextField.text ?? "",
            "email": emailTextField.text ?? "",
            "password": passwordTextField.text ?? ""
        ]
        startLoading()
        viewModel.login(body: body)
        viewModel.successCallback = { [weak self] in
            self?.stopLoading()
            self?.presentVC(Navigator.instance.getMainRoot(), animated: true)
        }
        viewModel.failureCallback = { [weak self] errorMessage in
            self?.stopLoading()
            self?.showMessage(errorMessage)
        }
    }
    
    // MARK: @objc Functions
    @objc private func registerButtonClicked() {
        pushVC(Navigator.instance.getRegisterVC(), animated: true)
    }
    
    @objc func submitButtonClicked () {
        let email = emailTextField.text ?? "", pass = passwordTextField.text ?? "", usern = userNameTextField.text ?? ""
        
        if usern.isEmpty {
            showMessage("Username is required")
            return
        }
        if email.isEmpty {
            showMessage("Email is required")
            return
        }
        if !email.isEmail {
            showMessage("Email is invalid")
            return
        }
        if pass.isEmpty {
            showMessage("Pass is required")
            return
        }
        sendRequest()
    }
}

extension  LoginVC: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        let email = emailTextField.text ?? "", pass = passwordTextField.text ?? "", user = userNameTextField.text ?? ""
        let emailTyped = !email.isEmpty, passTyped = !pass.isEmpty, userTyped = !user.isEmpty
        Helper.checkSubmitButton(btn: submitButton, disabled: !(emailTyped && passTyped && userTyped))
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField:
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
            break
        case passwordTextField:
            submitButtonClicked()
            break
        default:
            break
        }
        return true
        
    }
}
