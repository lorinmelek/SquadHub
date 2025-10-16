//
//  MainTabBarCoordinator.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import UIKit

class MainTabBarCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    let tabBarController: MainTabBarController

    init() {
        self.navigationController = UINavigationController()
        self.tabBarController = MainTabBarController()
    }

    func start() {
        let homeCoordinator = HomeCoordinator()
        let searchCoordinator = SearchCoordinator()
        let favoritesCoordinator = FavoritesCoordinator()
        let teamsCoordinator = TeamsCoordinator()

        addChildCoordinator(homeCoordinator)
        addChildCoordinator(searchCoordinator)
        addChildCoordinator(favoritesCoordinator)
        addChildCoordinator(teamsCoordinator)

        homeCoordinator.start()
        searchCoordinator.start()
        favoritesCoordinator.start()
        teamsCoordinator.start()

        let viewControllers = [
            homeCoordinator.navigationController,
            searchCoordinator.navigationController,
            favoritesCoordinator.navigationController,
            teamsCoordinator.navigationController
        ]

        tabBarController.setViewControllers(viewControllers)
    }
}
