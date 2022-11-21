//
//  LoginViewController.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entrar"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Entre com suas credenciais"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Username"
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Entrar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel,
                                                       descriptionLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        return stackView
    }()

    private lazy var textFieldStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField,
                                                       passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
}

extension LoginViewController: Viewcode {
    func buildViewHierarchy() {
        view.addSubview(labelStackView)
        view.addSubview(textFieldStackView)
        view.addSubview(loginButton)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            labelStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            labelStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            labelStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            textFieldStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 50),
            textFieldStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            textFieldStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 30),
            loginButton.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            loginButton.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            loginButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}
