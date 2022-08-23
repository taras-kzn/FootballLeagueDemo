//
//  NetworkDataFetcher.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 12.08.2022.
//

import Foundation

protocol DataFetcherProtocol {
    func getLeagues(response: @escaping (LeaguesResponse?) -> Void)
}

struct NetworkDataFetcher: DataFetcherProtocol {
    let networking: NetworkingProtocol

    init(networking: NetworkingProtocol) {
        self.networking = networking
    }

    func getLeagues(response: @escaping (LeaguesResponse?) -> Void) {
        networking.request(path: API.leagues) { (data, error) in
            if let error = error {
                print("Error request Data: \(error.localizedDescription)")
                response(nil)
            }
            let decoder = self.decodeJSON(type: LeaguesResponse.self, data: data)
            response(decoder)
        }
    }

    private func decodeJSON<T: Decodable>(type: T.Type, data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data, let response = try? decoder.decode(type.self, from: data) else { return nil }
        return response
    }
}
