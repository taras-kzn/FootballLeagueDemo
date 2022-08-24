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
        case some
        case getLeagues
      }
    }
    struct Response {
      enum ResponseType {
        case some
        case presentLeagues
      }
    }
    struct ViewModel {
      enum ViewModelData {
        case some
        case displayLeagues
      }
    }
  }
}
