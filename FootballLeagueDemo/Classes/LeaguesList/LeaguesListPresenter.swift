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
        switch response {
        case .presentLeagues(leagues: let leagues):

            let cells = leagues.data.map { leagues in
                cellViewModel(from: leagues)
            }

            let leaguesViewModel = LeagueViewModel.init(cells: cells)
            viewController?.displayData(viewModel: .displayLeagues(leaguesViewModel: leaguesViewModel))
        }
    }

    private func cellViewModel(from data: AllLeagues) -> LeagueViewModel.Cell {
        return LeagueViewModel.Cell.init(title: data.name,
                                         iconUrlString: data.logos.light,
                                         abbreviation: data.abbr)
    }
}
