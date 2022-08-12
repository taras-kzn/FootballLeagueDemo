//
//  SignUpViewController.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 12.08.2022.
//

import UIKit

class SignUpViewController: UIViewController {
    //MARK: - UIElements
    let titleLabel = UILabel(text: "Регистрация", font: .semiBold26(),textColor: .orange)
    let emailLabel = UILabel(text: "Email",textColor: .black)
    let passwordLabel = UILabel(text: "Пароль",textColor: .black)
    let confirmPasswordLabel = UILabel(text: "Повторить пароль",textColor: .black)
    let alreadyOnboardLabel = UILabel(text: "Already onboard?",textColor: .black)

    let signUpButton = UIButton(title: "Зарегистрироваться", titleColor: .white, backgroundColor: .orange, isShadow: true)
    let loginButton = UIButton()

    let emailTextField = OneLineTextField(font: .semiBold20())
    let passwordTextField = OneLineTextField(font: .semiBold20())
    let confirmPasswordTextField = OneLineTextField(font: .semiBold20())

    //MARK: init
    override func viewDidLoad() {
        super.viewDidLoad()

        configure()
        setupConstraints()
    }

    //MARK: - private setup UI Elements
    private func configure() {
        view.backgroundColor = .white
        loginButton.setTitle("Login", for: .normal)
        loginButton.setTitleColor(.red, for: .normal)
        loginButton.titleLabel?.font = .semiBold20()
    }
}

//MARK: - setup Constraints
extension SignUpViewController {
    private func setupConstraints() {
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel,
                                                            emailTextField],
                                         axis: .vertical,
                                         spacing: 5)
        let passwordStackView = UIStackView(arrangedSubviews: [passwordLabel,
                                                               passwordTextField],
                                            axis: .vertical,
                                            spacing: 5)
        let confirmPasswordStackView = UIStackView(arrangedSubviews: [confirmPasswordLabel,
                                                                      confirmPasswordTextField],
                                                   axis: .vertical,
                                                   spacing: 5)
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true

        let stackView = UIStackView(arrangedSubviews: [emailStackView,
                                                       passwordStackView,
                                                       confirmPasswordStackView,
                                                       signUpButton],
                                    axis: .vertical,
                                    spacing: 40)

        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [alreadyOnboardLabel,
            loginButton],
                                          axis: .horizontal,
                                          spacing: 10)
        bottomStackView.alignment = .firstBaseline

        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(titleLabel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)

        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
                                     titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)])

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 140),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)])


        NSLayoutConstraint.activate([
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            bottomStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
        ])
    }
}

//MARK: - SwiftUI
import SwiftUI

struct SignUpViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = SignUpViewController()

        func makeUIViewController(context: Context) -> some SignUpViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}
