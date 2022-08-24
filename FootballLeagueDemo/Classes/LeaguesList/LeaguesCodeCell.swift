//
//  LeaguesCodeCell.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 24.08.2022.
//

import Foundation
import UIKit

protocol leagueCellViewModel {
    var title: String { get }
    var iconUrlString: String { get }
    var abbreviation: String { get }
}

final class LeaguesCodeCell: UITableViewCell {

    //MARK: - Properties
    static let reuseId = "LeaguesCodeCell"
    //первый слой
    let leagueView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 2
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    //второй слой
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = .semiBold26()
        label.textAlignment = .center
        return label
    }()

    let logoLeague: WebImageView = {
        let imageView = WebImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let abbreviationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.text = "abbreviationLabel"
        label.font = .semiBold20()
        label.textAlignment = .center
        return label
    }()

    //MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    //MARK: - setup
    func set(viewModel: leagueCellViewModel) {
        titleLabel.text = viewModel.title
        logoLeague.set(imageUrl: viewModel.iconUrlString)
        abbreviationLabel.text = viewModel.abbreviation
    }

    //MARK: - setupConstraints
    private func setupConstraints() {
        firstLayer()
        secondLayer()
    }

    //первый слой
    private func firstLayer() {
        addSubview(leagueView)

        leagueView.topAnchor.constraint(equalTo: topAnchor,constant: 10).isActive = true
        leagueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        leagueView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15).isActive = true
        leagueView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
    }
    //второй слой
    private func secondLayer() {
        leagueView.addSubview(titleLabel)
        leagueView.addSubview(logoLeague)
        leagueView.addSubview(abbreviationLabel)


        titleLabel.topAnchor.constraint(equalTo: leagueView.topAnchor, constant: 16).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leagueView.leadingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: leagueView.trailingAnchor, constant: -16).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: leagueView.heightAnchor, multiplier: 0.1).isActive = true

        logoLeague.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12).isActive = true
        logoLeague.centerXAnchor.constraint(equalTo: leagueView.centerXAnchor).isActive = true

        logoLeague.widthAnchor.constraint(equalTo: leagueView.heightAnchor, multiplier: 0.6).isActive = true
        logoLeague.heightAnchor.constraint(equalTo: leagueView.heightAnchor, multiplier: 0.6).isActive = true

        abbreviationLabel.topAnchor.constraint(equalTo: logoLeague.bottomAnchor, constant: 12).isActive = true
        abbreviationLabel.leadingAnchor.constraint(equalTo: leagueView.leadingAnchor, constant: 16).isActive = true
        abbreviationLabel.trailingAnchor.constraint(equalTo: leagueView.trailingAnchor, constant: -16).isActive = true
        abbreviationLabel.heightAnchor.constraint(equalTo: leagueView.heightAnchor, multiplier: 0.1).isActive = true
        abbreviationLabel.bottomAnchor.constraint(equalTo: leagueView.bottomAnchor, constant: -16).isActive = true
    }
}
