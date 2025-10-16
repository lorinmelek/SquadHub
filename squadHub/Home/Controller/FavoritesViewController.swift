//
//  FavoritesViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

class FavoritesViewController: UIViewController {

    weak var coordinator: FavoritesCoordinator?
    private let contentView = FavoritesContentView()
    private let viewModel = FavoritesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        viewModel.loadTeams()
    }

    private func setupViewModel() {
        viewModel.delegate = self
    }

    private func setupUI() {
        view.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - FavoritesViewModelDelegate
extension FavoritesViewController: FavoritesViewModelDelegate {
    func favoritesViewModelDidLoadTeams(_ viewModel: FavoritesViewModel, teams: [Team]) {
        contentView.configure(favoriteTeams: teams)
    }

    func favoritesViewModelDidFailWithError(_ viewModel: FavoritesViewModel, error: Error) {
        print("Error loading teams: \(error.localizedDescription)")
    }
}
