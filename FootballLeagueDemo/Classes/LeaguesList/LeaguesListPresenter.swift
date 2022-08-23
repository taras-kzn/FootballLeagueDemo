//
//  LeaguesListPresenter.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 23.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LeaguesListPresentationLogic {
  func presentData(response: LeaguesList.Model.Response.ResponseType)
}

class LeaguesListPresenter: LeaguesListPresentationLogic {
  weak var viewController: LeaguesListDisplayLogic?

  func presentData(response: LeaguesList.Model.Response.ResponseType) {

  }

}
