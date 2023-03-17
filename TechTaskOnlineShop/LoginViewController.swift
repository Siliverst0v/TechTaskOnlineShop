//
//  LoginViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func showMainTabBarScreen()
}

final class LoginViewController: UIViewController {
    
    private var viewModel: LoginViewModelType
    weak var delegate: LoginViewControllerDelegate?
    
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Welcome back"
        label.textAlignment = .center
        label.font = .montserratSemiBold24
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "First name",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        textField.textAlignment = .center
        textField.font = .montserratRegular12
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: "Password",
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        textField.textAlignment = .center
        textField.font = .montserratRegular12
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = 15
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: 0))
        textField.leftViewMode = .always
        textField.isSecureTextEntry = true
        textField.enablePasswordToggle()
        return textField
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "User with such data is not registered"
        label.font = .montserratRegular14
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isHidden = true
        return label
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customSystemColor
        button.titleLabel?.font = .montserratSemiBold17
        button.layer.cornerRadius = 15
        return button
    }()
    
    init(viewModel: LoginViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupHierarchy()
        setupLayout()
        setTargets()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.backgroundColor
    }
    private func setupHierarchy() {
        
        view.addSubviews([
            welcomeLabel,
            nameTextField,
            passwordTextField,
            warningLabel,
            loginButton
        ])
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            welcomeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            welcomeLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            nameTextField.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 77),
            nameTextField.heightAnchor.constraint(equalToConstant: 29),
            
            passwordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            passwordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            passwordTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 35),
            passwordTextField.heightAnchor.constraint(equalToConstant: 29),
            
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            warningLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            warningLabel.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -17),
            
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 99),
            loginButton.heightAnchor.constraint(equalToConstant: 46),
        ])
    }
    
    private func setTargets() {
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    @objc private func login() {
        guard let firstName = nameTextField.text, firstName != "" else {
            warningLabel.text = "Enter your first name"
            warningLabel.isHidden = false
            return}
        if viewModel.checkUserDataWith(firstName: firstName) {
            UserDefaultsManager.userIsLoggedIn = true
            delegate?.showMainTabBarScreen()
        } else {
            warningLabel.text = "User with such data is not registered"
            warningLabel.isHidden = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
