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

  var interactor: LeaguesListBusinessLogic?
  var router: (NSObjectProtocol & LeaguesListRoutingLogic)?

  // MARK: Object lifecycle

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }

  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }

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
  }

  func displayData(viewModel: LeaguesList.Model.ViewModel.ViewModelData) {

  }

}
