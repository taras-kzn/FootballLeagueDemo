//
//  WebImageView.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 24.08.2022.
//

import Foundation
import UIKit

//TODO: Можно будет сделать отдельную библиотеку для других проектов. SPM пакет
class WebImageView: UIImageView {

    func set(imageUrl: String) {
        guard let url = URL(string: imageUrl) else { return }

        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            self.image = UIImage(data: cachedResponse.data)
            return
        }

        let dataTask = URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            DispatchQueue.main.async {
                if let data = data, let response = response {
                    self?.image = UIImage(data: data)
                    self?.handleLoaderImage(data: data, response: response)
                }
            }
        }
        dataTask.resume()
    }

    private func handleLoaderImage(data: Data, response: URLResponse) {
        guard let responseUrl = response.url else { return }
        let cashedResponse = CachedURLResponse(response: response, data: data)
        URLCache.shared.storeCachedResponse(cashedResponse, for: URLRequest(url: responseUrl))
    }
}
