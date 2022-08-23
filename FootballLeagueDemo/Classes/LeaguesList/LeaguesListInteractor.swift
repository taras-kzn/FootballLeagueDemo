//
//  LeaguesListInteractor.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 23.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol LeaguesListBusinessLogic {
  func makeRequest(request: LeaguesList.Model.Request.RequestType)
}

class LeaguesListInteractor: LeaguesListBusinessLogic {

  var presenter: LeaguesListPresentationLogic?
  var service: LeaguesListService?

  func makeRequest(request: LeaguesList.Model.Request.RequestType) {
    if service == nil {
      service = LeaguesListService()
    }
  }

}
