//
//  ViewController.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 09.08.2022.
//

import UIKit

class AuthViewController: UIViewController {
    //MARK: - UIElements
    let logoImageView = UIImageView(image: UIImage(named: "Logo"), contentMode: .center)

    let emailLabel = UILabel(text: "Зарегистрироваться",textColor: .black)
    let alreadyOnboardLabel = UILabel(text: "Войти",textColor: .black)

    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .orange, font: .semiBold20(), isShadow: true)

    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .orange, isShadow: true)

    //MARK: - init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        setupConstraints()
    }
}

//MARK: - Setup Constraints
extension AuthViewController {
    private func setupConstraints() {
        logoImageView.translatesAutoresizingMaskIntoConstraints = false

        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyOnboardLabel, button: loginButton)

        let stackView = UIStackView(arrangedSubviews: [emailView, loginView], axis: .vertical, spacing: 120)
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(logoImageView)
        logoImageView.addSubview(stackView)

        logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        stackView.topAnchor.constraint(equalTo: logoImageView.topAnchor, constant: 280).isActive = true
        stackView.leadingAnchor.constraint(equalTo: logoImageView.leadingAnchor, constant: 140).isActive = true
        stackView.trailingAnchor.constraint(equalTo: logoImageView.trailingAnchor, constant: -140).isActive = true
    }
}

//MARK: - SwiftUI
import SwiftUI

struct AuthViewControllerProvider: PreviewProvider {
    static var previews: some View {
        ContainerView()
            .edgesIgnoringSafeArea(.all)
    }

    struct ContainerView: UIViewControllerRepresentable {

        let viewController = AuthViewController()

        func makeUIViewController(context: Context) -> some AuthViewController {
            return viewController
        }

        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
    }
}

