//
//  RegistrationViewController.swift
//  TechTaskOnlineShop
//
//  Created by Анатолий Силиверстов on 13.03.2023.
//

import UIKit

protocol RegistrationControllerDelegate: AnyObject {
    func showLoginScreen()
    func showMainTabBarScreen()
}

final class RegistrationViewController: UIViewController {
    
    private var viewModel: RegistrationViewModelType
    weak var coordinator: RegistrationControllerDelegate?
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.signInTitle
        label.textAlignment = .center
        label.font = .montserratSemiBold24
        return label
    }()
    
    private let nameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: Constants.firstNamePlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        textField.textAlignment = .center
        textField.font = .montserratRegular12
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = NumericalConstannts.defaultCornerRadius
        return textField
    }()
    
    private let lastnameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: Constants.lastNamePlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        textField.textAlignment = .center
        textField.font = .montserratRegular12
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = NumericalConstannts.defaultCornerRadius
        return textField
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.attributedPlaceholder = NSAttributedString(
            string: Constants.emailPlaceholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.darkGray]
        )
        textField.textAlignment = .center
        textField.font = .montserratRegular12
        textField.backgroundColor = .systemGray5
        textField.layer.cornerRadius = NumericalConstannts.defaultCornerRadius
        textField.tag = NumericalConstannts.emailTextFieldTag
        return textField
    }()
    
    private let warningLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .montserratRegular12
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.isHidden = true
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.signInTitle, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .customSystemColor
        button.titleLabel?.font = .montserratSemiBold17
        button.layer.cornerRadius = NumericalConstannts.defaultCornerRadius
        return button
    }()
    
    private var haveAnAccountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Constants.alreadyHaveAccount
        label.font = .montserratRegular12
        label.textColor = .darkGray
        return label
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(Constants.logInTitle, for: .normal)
        button.setTitleColor(UIColor.customSystemColor, for: .normal)
        button.titleLabel?.font = .montserratRegular12
        return button
    }()
    
    private var logInStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 5
        return stack
    }()
    
    private let googleSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle(Constants.signInWithGoogle, for: .normal)
        button.setImage(ImageConstants.googleLabelImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 20
        )
        button.tintColor = .black
        button.titleLabel?.font = .montserratRegular14
        return button
    }()
    
    private let appleSignInButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.black, for: .normal)
        button.setTitle(Constants.signInWithApple, for: .normal)
        button.setImage(ImageConstants.appleLabelImage, for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(
            top: 0,
            left: 0,
            bottom: 0,
            right: 20
        )
        button.tintColor = .black
        button.titleLabel?.font = .montserratRegular14
        return button
    }()
    
    init(viewModel: RegistrationViewModelType) {
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
        setDelegates()
        addTargets()
    }
    
    private func setupView() {
        view.backgroundColor = UIColor.backgroundColor
    }
    private func setupHierarchy() {
        logInStackView.addArrangedSubview(haveAnAccountLabel)
        logInStackView.addArrangedSubview(logInButton)
        
        view.addSubviews([
            signInLabel,
            nameTextField,
            lastnameTextField,
            emailTextField,
            warningLabel,
            signInButton,
            logInStackView,
            googleSignInButton,
            appleSignInButton
        ])
    }
    
    private func setupLayout() {
        
        NSLayoutConstraint.activate([
            signInLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            signInLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            signInLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 156),
            
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            nameTextField.topAnchor.constraint(equalTo: signInLabel.bottomAnchor, constant: 77),
            nameTextField.heightAnchor.constraint(equalToConstant: 29),
            
            lastnameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            lastnameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            lastnameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 35),
            lastnameTextField.heightAnchor.constraint(equalToConstant: 29),
            
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            emailTextField.topAnchor.constraint(equalTo: lastnameTextField.bottomAnchor, constant: 35),
            emailTextField.heightAnchor.constraint(equalToConstant: 29),
            
            warningLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            warningLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            warningLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 17),
            
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            signInButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 35),
            signInButton.heightAnchor.constraint(equalToConstant: 46),
            
            logInStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            logInStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 17),
            
            appleSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            appleSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            appleSignInButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -133),
            
            googleSignInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 42),
            googleSignInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -42),
            googleSignInButton.bottomAnchor.constraint(equalTo: appleSignInButton.topAnchor, constant: -48),
        ])
    }
    
    private func setDelegates() {
        nameTextField.delegate = self
        lastnameTextField.delegate = self
        emailTextField.delegate = self
    }
    
    private func addTargets() {
        signInButton.addTarget(
            self,
            action: #selector(checkUserData),
            for: .touchUpInside
        )
        logInButton.addTarget(
            self,
            action: #selector(showLogInScreen),
            for: .touchUpInside
        )
    }
    
    @objc private func checkUserData() {
        guard let firstName = nameTextField.text, firstName != "",
              let lastName = lastnameTextField.text, lastName != "",
              let email = emailTextField.text, email != "" else {
            warningLabel.text = Constants.fillInAllTheFields
            warningLabel.isHidden = false
            return
        }
        guard viewModel.emailIsValid(email: email) else {
            warningLabel.isHidden = false
            warningLabel.text = Constants.wrongEmailFormat
            return
        }
        if viewModel.checkUserDataWith(firstName: firstName, lastName: lastName, email: email) {
            coordinator?.showMainTabBarScreen()
        } else {
            warningLabel.text = Constants.userAlreadyRegistered
            warningLabel.isHidden = false
        }
    }
    
    @objc private func showLogInScreen() {
        coordinator?.showLoginScreen()
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.tag == NumericalConstannts.emailTextFieldTag {
            guard let text = textField.text, viewModel.emailIsValid(email: text) else {
                warningLabel.isHidden = false
                warningLabel.text = Constants.wrongEmailFormat
                return}
            warningLabel.isHidden = true
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

