//
//  LeaguesListModels.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 23.08.2022.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SwiftUI

enum LeaguesList {

  enum Model {
    struct Request {
      enum RequestType {
        case getLeagues
      }
    }
    struct Response {
      enum ResponseType {
          case presentLeagues(leagues: LeaguesResponse)
      }
    }
    struct ViewModel {
      enum ViewModelData {
          case displayLeagues(leaguesViewModel: LeagueViewModel)
      }
    }
  }
}

struct LeagueViewModel {
    struct Cell: leagueCellViewModel {
        var id: String
        var title: String
        var iconUrlString: String
        var abbreviation: String
    }

    let cells: [Cell]
}
