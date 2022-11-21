//
//  RegisterViewController.swift
//  App
//
//  Created by Luiz Hartmann on 19/11/22.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var coordinator: RegisterCoordinator?
    private var userViewModel: UserViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        createTable()
        setup()
    }
    
    private func createTable() {
        let database = DB.sharedInstance
        database.createTable()
    }
    
    // MARK: - UI Components
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Registrar"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Preencha as informações abaixo"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 18, weight: .regular)
        return label
    }()
    
    private lazy var nameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Nome"
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.keyboardType = .default
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Senha"
        textField.autocapitalizationType = .none
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.keyboardType = .emailAddress
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.delegate = self
        return textField
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Salvar", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.layer.cornerRadius = 5
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(registerButtonTap), for: .touchUpInside)
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
        let stackView = UIStackView(arrangedSubviews: [nameTextField, emailTextField,
                                                       passwordTextField])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    @objc private func registerButtonTap() {
        
        let userViewModel = UserViewModel(user: User(id: 0, name: "",
                                                     email: emailTextField.text ?? String.empty,
                                                     password: passwordTextField.text ?? String.empty))
        
        self.coordinator?.create(userViewModel: userViewModel)
        
    }
}

extension RegisterViewController: Viewcode {
    func buildViewHierarchy() {
        view.addSubview(labelStackView)
        view.addSubview(textFieldStackView)
        view.addSubview(registerButton)
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
            
            registerButton.topAnchor.constraint(equalTo: textFieldStackView.bottomAnchor, constant: 30),
            registerButton.leadingAnchor.constraint(equalTo: textFieldStackView.leadingAnchor),
            registerButton.trailingAnchor.constraint(equalTo: textFieldStackView.trailingAnchor),
            registerButton.heightAnchor.constraint(equalTo: emailTextField.heightAnchor),
        ])
    }
    
    func applyExtraConfiguration() {
        view.backgroundColor = .systemBackground
    }
}

extension RegisterViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        return true
    }
}


