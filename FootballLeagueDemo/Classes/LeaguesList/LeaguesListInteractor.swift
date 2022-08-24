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
    private var fetcher: DataFetcherProtocol = NetworkDataFetcher(networking: NetworkService())

    func makeRequest(request: LeaguesList.Model.Request.RequestType) {
        if service == nil {
            service = LeaguesListService()
        }

        switch request {
        case .getLeagues:
            fetcher.getLeagues { [weak self] leaguesResponse in
                guard let leaguesResponse = leaguesResponse, let self = self else { return }
                self.presenter?.presentData(response: .presentLeagues(leagues: leaguesResponse))
            }
        }
    }
}
