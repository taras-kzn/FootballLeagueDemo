//
//  NetworkService.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 12.08.2022.
//

import Foundation

protocol NetworkingProtocol {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkService: NetworkingProtocol {
    func request(path: String, completion: @escaping (Data?, Error?) -> Void) {
        let url = self.url(from: path)
        let request = URLRequest(url: url)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }

    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data,error)
            }
        }
    }

    private func url(from path: String) -> URL {
        var components = URLComponents()
        components.scheme = API.scheme
        components.host = API.host
        components.path = API.leagues

        let url = components.url!
        return url
    }
}
