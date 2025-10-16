//
//  HomeCoordinator.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//
import UIKit

class HomeCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    init() {
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        let homeVC = HomeViewController()
        homeVC.coordinator = self
        navigationController.pushViewController(homeVC, animated: false)
    }

    func showTeamDetail(team: Team) {
        let teamDetailVC = TeamDetailViewController(team: team)
        teamDetailVC.coordinator = self
        navigationController.pushViewController(teamDetailVC, animated: true)
    }
}
