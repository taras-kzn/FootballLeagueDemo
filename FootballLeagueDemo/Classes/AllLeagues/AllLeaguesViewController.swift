//
//  AllLeaguesViewController.swift
//  FootballLeagueDemo
//
//  Created by Denis Tarasov on 12.08.2022.
//

import UIKit

class AllLeaguesViewController: UIViewController {

    private var fetcher: DataFetcher = NetworkDataFetcher(networking: NetworkService())

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .gray
    }

}
