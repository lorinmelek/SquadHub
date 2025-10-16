//
//  SearchCoordinator.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init() {
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        let searchVC = SearchViewController()
        searchVC.coordinator = self
        navigationController.pushViewController(searchVC, animated: false)
    }

    func showTeamDetail(team: Team) {
        let teamDetailVC = TeamDetailViewController(team: team)
        navigationController.pushViewController(teamDetailVC, animated: true)
    }
}
