//
//  HomeViewController.swift
//  SquadHub
//
//  Created by LORIN VURAL on 26.09.2025.
//

import UIKit

class HomeViewController: UIViewController {

    weak var coordinator: HomeCoordinator?

    private let headerView = HomeHeaderView()
    private let summaryView = SummaryView()
    private let teamsListView = TeamsListView()

    private let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupViewModel()
        teamsListView.delegate = self
        viewModel.loadTeams()
    }

    private func setupViewModel() {
        viewModel.delegate = self
    }

    private func setupUI() {
        view.backgroundColor = .white

        view.addSubview(headerView)
        view.addSubview(summaryView)
        view.addSubview(teamsListView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        summaryView.translatesAutoresizingMaskIntoConstraints = false
        teamsListView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -10),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 60),

            summaryView.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: 10),
            summaryView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            summaryView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            summaryView.heightAnchor.constraint(equalToConstant: 40),

            teamsListView.topAnchor.constraint(equalTo: summaryView.bottomAnchor, constant: 10),
            teamsListView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            teamsListView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            teamsListView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])

        headerView.configure(title: "Home")
    }
}

// MARK: - HomeViewModelDelegate

extension HomeViewController: HomeViewModelDelegate {
    func homeViewModelDidLoadTeams(_ viewModel: HomeViewModel, teams: [Team]) {
        summaryView.configure(teamCount: viewModel.totalTeams, totalMembers: viewModel.totalMembers)
        teamsListView.configure(with: teams)
    }

    func homeViewModelDidFailWithError(_ viewModel: HomeViewModel, error: Error) {
    }
}

// MARK: - TeamsListViewDelegate

extension HomeViewController: TeamsListViewDelegate {
    func teamsListView(_ view: TeamsListView, didSelectTeam team: Team) {
        coordinator?.showTeamDetail(team: team)
    }
}
