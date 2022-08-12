//
//  LeaguesResponse.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 12.08.2022.
//

import Foundation

struct LeaguesResponse: Decodable {
    let data: [AllLeagues]
}

struct AllLeagues: Decodable {
    let abbr: String
    let id: String
    let logos: Logos
    let name: String
}

struct Logos: Decodable {
    let light: String
    let dark: String
}
