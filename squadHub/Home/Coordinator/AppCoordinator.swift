//
//  AppCoordinator.swift
//  SquadHub
//
//  Created by LORIN VURAL on 13.10.2025.
//

import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController
    var childCoordinators: [Coordinator] = []

    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
        self.navigationController.navigationBar.isHidden = true
    }

    func start() {
        let mainTabBarCoordinator = MainTabBarCoordinator()
        addChildCoordinator(mainTabBarCoordinator)

        window.rootViewController = mainTabBarCoordinator.tabBarController
        window.makeKeyAndVisible()

        mainTabBarCoordinator.start()
    }
}
