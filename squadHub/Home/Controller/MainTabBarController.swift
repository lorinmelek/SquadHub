//
//  MainTabBarController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

class MainTabBarController: UIViewController {

    private let tabBarView = TabBarView()
    private var viewControllers: [UIViewController] = []
    private var currentViewController: UIViewController?
    private var selectedIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }

    func setViewControllers(_ controllers: [UIViewController]) {
        viewControllers = controllers
        if !controllers.isEmpty {
            selectViewController(at: 0)
        }
    }

    private func setupTabBar() {
        view.addSubview(tabBarView)
        tabBarView.translatesAutoresizingMaskIntoConstraints = false
        tabBarView.delegate = self

        NSLayoutConstraint.activate([
            tabBarView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tabBarView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarView.heightAnchor.constraint(equalToConstant: 83)
        ])
    }

    private func selectViewController(at index: Int) {
        guard index < viewControllers.count else { return }

        let newVC = viewControllers[index]
        addChild(newVC)
        view.insertSubview(newVC.view, belowSubview: tabBarView)

        newVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            newVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            newVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            newVC.view.bottomAnchor.constraint(equalTo: tabBarView.topAnchor)
        ])

        newVC.didMove(toParent: self)
        currentViewController = newVC
        selectedIndex = index

        tabBarView.selectTab(at: index)
    }
}

extension MainTabBarController: TabBarViewDelegate {
    func tabBarView(_ tabBarView: TabBarView, didSelectTabAt index: Int) {

        if index == selectedIndex {
            if let navController = viewControllers[index] as? UINavigationController {
                navController.popToRootViewController(animated: true)
            }
        }

        selectViewController(at: index)
    }
}
