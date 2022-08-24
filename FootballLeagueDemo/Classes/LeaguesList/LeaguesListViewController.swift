//
//  LeaguesListViewController.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 23.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LeaguesListDisplayLogic: AnyObject {
    func displayData(viewModel: LeaguesList.Model.ViewModel.ViewModelData)
}

class LeaguesListViewController: UIViewController, LeaguesListDisplayLogic {

    //MARK: Properties
    var interactor: LeaguesListBusinessLogic?
    var router: (NSObjectProtocol & LeaguesListRoutingLogic)?

    private var leagueViewModel = LeagueViewModel.init(cells: [])

    private var loadingIndicator: UIActivityIndicatorView = {
        let loading = UIActivityIndicatorView()
        loading.hidesWhenStopped = true
        loading.startAnimating()
        loading.color = .orange
        loading.style = .large
        return loading
    }()

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
        setupTable()
        setupConstraintsTableView()
        setupConstraintsLoadingIndicator()
        interactor?.makeRequest(request: .getLeagues)
    }

    func displayData(viewModel: LeaguesList.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayLeagues(leaguesViewModel: let leaguesViewModel):
            leagueViewModel = leaguesViewModel
            tableView.reloadData()
            loadingIndicator.stopAnimating()
        }
    }

    //MARK: - Setup
    private func setupTable() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        tableView.register(LeaguesCodeCell.self, forCellReuseIdentifier: LeaguesCodeCell.reuseId)
        tableView.backgroundColor = .backgroundLightColor()
        tableView.showsVerticalScrollIndicator = false
    }

    //MARK: - Setup Constraints
    private func setupConstraintsTableView() {
        view.addSubview(tableView)

        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }

    private func setupConstraintsLoadingIndicator() {
        tableView.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false

        loadingIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loadingIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
}

extension LeaguesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagueViewModel.cells.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: LeaguesCodeCell.reuseId, for: indexPath) as? LeaguesCodeCell else { fatalError("Could not dequeue cell with identifier: (T.defaultReuseIdentifier)") }
        let cellViewModel = leagueViewModel.cells[indexPath.row]
        cell.set(viewModel: cellViewModel)
        return cell
    }

//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("select row")
//        interactor?.makeRequest(request: .getLeagues)
//    }
}

extension LeaguesListViewController: UITableViewDelegate {

}
