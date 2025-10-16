//
//  TeamsViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 29.09.2025.
//

import UIKit

class TeamsViewController: UIViewController {

    weak var coordinator: TeamsCoordinator?
    private let contentView = TeamsContentView()
    private let viewModel = TeamsViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        contentView.delegate = self
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

// MARK: - TeamsViewModelDelegate
extension TeamsViewController: TeamsViewModelDelegate {
    func teamsViewModelDidLoadTeams(_ viewModel: TeamsViewModel, teams: [Team]) {
        contentView.configure(teams: teams)
    }

    func teamsViewModelDidFailWithError(_ viewModel: TeamsViewModel, error: Error) {
        print("Error loading teams: \(error.localizedDescription)")
    }
}

// MARK: - TeamsListViewDelegate
extension TeamsViewController: TeamsListViewDelegate {
    func teamsListView(_ view: TeamsListView, didSelectTeam team: Team) {
        coordinator?.showTeamDetail(team: team)
    }
}
