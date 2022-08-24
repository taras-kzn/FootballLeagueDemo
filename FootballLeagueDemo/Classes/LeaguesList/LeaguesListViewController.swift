//
//  LeaguesListViewController.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 23.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LeaguesListDisplayLogic: class {
    func displayData(viewModel: LeaguesList.Model.ViewModel.ViewModelData)
}

class LeaguesListViewController: UIViewController, LeaguesListDisplayLogic {

    //MARK: Properties
    var interactor: LeaguesListBusinessLogic?
    var router: (NSObjectProtocol & LeaguesListRoutingLogic)?

    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    // MARK: Setup
    private func setup() {
        let viewController        = self
        let interactor            = LeaguesListInteractor()
        let presenter             = LeaguesListPresenter()
        let router                = LeaguesListRouter()
        viewController.interactor = interactor
        viewController.router     = router
        interactor.presenter      = presenter
        presenter.viewController  = viewController
        router.viewController     = viewController
    }

    // MARK: Routing

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        configure()
        setupConstraintsTableView()
    }

    func displayData(viewModel: LeaguesList.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .some:
            print("some viewController")
        case .displayLeagues:
            print("displayLeagues view controller")
        }

    }

    //MARK: - configure
    private func configure() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(LeaguesCodeCell.self, forCellReuseIdentifier: LeaguesCodeCell.reuseId)
    }

    //MARK: - Setup Constraints
    private func setupConstraintsTableView() {
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension LeaguesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeaguesCodeCell.reuseId, for: indexPath) as? LeaguesCodeCell else { fatalError("Could not dequeue cell with identifier: (T.defaultReuseIdentifier)") }

        cell.set(viewModel: "LA la league")
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("select row")
//        interactor?.makeRequest(request: .getLeagues)
//    }

//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 300
//    }


}

extension LeaguesListViewController: UITableViewDelegate {

}
